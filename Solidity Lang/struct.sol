// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract structs{
    enum stages{taken, preparing, boxed, shipped}
    struct order{
        string userName;
        uint[] productID;
        address userAdress;
        stages stageStatus;
    }
    //orderlari alip kayitta tutacagimiz strct dizisi
    order[] private orders;
    address private owner;

    constructor(){
        owner = msg.sender;
    }

    //bir struct olusturup struct dizimize push ediyoruz.
    function takenOrder(string memory _username, uint[] memory productIDs) isMissing(productIDs) external  returns(uint256){
        // first way to assign a value to our structure
        // order memory Order;//local olarak olusturdugumuz degiskeni array e eklicez
        // Order.userName = _username;
        // Order.userAdress = msg.sender;//transaction yapan kisi user olacak
        // Order.productID = productIDs;
        // Order.stageStatus = stages.taken;

        // second way to assign a value to our structure(I recommend this bcz it is way better for readibility)
        orders.push(
            order({
                userName: _username,
                userAdress: msg.sender,
                productID: productIDs,
                stageStatus: stages.taken
            })
        );

        // third way to assign a value to our structure
        //orders.push(order(_username, productIDs, msg.sender, stages.taken));
        //orders.push(Order);
        return orders.length;
    }

    function advanceOrder(uint256 _orderID) isOwner isValid(_orderID) isAlreadyShip(_orderID) external {
        order storage Order = orders[_orderID];//points to _orderID'th array eleman

        if(Order.stageStatus == stages.taken)
            Order.stageStatus = stages.preparing;
        else if(Order.stageStatus == stages.preparing)
            Order.stageStatus = stages.boxed;
        else if(Order.stageStatus == stages.boxed)
            Order.stageStatus = stages.shipped;
    }

    function getOrders() public view returns(order[] memory){
        return(orders);
    }

    function changeusername(string memory _username, uint256 orderID) isCustomer(orderID) isValid(orderID) external {
        order storage Order = orders[orderID];
        Order.userName = _username;
    }

    modifier isValid(uint256 _orderID){
        require(_orderID < orders.length, "Invalid order ID.");
        _;
    }

    modifier isMissing(uint256[] memory productIDs){
        require(productIDs.length > 0, "Products are missing.");
        _;
    }

    modifier isOwner{
        require(msg.sender == owner, "You are not authorized.");
        _;
    }

    modifier isCustomer(uint256 ordID){
        require(orders[ordID].userAdress == msg.sender, "You are not customer.");
        _;
    }

    modifier isAlreadyShip(uint256 _orderID){
        require(orders[_orderID].stageStatus != stages.shipped, "Order is already shipped.");
        _;
    }
}