pragma solidity ^0.5.17;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract AcradeToken {
    using SafeMath for uint;

    address payable owner = msg.sender;
    string public symbol = "ARCD";
    uint public exchangeRate = 100;

    mapping(address => uint) balances; //accepts an account address as key and account balance as value. where the value is an uint

    function balance() public view returns(uint){
        return balances[msg.sender];
    }

    function transfer(address recipient, uint value) public{
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[msg.sender] = balances[recipient].add(value);
    }

    function purchase() public payable {
        uint amount = msg.value.mul(exchangeRate);
        balances[msg.sender] = balances[msg.sender].add(amount);
        owner.transfer(msg.value);
    } 

    function mint(address recipient, uint value) public {
        require(msg.sender == owner, "you are not allowed to mint tokens");
        balances[recipient] = balances[recipient].add(value);
    }


}