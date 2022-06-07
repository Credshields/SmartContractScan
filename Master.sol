pragma solidity 0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";


contract MasterToken is Ownable {
    function dangerousWithdraw() public returns (bool) {
        address owner;
        if (tx.origin == owner) {
            return true;
        }
        string memory origin = "foo";
        if (msg.sender != tx.origin) {
            revert();
        }
        require(tx.origin == msg.sender);
        owner = tx.origin;
    }

    function burnToken(address account, uint256 amount) external onlyOwner{
        _burn(account, amount);
    }

    function _burn(address account, uint256 amount) internal {
        require(msg.sender == account);
        require(amount > 0);
        require(balanceOf(account) >= amount);
        balances[account] = balances[account].sub(amount);
    }
}