import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "dotenv/config";
require("dotenv").config();

const config: HardhatUserConfig = {
  solidity: "0.8.19",
  networks: {
    // sepolia: {
    //   url: process.env.SEPOLIARPC,
    //   //@ts-ignore
    //   accounts: [process.env.PRIVATEKEY],
    // },
    goerli: {
      url: process.env.GOERLIRPC,
      //@ts-ignore
      accounts: [process.env.PRIVATEKEY],
    }
  },
  etherscan: {
    apiKey: {
      // sepolia: "WnYSbY37gwkjXxz36dPsPbypx4Damx7s",
      goerli: "RAf0mVJjlvix1x8IqurRFPg_XeOoRPgr",
    },
  },
};

export default config;
