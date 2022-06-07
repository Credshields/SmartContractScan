pragma solidity 0.8.4;

contract Backup {
    function tokenBackup() public{
        selfdestruct(msg.sender);
    }
}