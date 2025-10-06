pragma solidity ^0.8.30;

// SPDX-License-Identifier: MIT

import "truffle/Assert.sol";
import "truffle/DeployedAdresses.sol";
import "../contracts/GameManager.sol";

contract testGameManager {
    function testInitialHighscoreIsZero() public {
        GameManager gameManager = GameManager(DeployedAddresses.GameManager());

        (address[10] memory top10Addresses, uint[10] memory top10Wins) = gameManager.getTop10();

        Assert.equal(top10Wins[0], 0, "Initially there should be no wins at all");
        Assert.equal(top10Addresses[0], address(0), "Initially there should be nobody on our top ten list");
    }
}