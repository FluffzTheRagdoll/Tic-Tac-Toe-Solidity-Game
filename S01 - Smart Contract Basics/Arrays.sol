pragma solidity ^0.5.0;

contract C07Arrays {
    uint[5] public arrayFixedSize;
    uint[] public arrayDynamicSize;
    uint[2][] public arrayFixedDynamic;

    function getFixedDynamicLength() view public returns(uint, uint) {
        return (arrayFixedDynamic.length, arrayFixedDynamic[0].length);
    }

    function getFixedArray() view public returns(uint[5] memory) {
        return arrayFixedSize;
    }

    function getDynamicAll() view public returns(uint[2][] memory) {
        return arrayFixedDynamic;
    }

    function increaseDynamicLenght() public {
        arrayDynamicSize.length++;
        arrayDynamicSize[arrayDynamicSize.length-1] = 555;
    }

    function increaseFixedDynamicLenght() public {
        arrayFixedDynamic.length++;
        arrayFixedDynamic[arrayFixedDynamic.length-1][0] = 123;
        arrayFixedDynamic[arrayFixedDynamic.length-1][1] = 234;

    }
}