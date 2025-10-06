pragma solidity ^0.5.17;

contract C09ViewPureFunctions {
    uint myUint = 5;

    function updateMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function getMyUint() public view returns(uint) {
        return myUint;
    }

    function multiplyByFive(uint _someNumber) public pure returns(uint) {
        return _someNumber * 5;
    }

    function fiveTimesMyUint() public view returns(uint) {
        return multiplyByFive(myUint);
    }
}