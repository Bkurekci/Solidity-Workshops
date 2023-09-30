// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract helloworld{
    function get()public pure returns(string memory){
        return ("Hello World!");
    }
}

//"Hello World" with constructor
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract helloworld{
    string private message;

    constructor (string memory _message){
        message = _message;
    }
    
    function get()public view returns(string memory){
        return message;
    }
}
