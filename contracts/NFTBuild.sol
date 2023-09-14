// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";

contract NFTBuild is ERC721, VRFConsumerBaseV2 {
    bytes32 keyHash = 0x79d3d8832d904592c0bf9818b621522c988bb8b0c05cdc3b15aea1b6e8db0c15;
    uint64 subscriptionId = 14226;

    uint256 public tokenCounter;
    
    constructor() ERC721 ("BuilD2", "BD2") VRFConsumerBaseV2(keyHash) {
        tokenCounter = 0;
    }

    function requestRandomNFT() public returns (bytes32 requestId) {
        return requestRandomness(keyHash, subscriptionId);
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomNumber) external override {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);
        tokenCounter = tokenCounter + 1;
    }

    function mintNFT() public {
        requestRandomNFT();
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        _requireMinted(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI)): "";
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmVyUmqbn3yi8HLkRDZXXohhxUaVXLBHzzzsNirCVJw4gG";
    }
}
