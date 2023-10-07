// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Mapping{
    mapping(address => bool) public allowance;
    address private owner;
    int public count;
    
    constructor(address _owner) {
        //owner= 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        owner = _owner;
        //allowance once ve bos oldugu icin onceki derlememde addAdmin calisirken allowance e ihtiyaci vardi
        //bu mapping calisirken default olarak null atadigi icin hata mesaji firlatti.
        allowance[owner] = true;
    }

    modifier isOwner(){
        require(msg.sender == owner, "You are not owner!");
        _;
    }

    modifier isAdmin(){
        require(allowance[msg.sender], "You are not allowed!");
        _;
    }
    //sadece adminler artis yapabilir
    function increament(int number) isAdmin public{
        count += number;
    }

    function anIncreament() public{
        count++;
    }
    //sadece owner admin ekleyebilir.
    function addAdmin(address _address)isOwner public{
        allowance[_address] = true;
    }

    /*function getOwner()isOwner public view returns(string memory){
        return ("You are owner! >.<");
    }*/

    function getAdmin()isAdmin public view returns(string memory){
        return ("You are admin!");
    }
}