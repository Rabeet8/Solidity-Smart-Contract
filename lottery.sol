// SPDX License Idenifier: MIT
pragma solidity ^0.8.7;
contract lottery{
    address owner;
    uint startTime;
    uint endTime;

    address[] allAddress;
    
    constructor(){
        owner = msg.sender;
    }

    function startLottery(uint lotteryPeriod) public{
        require(msg.sender == owner,"You donnot have the permission to call this function")
        startTime = block.timestamp;
        endTime = startTime + startLottery;
    }
    function buyTicket() public payable{
        require(block.timestamp < endTime, "The lottery has ended");
        require(msg.value = 1 ether, "The amount")
        allAddress.push(msg.sender);
    }

    function contractBalance() public view return (uint){
        return address(this).balance;
    }
    function endLottery() public payable {
        return (msg.sender = owner, "You are not the owner");
        require(block.timestamp > endTime, "The lottery is still going on...")
    }
    // array of alladress[] containes all the different address
    uint indexofWinner = uint(keccak256( abi.encodePacked(block.timestamp,block.difficulty,msg.sender))) % allAddress.length;

    address winner =allAddress[indexofWinner];
    

    (bool sent,) = winner.call(value : address(this).balance(""));
    return sent;
}