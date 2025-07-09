pragma solidity 0.8.30;

import {AddressLib} from "./AddressLib.sol";
import {OwnershipNFT} from "./OwnershipNFT.sol";

contract LeverageLogic {
    address immutable factory;

    mapping(address => bool) public authorized;

    constructor() {
        factory = msg.sender;
    }
    
    modifier isOwner() {
        uint256 tokenId = AddressLib._fromAddressToTokenId(address(this));
        require(OwnershipNFT(factory).ownerOf(tokenId) == msg.sender, "Not owner");
        _;
    }

    /// === PERMISSIONS === ///

    modifier isAuthorized() {
        require(authorized[msg.sender], "Not authorized");
        _;
    }

    function authorize(address user, bool auth) external isOwner {
        authorized[user] = auth;
    }



    /// === LEVERAGE LOGIC ===

    // NOTE: May not need any state variables
    enum LeverageType {
        MORPHO,
        AAVE
    }

    struct CallData {
        address target;
        bytes data;
        uint256 value;
    }

    function _decodeLeverageType(bytes memory data, LeverageType leverageType)
        internal
        pure
        returns (CallData memory)
    {
        if (leverageType == LeverageType.MORPHO) {
            // TODO: This may be different based on uses
            return abi.decode(data, (CallData));
        } else if (leverageType == LeverageType.AAVE) {
            return abi.decode(data, (CallData));
        }
    }

    function leverage(LeverageType leverageType, bytes memory data) external virtual {
        CallData memory callData = _decodeLeverageType(data, leverageType);
        (bool success, bytes memory returnData) = callData.target.call{value: callData.value}(callData.data);
        require(success, "Leverage failed");
    }
}
