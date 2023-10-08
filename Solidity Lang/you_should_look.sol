pragma solidity ^0.8;

//B careful when using this code!!!!!!!!

contract mappinG{
    string public acceptmsg = "yes you're already in";

    mapping(address => int256) private hello;
    mapping(address => bool) private register;

    function registered(int256 _num) public {
        require(!isregister(), acceptmsg);
        register[msg.sender] = true;
        hello[msg.sender] = _num;
    }

    function isregister() public view returns(bool){
        return register[msg.sender];
    }

    function getInfo() public view returns(bool, int256){
        return (register[msg.sender], hello[msg.sender]);
    }

    //erases the infos from the storage
    function deleteRequire() public{
        require(isregister(), "You are already not registered.");
        delete register[msg.sender];
        delete hello[msg.sender];
    }
}

contract nestedMapping{
    address private owner;
    //can do the array that holds the borrowers (I will add when I learn how to use arrays and having knowladge in storage management in blockchain)
    constructor() {
        owner = example_address;//enter an address that will be the owner
    }

    mapping(address => mapping(address => bool)) private borrower;
    mapping(address => mapping(address => uint256)) private debt;

    modifier isowner{
        require(msg.sender == owner, "You don't have authority");
        _;
    }

    //only owner of the contract can add borrower
    function addBorrowers(address _borrower, uint256 amount) isowner public{
        borrower[owner][_borrower] = true;
        debt[owner][_borrower] = amount;
    }

    //only owner of the contract can increase the debt value
    function incDebt(address _borrower, uint256 amount) isowner public{
        debt[owner][_borrower] += amount;
    }

    //borrowers can reduces their debts.(This code is superficial code so you can not do the extreme things)
    function redDebt(address _borrower, uint256 _amount) public{
        require(borrower[owner][_borrower], "you are not borrower");
        debt[owner][_borrower] -= _amount;
    }

    //borrowers can see their debt
    function getDebt(address _borrower) public view returns(uint256){
        require(borrower[owner][_borrower], "you are not borrower");
        return(debt[owner][_borrower]);
    }
}