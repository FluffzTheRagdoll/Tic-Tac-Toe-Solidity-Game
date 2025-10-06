pragma solidity ^0.5.17;

contract C08MappingsStruct {

    struct MyStruct {
        uint balance;
        bool isSet;
        uint lastUpdated;
    }

    mapping(address => MyStruct) public myBalanceForAddress;

    function depositStruct() public payable {
        myBalanceForAddress[msg.sender].balance += msg.value;
        myBalanceForAddress[msg.sender].isSet = true;
        myBalanceForAddress[msg.sender].lastUpdated = now;
    }

    function withdrawStruct(address payable _to, uint _amount) public {
        if(myBalanceForAddress[msg.sender].balance >= _amount) {
            myBalanceForAddress[msg.sender].balance -= _amount;
            _to.transfer(_amount);
        }
    }
}