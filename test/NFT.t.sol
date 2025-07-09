// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {OwnershipNFT} from "../src/OwnershipNFT.sol"; 

contract NFTTest is Test {
    OwnershipNFT public nft;

    function setUp() public {
        nft = new OwnershipNFT();
    }
}
