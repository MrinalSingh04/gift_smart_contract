// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GiftVault {
    struct Gift {
        address sender;
        uint256 amount;
        bytes32 passphraseHash;
        uint256 unlockTime;
        bool claimed;
    }

    mapping(address => Gift) public gifts;

    event GiftSent(address indexed sender, address indexed recipient, uint256 amount, uint256 unlockTime);
    event GiftClaimed(address indexed recipient, uint256 amount);
    event GiftWithdrawn(address indexed sender, uint256 amount);

    function sendGift(address recipient, string memory passphrase, uint256 unlockTime) external payable {
        require(msg.value > 0, "Gift must have value");
        require(gifts[recipient].amount == 0, "Recipient already has a pending gift");

        gifts[recipient] = Gift({
            sender: msg.sender,
            amount: msg.value,
            passphraseHash: keccak256(abi.encodePacked(passphrase)),
            unlockTime: unlockTime,
            claimed: false
        });

        emit GiftSent(msg.sender, recipient, msg.value, unlockTime);
    }

    function claimGift(string memory passphrase) external {
        Gift storage gift = gifts[msg.sender];
        require(gift.amount > 0, "No gift available");
        require(block.timestamp >= gift.unlockTime, "Gift is locked");
        require(!gift.claimed, "Gift already claimed");
        require(keccak256(abi.encodePacked(passphrase)) == gift.passphraseHash, "Incorrect passphrase");

        uint256 amount = gift.amount;
        gift.claimed = true;
        gift.amount = 0;

        payable(msg.sender).transfer(amount);
        emit GiftClaimed(msg.sender, amount);
    }

    function withdrawGift(address recipient) external {
        Gift storage gift = gifts[recipient];
        require(msg.sender == gift.sender, "Only sender can withdraw");
        require(block.timestamp > gift.unlockTime, "Cannot withdraw before unlock time");
        require(!gift.claimed, "Gift already claimed");

        uint256 amount = gift.amount;
        gift.amount = 0;

        payable(msg.sender).transfer(amount);
        emit GiftWithdrawn(msg.sender, amount);
    }
}
