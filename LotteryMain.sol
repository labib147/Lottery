// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

error Lottery__SendMoreEth();
error Lottery__NotOwner();

contract Lottery {

    enum RaffleState {
        OPEN,
        CALCULATING
    }

    address public  owner;
    address payable[] public players;
    address payable[] public winners;

    uint public ticketId;
    uint public ticketNum;
    uint public ticketPrice;
    //uint public entryFee;
    uint public currentTime = block.timestamp;

    // Lottery Variables
    //uint256 private immutable i_entranceFee;
    

    
    mapping (uint=> address payable) public lotHis;
    mapping (uint=> address payable) public winHis;

    constructor() {
        owner = msg.sender;
        //i_entranceFee = ticketFee;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        // if (msg.sender == owner){
        //     revert Lottery__NotOwner();
        // }
        _;
    }

    // function enter() public payable {
    //     require(msg.value>9 wei, "Not enough funds");
    // }

    function setTicketPrice(uint setPrice) public onlyOwner  {
        ticketPrice = setPrice;
    }

    function buyTicket() public payable  {
        require(msg.value == ticketPrice, "Please input correct ticket price");
        players.push(payable (msg.sender));

        // if (msg.value > ticketPrice) {
        //     revert Lottery__SendMoreEth(); 
        // }
    }

    // function getCurrentTime() public  returns (uint){ // To get block.timestamp
    //     return block.timestamp;
    //     ticketNum  =  currentTime;              
    // }

    function potBalance() public view returns (uint){
        return address(this).balance; // address(this).balance returns balance of the contract
    }

    function getPlayers() public view returns (address payable[] memory){
        return players;
    }    
}
