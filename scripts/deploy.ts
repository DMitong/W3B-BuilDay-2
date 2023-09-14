import { ethers } from "hardhat";

async function main() {
  const build2 = await ethers.deployContract("NFTBuild", []);
  await build2.waitForDeployment();
  console.log(`This NFT is deployed to ${build2.target}`);

  console.log(await build2.tokenURI(1));
  
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
