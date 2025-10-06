pragma solidity ^0.8.30;

// SPDX-License-Identifier: MIT

import {ThreeInARow} from "./ThreeInARow.sol";
import {HighscoreManager} from "./HighscoreManager.sol";

contract GameManager {

    HighscoreManager public highscoremanager;

    event EventGameCreated(address _player, address _gameAddress);

    mapping(address => bool) allowedToEnterHighscore;

    constructor() {
        highscoremanager = new HighscoreManager(address(this));
    }

    modifier inGameHighscoreEditingOnly() {
        require(allowedToEnterHighscore[msg.sender], "Not allowed to enter highscores.");
        _;
    }

    function enterWinner(address _winner) public inGameHighscoreEditingOnly{
        highscoremanager.addWin(_winner);
    }

    function getTop10() public view returns(address[10] memory, uint[10] memory) {
        return highscoremanager.getTop10();
    }

    function startNewGame() public payable {
        ThreeInARow threeInARow = (new ThreeInARow){value: msg.value}(address(this), payable (msg.sender));
        allowedToEnterHighscore[address(threeInARow)] = true;
        emit EventGameCreated(msg.sender, address(threeInARow));
    }
}