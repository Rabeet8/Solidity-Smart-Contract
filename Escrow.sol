// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {

    event Approved(uint balance);
address public depositor;
    address public beneficiary;
    address public arbiter;

    function approve() external{
        require(msg.sender == arbiter, "Only the arbiter can approve");
        uint balance = address(this).balance;
       payable(beneficiary).transfer(address(this).balance);
       emit Approved(balance);
    }

onstructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        beneficiary = _beneficiary;
        arbiter = _arbiter;
    }

}
