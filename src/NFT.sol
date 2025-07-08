pragma solidity 0.8.30;

// Singleton

import {ERC721Upgradeable} from "@oz-up/contracts/token/ERC721/ERC721Upgradeable.sol";
import {LeverageLogic} from "./LeverageLogic.sol";

contract LeverageNFT is ERC721Upgradeable, LeverageLogic {
    address factory;

    function initialize(address to) public initializer {
        factory = msg.sender;
        _mint(to, 1);
    }
}
