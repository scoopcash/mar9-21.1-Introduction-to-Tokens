/*
Arcade Token
*/

// Construct your ArcadeToken contract below:

pragma solidity ^0.5.0;

contract AcradeToken {


    address payable owner = msg.sender;
    string public symbol = "ARCD";
    uint public exchangeRate = 100;

    mapping(address => uint) balances; //accepts an account address as key and account balance as value. where the value is an uint

    function balance() public view returns(uint){
        return balances[msg.sender];
    }

    function transfer(address recipient, uint value) public{
        balances[msg.sender] -= value;
        balances[recipient] += value;
    }

    function purchase() public payable {
        uint amount = msg.value * exchangeRate;
        balances[msg.sender] += amount;
        owner.transfer(msg.value);
    } 

    function mint(address recipient, uint value) public {
        require(msg.sender == owner, "you are not allowed to mint tokens");
        balances[recipient] += value;
    }


}