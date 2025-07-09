pragma solidity 0.8.30;

library AddressLib {
    function _fromTokenIdToAddress(uint256 tokenId) internal pure returns (address) {
        return address(uint160(tokenId));
    }

    function _fromAddressToTokenId(address addr) internal pure returns (uint256) {
        return uint256(uint160(addr));
    }
}