pragma solidity 0.7.4;

contract Backup {
    function tokenBackup() public{
        selfdestruct(msg.sender);
    }
}