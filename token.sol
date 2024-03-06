 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, ERC20Burnable, Ownable(msg.sender) {
    constructor(string memory _tokenName, string memory _tokenSymbol) ERC20(_tokenName, _tokenSymbol) {}

    function mintTokens(address _granteeAddress, uint256 _total) external onlyOwner {
        _mint(_granteeAddress, _total);
    }

    function burnTokens(uint256 _totalToDestroy) public  {
        _burn(msg.sender, _totalToDestroy);
    }

    function transferTokens(address _recipient, uint256 _totalToTransfer) public virtual  returns (bool) {
        _transfer(_msgSender(), _recipient, _totalToTransfer);
        return true;
    }
}
