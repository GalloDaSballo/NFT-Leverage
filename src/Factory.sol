// Singleton
pragma solidity 0.8.30;

import {UpgradeableBeacon} from "@openzeppelin/contracts/proxy/beacon/UpgradeableBeacon.sol";
import {BeaconProxy} from "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";
import {LeverageNFT} from "./NFT.sol";

// Factory
// LeverageNFT
// LeverageLogic

contract Factory is UpgradeableBeacon {
    constructor(address leverageNFTLogic) UpgradeableBeacon(address(leverageNFTLogic), msg.sender) {}

    function deployNewPosition() external returns (address) {
        BeaconProxy newProxy =
            new BeaconProxy(address(this), abi.encodeWithSelector(LeverageNFT.initialize.selector, msg.sender));
        return address(newProxy);
    }
}
