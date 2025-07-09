// Singleton
pragma solidity 0.8.30;

import {UpgradeableBeacon} from "@openzeppelin/contracts/proxy/beacon/UpgradeableBeacon.sol";
import {BeaconProxy} from "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";
import {OwnershipNFT} from "./OwnershipNFT.sol";
import {AddressLib} from "./AddressLib.sol";

// Factory
// LeverageNFT
// LeverageLogic

contract Factory {

    address immutable beacon;
    OwnershipNFT immutable ownershipNFT;
    constructor(address _beacon) {
        beacon = _beacon;
        ownershipNFT = new OwnershipNFT();   
    }

    function deployNewPosition() external returns (address) {
        // Deploy a new beacon proxy
        // Get the address
        // Encode it in the token Id
        address newProxy = address(new BeaconProxy(address(beacon), hex""));
        ownershipNFT.mint(msg.sender, AddressLib._fromAddressToTokenId(newProxy));
        return newProxy;
    }
}
