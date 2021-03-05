// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

import "@openzeppelin/contracts/drafts/ERC20Permit.sol";

contract CharmToken is ERC20Permit {
    constructor(address treasury)
        public
        ERC20Permit("Charm")
        ERC20("Charm", "CHARM")
    {
        // total supply is 100 million and decimal places is 18
        _mint(treasury, 1e8 * 1e18);
    }
}
