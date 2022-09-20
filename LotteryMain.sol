// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

/*Errors*/
error Lottery__SendMoreEth();
error Lottery__NotOwner();

contract Lottery {

    enum RaffleState {
        OPEN,
        CALCULATING
    }
    /*State Variables*/
    address public  owner;
    address[] public players;
    address[] public winners;

    uint[] public ticketId;
    uint[] public ticketNum; 
    uint   public ticketPrice;
    
    // Lottery Variables
    //uint256 private immutable i_entranceFee;
        
    mapping (uint=> address) public lotHis;
    mapping (uint=> address) public winHis;
    mapping (address=>uint[]) public ticketsBought;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // function userTickets(address ad) returns (uint256[]){
    //     return 
    // }

    function setTicketPrice(uint setPrice) public onlyOwner  {
        ticketPrice = setPrice;
    }

    function buyTicket() public payable  {
        require(msg.value == ticketPrice, "Please input correct ticket price");
        uint256 ticketNumber = block.timestamp;
        ticketId.push(ticketNumber);
        players.push(payable (msg.sender));
        ticketsBought[msg.sender].push(ticketNumber);

        // if (msg.value > ticketPrice) {
        //     revert Lottery__SendMoreEth(); 
        // }
    }

    function getCurrentTime() public view  returns (uint){ // To get block.timestamp
        return block.timestamp;
    }

    function potBalance() public view returns (uint){
        return address(this).balance; // address(this).balance returns balance of the contract
    }

    function getPlayers() public view returns (address[] memory){
        return players;
    }    
}
