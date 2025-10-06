pragma solidity ^0.5.17;

contract C11ExceptionsInSolidity {
    bool isRunning = false;
    address owner;

    mapping(address => uint) balance;
    
    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if(msg.sender == owner) {
            _;
        }
    }

    function setRunning(bool _running) public onlyOwner {
        isRunning = _running;
    }

    function depositMoney() public payable {
        require(isRunning, "The smart contract is not running currently!");
        balance[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(balance[msg.sender] >= _amount, "Your balance is not high enough.");
        balance[msg.sender] -= _amount;
        assert(balance[msg.sender] <= balance[msg.sender] + _amount);
        _to.transfer(_amount);
    }
}