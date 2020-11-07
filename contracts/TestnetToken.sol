// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract TestnetToken is ERC20 {
    using Address for address;
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    uint256 public mintAmount;

    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 _mintAmount
    ) public ERC20(name, symbol) {
        _setupDecimals(decimals);
        mintAmount = _mintAmount;
    }

    function mint(address account) public {
        _mint(account, mintAmount);
    }
}
