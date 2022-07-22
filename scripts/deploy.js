

const main = async () => {

      // # # # # # # # # # # # # # # # # # # # # # # # # # # # 
      //
      // # CONTRACT WITH THE NFT ARTWORK STORED IN IPFS/PINATA 
      //
      // # # # # # # # # # # # # # # # # # # # # # # # # # # # 
      

      //hardhat will create a local etherem network to deploy the contract locally
      const nftContractFactoryIPFSHosting = await hre.ethers.getContractFactory('IPFSHosting');
      const nftContractIPFSHosting = await nftContractFactoryIPFSHosting.deploy();
      await nftContractIPFSHosting.deployed();
      console.log("IPFS Hosting Artwork deployed to:", nftContractIPFSHosting.address);

      const svg = require("../artwork/original/nft.svg")
      let SVGbase64 = await nftContractIPFSHosting.svgToImageURI(svg)
      console.log(SVGbase64)
      let txn = await nftContractIPFSHosting.mintTheNFT()
      await txn.wait() // Wait for it to be minted.
      console.log("The IPFS NFT was Minted :)") 
    

      console.log(
        '🎨 Your minted NFT:',
        `https://testnets.opensea.io/assets/${nftContractIPFSHosting.address}/0`,
        `\n`,
        `EtherScan: https://rinkeby.etherscan.io/address/${nftContractIPFSHosting.address}`
      );


  
      console.log("\n\n")

      // # # # # # # # # # # # # # # # # # # # # # # # # # # # 
      //
      // # CONTRACT WITH THE NFT ARTWORK STORED ON CHAIN (SVG) 
      //
      // # # # # # # # # # # # # # # # # # # # # # # # # # # # 
  
      const nftContractFactoryonChainHosting = await hre.ethers.getContractFactory("onChain");
      const nftContractonChainHosting = await nftContractFactoryonChainHosting.deploy();
      await nftContractonChainHosting.deployed();
      console.log("onChain Hosting Artwork deployed to: ", nftContractonChainHosting.address)

      let txnonChain = await nftContractonChainHosting.mintTheNFT()
      await txnonChain.wait() // Wait for it to be minted.
      console.log("The onChain NFT was Minted :)") 


      console.log(
        '🎨 Your minted NFT:',
        `https://testnets.opensea.io/assets/${nftContractonChainHosting.address}/0`,
        `\n`,
        `EtherScan: https://rinkeby.etherscan.io/address/${nftContractonChainHosting.address}`
      );

      // https://www.youtube.com/watch?v=nS9xP1hxg3w
      //https://github.com/PatrickAlphaC/chainlink-the-graph/blob/main/deploy/01_Deploy_FeedsNFT.js

  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();