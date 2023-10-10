// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract examples{

    //event writeTheNumbers(address);
    uint internal constant number = 22;
    address[] private userAddresses;
    
    //adds user addres to dynamic array
    function addUsers(address newUser) public{
        userAddresses.push(newUser);
    }

    //deletes the last user in the array
    function delUsers() public returns(string memory){
        userAddresses.pop();
        return ("Last user has been deleted.");
    }

    //shows users
    function showUsers() public view returns(address[] memory){
        return userAddresses;
    }

    //gives the array lenght
    function arrLenght() public view returns(uint256){
        return userAddresses.length;
    }
    
    //data manipulation(type-casting)
    function dataMan(int x) public pure returns(int){
        return x + int(number);
    }
}