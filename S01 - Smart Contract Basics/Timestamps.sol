pragma solidity ^0.5.17;

contract C10Time {
    uint biddingStartTimestamp = now;
    uint biddingDays = 10 days;

    function getCurentTimestamp() public view returns(uint) {
        return now;
    }

    function isBiddingStillOpen() public view returns(bool) {
        return (getCurentTimestamp() > biddingStartTimestamp && getCurentTimestamp() <= biddingStartTimestamp + biddingDays);
    }
}