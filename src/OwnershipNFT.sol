pragma solidity 0.8.30;

// Singleton

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract OwnershipNFT is ERC721 {
    address immutable factory;
    
    constructor() ERC721("OwnershipNFT", "ONFT") {
        factory = msg.sender;
    }

    function mint(address to, uint256 tokenId) external {
        require(msg.sender == factory, "Only factory can mint");
        _mint(to, tokenId);
    }
}
