//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BurnableNFT is ERC721 {

  address public minter;

  constructor() ERC721("BurnableNFT", "BURN") {  
    minter = 0x9aB3971e1b065701C72C5f3cAFbF33118dC51ae9;
  }

  function mint(address to) public {
    require(msg.sender == minter, "Only minter can mint");

    uint256 tokenId = totalSupply() + 1;
    _mint(to, tokenId);
  }

  function burn(uint256 tokenId) public {
    require(_isApprovedOrOwner(_msgSender(), tokenId), "Caller is not owner or approved");
    _burn(tokenId); 
  }

  function transferFrom(address, address, uint256) public override {
    revert("Tokens are not transferable");
  }

}
