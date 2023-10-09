// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract returnTypes{
    int number;

    //takes the value from the storage, so the function type is set to "view"
    function takeAndRetrn(int num2) public view returns(int){
        return sum(num2);
    }

    function sum(int num2) private view returns(int){
        return (number + num2);
    }

    //the fuction is nothing to do about storage, so we set it "pure"
    function doubleNum(int num2) public pure returns(int){
        int num3 = 2;
        return (num2*num3);
    }

    function none() public pure returns(int x, int y, bool z){
        x = 4;
        y = 11;
        z = false;
    }
}