// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;
import {IERC20} from "./interfaces/IERC20.sol";

contract VTU{
    address public tokenaddress;
    address public owner;
   
    mapping(uint256 => uint256) public phoneBalances;

    constructor(address token){
        tokenaddress = token;
        owner = msg.sender;
    }

    function topUp(uint256 phone,uint256 amount) public {
       IERC20(tokenaddress).transferFrom(msg.sender,address(this),amount);
       phoneBalances[phone] += amount;

    }

    function getBalance(uint256 phone) public view returns(uint256){
        return phoneBalances[phone];
    }

    function getDelegateBalance(address acct,uint256 phone) public {
      (bool success,) = acct.call(abi.encodeWithSignature("getBalance(uint256)",phone));

    }



}