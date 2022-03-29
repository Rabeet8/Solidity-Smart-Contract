// SPDX License Idenifier: MIT
pragma solidity ^0.8.7;

contract Auction{
    address payable public benficiary;
    uint public auctionEndTime;

    address public highestBidder;

    uint public highestBid;

    address public owner;

    mapping (address => uint) public pendingReturns;

    bool ended = false;

    event HighestBidIncrease(Address bidder, uint amount);
    event AuctionEnded(address winner, uintamount);
  
    constructor(uint _biddenTime, address payable _benficiary){
        beneficiary= _beneficiary;
        auctionEndTime = block.timestamp + _ biddingTime * 60;
    }
    function bid() public payable {
        require(block.timestamp <auctionEndTime, "The auctuin has already ended");
        require(msg.value > highestBid), " There is exist a higher bid already")

        pendingReturn[highestBidder] += highestBid;

        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncrease(msg.sender, msg.value);

     function withdraw() public returns (bool){
        uint amount = pendingReturns[msg.sender];
         if (amount > 0){
             pendingReturns[msg.sener] = 0;

             (bool sent,) = msg.sender.call{value: amount}("");

             if (!sent){
                 pendingReturns[msg.sender] = amount;
                 return false;
             }
         }
         return true;
        }
     function auctionEnd() oublic returns(bool){
         require(block.timestamp > auctionEndTime, "The auction is ot yet ended");
         require(!ended, "The function auctionEnd has already been called")

         ended = true;
         emit Auction(highestBidder,highestBid);

         (bool sent,) = beneficiary.call(value: highestBid)("");

         return sent;
     }
    }
}