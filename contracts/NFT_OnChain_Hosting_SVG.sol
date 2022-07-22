// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract onChain is ERC721URIStorage {

  // ids
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // We need to pass the name of our NFTs token and its symbol.
  constructor() ERC721 ("BRAZILNFT", "BRANFT") {
    console.log("The NFT Ethereum Contract");
  }

  // A function our user will hit to get their NFT.
  function mintTheNFT() public {
    
    uint256 newItemId = _tokenIds.current();  // Get the current tokenId, this starts at 0.
    console.log("the nft token is: ", newItemId);

    _safeMint(msg.sender, newItemId);  // Actually mint the NFT to the sender using msg.sender.

    /* https://jsonkeeper.com
        {
        "name": "EpicLordHamburger",
        "description": "An NFT from the highly acclaimed square collection",
        "image": "data:image/svg+xml;base64,INSERT_YOUR_BASE64_ENCODED_SVG_HERE"
        } 
        //https://jsonkeeper.com/b/FABD

        // for everyone seeing this, don't keep a link as a parameter, don't trust on third party to store the metadata
        // I have done it for educational purposes and I have no intention to commit to mainnet or use it for any goal
        // insert the plain json instead and handle the extra complexity that comes with it
        // using the abi function helps
    */
  
    _setTokenURI(newItemId, "https://jsonkeeper.com/b/FABD");   // Set the NFTs data.

    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();
  }
}