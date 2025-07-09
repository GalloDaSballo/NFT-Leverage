// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {AddressLib} from "../src/AddressLib.sol";

contract AddressLibTest is Test {

    // Halmos
   function check_no_classes(address a, address b) public view {
    vm.assume(a != b);

    uint256 idA = AddressLib._fromAddressToTokenId(a);
    uint256 idB = AddressLib._fromAddressToTokenId(b);
    assertNotEq(idA, idB);

    address addrA = AddressLib._fromTokenIdToAddress(idA);
    address addrB = AddressLib._fromTokenIdToAddress(idB);
    assertEq(addrA, a);
    assertEq(addrB, b);
    assertNotEq(addrA, addrB);



   }
}
