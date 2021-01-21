// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CharmToken is ERC20 {
    constructor() public ERC20("Charm", "CHARM") {
        // total supply is 100 million
        _mint(msg.sender, 1e8 * 1e18);
    }
}
