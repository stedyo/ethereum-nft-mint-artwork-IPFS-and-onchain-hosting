// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

// OpenZepellin implements the contracts so we don't have to
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// ERC721 - standard for non fungible token
contract IPFSHosting is ERC721URIStorage {

  // track the token id
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // We need to pass the name of our NFTs token and its symbol.
  constructor() ERC721 ("BRAZILNFT", "BRANFT") {
    console.log("The NFT Ethereum Contract");
  }

  // A function our user will hit to get their NFT.
  function mintTheNFT() public {
    
    // Get the current tokenId, this starts at 0.
    uint256 newItemId = _tokenIds.current();
    console.log("the nft token is: ", newItemId);

     // Actually mint the NFT to the sender using msg.sender.
    _safeMint(msg.sender, newItemId);



    /* Set the NFTs data.
      https://jsonkeeper.com with name, description, image link pinata + cloudflare 
      https://jsonkeeper.com/b/FGN4
      {
        "name":"with ipfs host",
        "description":"An NFT with ipfs storage on Pinata",
        "image":"https://cloudflare-ipfs.com/ipfs/QmYAb9b5taMD7jax4yE1guwNWGf89FYjSL5MGBue2ajgwn"
      }
    */
    
    _setTokenURI(newItemId, "https://jsonkeeper.com/b/FGN4");

    
    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();

    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

  }
}