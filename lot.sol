// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract Lottery {

    address public  owner;
    address payable[] public players;
    address payable[] public winners;

    uint public ticketId;
    uint public ticketPrice;
    uint public entryFee;


    mapping (uint=> address payable) public lotHis;
    mapping (uint=> address payable) public winHis;

    constructor() {
        owner = msg.sender;
    }

    function potBalance() public view returns (uint){
        return address(this).balance; // address(this).balance returns balance of the contract
    }

    function getPlayers() public view returns (address payable[] memory){
        return players;
    }

    function enter() public payable {
        require(msg.value>9 wei, "Not enough funds");
    }

    function buyTicket() public payable {}

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }


}
