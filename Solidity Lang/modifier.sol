// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract modifierM{
    address private owner;//our owner
    //contructor that keeps our owner's account address
    constructor(address _owner){
        owner = _owner;
    }
    //if the address is equals to owner's account address, can make changes in the functions in this contract
    modifier isitowner(){
        require(msg.sender == owner, "No, just no...");
        _;
    }
    //returns our name or smthn
    function blabla() isitowner public view returns(string memory){
        return ("0xBusra");
    }
}