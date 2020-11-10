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

    address public owner;
    mapping(address => uint256) public cooldownTimes;

    uint256 public faucetAmount;
    uint256 public faucetCooldown;

    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 _faucetAmount,
        uint256 _faucetCooldown
    ) public ERC20(name, symbol) {
        _setupDecimals(decimals);
        faucetAmount = _faucetAmount;
        faucetCooldown = _faucetCooldown;
        owner = msg.sender;
    }

    function getTokens(address account) public {
        require(
            block.timestamp > cooldownTimes[account].add(faucetCooldown),
            "cooldown"
        );
        cooldownTimes[account] = block.timestamp;
        _mint(account, faucetAmount);
    }

    function mint(address account, uint256 amount) public {
        require(msg.sender == owner, "!owner");
        _mint(account, amount);
    }
}
