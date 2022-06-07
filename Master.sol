pragma solidity ^0.7.6;

import "@openzeppelin/contracts/access/Ownable.sol";


contract MasterToken is Ownable {
    function dangerousWithdraw() public returns (bool) {
        address owner;
        // <yes> <report> SOLIDITY_TX_ORIGIN 12e802
        if (tx.origin == owner) {
            return true;
        }
        string memory origin = "foo";
        if (msg.sender != tx.origin) {
            revert();
        }
        require(tx.origin == msg.sender);
        // <yes> <report> SOLIDITY_TX_ORIGIN 12e802
        owner = tx.origin;
    }

    function burnToken(address account, uint256 amount) external {
        _burn(account, amount);
    }

    function _burn(address account, uint256 amount) internal {
        require(msg.sender == account);
        require(amount > 0);
        require(balanceOf(account) >= amount);
        balances[account] = balances[account].sub(amount);
    }
}