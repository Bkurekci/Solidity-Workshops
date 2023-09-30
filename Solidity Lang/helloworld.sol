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

//"Hello World!" with getter and setter functions
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract helloworld{
    string private message;
    //takes string from console
    function setter(string memory _message)public{
        message = _message;
    }
    //writes the string
    function getter()public view returns(string memory){
        return message;
    }
}
