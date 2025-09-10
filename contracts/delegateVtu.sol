// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

contract Dvtu{

    address public tokenaddress;
    address public owner;
    
    mapping(uint256 => uint256) public phoneBalances;

    constructor(address token){
        tokenaddress = token;
        owner = msg.sender;
    }
   
    function delegateTopup(address _contract, uint256 phone,uint256 amount) public{
     (bool success,) = _contract.delegatecall(abi.encodeWithSignature("topUp(uint256,uint256)",phone,amount));
     require(success,'Delegate Topup Failed');
     
    }

    function getBalance(uint256 phone) public returns(uint256) {
        return phoneBalances[phone];
    }
}