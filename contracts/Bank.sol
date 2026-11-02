// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank {

    mapping(address => uint256) private balances;

    // Deposit money
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    // Withdraw money
    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");
    }

    // Show balance
    function showBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}