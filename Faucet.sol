// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IToken {
    function mint(address _account, uint256 _amount) external;
}

contract Faucet {
    
    uint256 public constant amount = 1000000000;
    IToken public immutable token; // Reference to the token contract.
    
    /**
     * @dev Emitted when an `amount` of tokens is minted to a specific `account`.
     */
    event Mint(address indexed account, uint256 amount);

    /**
     * @dev Constructor.
     * @param _token Address of the token contract.
     */
    constructor(IToken _token) {
        token = _token;
    }
    
    /**
     * @dev Mints tokens to the sender.
     */
    function mint() public {
        mint(msg.sender);
    }

    /**
     * @dev Mints tokens to the specified `account`.
     * @param account Address of the account to mint tokens to.
     */
    function mint(address account) public {
        token.mint(account, amount);
        emit Mint(account, amount);
    }
}
