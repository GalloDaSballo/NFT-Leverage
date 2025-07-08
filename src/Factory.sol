// Singleton
pragma solidity 0.8.30;

import {LeverageNFT} from "./NFT.sol";

// Factory
// LeverageNFT
// LeverageLogic

contract Factory {

    function deployNewPosition() external returns (address){
        // TODO: Missing upgradeable pattern
        LeverageNFT leverageNFT = new LeverageNFT();
        leverageNFT.initialize(msg.sender);
        return address(leverageNFT);
    }
}