// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT {}

contract NFTMarket is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Truong's NFTs", "TNFT"){}

    function createNFT(string calldata tokenURI) public returns(uint256) {
        _tokenIds.increment();
        uint256 currentId = _tokenIds.current();
        _safeMint(msg.sender, currentId);
        _setTokenURI(currentId, tokenURI);
        return currentId;
    }
}

