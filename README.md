# Gift Smart Contract

## What is this project?

This project is a **Gift Smart Contract** written in Solidity that enables users to send, claim, and withdraw gifts securely on the Ethereum blockchain. The contract allows a sender to lock ETH as a gift for a recipient, who can later claim it using a **secret passphrase**. If the recipient fails to claim the gift, the sender can withdraw the unclaimed amount after a specific unlock time.

## Why build this?

Traditional gift-giving methods often rely on third parties (such as banks or online platforms), which may introduce delays, fees, or restrictions. This smart contract:

- **Eliminates intermediaries** by using blockchain for trustless transactions.
- **Ensures security** by locking funds until the recipient provides the correct passphrase.
- **Provides flexibility** with an unlock time, allowing senders to retrieve unclaimed gifts.
- **Introduces decentralized gifting**, which can be useful for birthdays, rewards, or surprise transfers.

## Features

✅ **Send Gift:** Users can deposit ETH with a recipient’s address and a secret passphrase.

✅ **Claim Gift:** The recipient can unlock and claim the ETH by providing the correct passphrase.

✅ **Time-Locked Withdrawal:** If the recipient doesn’t claim the gift after the unlock time, the sender can withdraw it.

✅ **Security:** Uses hashed passphrases to prevent unauthorized access.

## How it Works

1. **Sending a Gift:**

   - A sender calls the `sendGift` function, providing:
     - The recipient’s address
     - A secret passphrase
     - An unlock time
     - ETH (as the gift)
   - The contract stores the gift details securely.

2. **Claiming a Gift:**

   - The recipient calls the `claimGift` function and provides the secret passphrase.
   - The contract verifies the passphrase and transfers the ETH to the recipient.

3. **Withdrawing an Unclaimed Gift:**

   - If the recipient doesn’t claim the gift after the unlock time, the sender can withdraw it.

## Installation and Deployment

### Prerequisites

- Solidity (Version 0.8.20 or higher)
- Hardhat or Remix IDE
- MetaMask & Ethereum Testnet (Goerli, Sepolia, etc.)

### Steps to Deploy

1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/gift-smart-contract.git
   cd gift-smart-contract
   ```
2. Install dependencies (if using Hardhat):
   ```sh
   npm install
   ```
3. Compile the contract:
   ```sh
   npx hardhat compile
   ```
4. Deploy to a test network:
   ```sh
   npx hardhat run scripts/deploy.js --network goerli
   ```
5. Interact using Hardhat Console or a frontend interface.

## Smart Contract Code

Refer to the `GiftVault.sol` file in the `contracts/` directory.

## License

This project is licensed under the MIT License.

## Contributions

Feel free to fork this repository, submit issues, or make pull requests to improve the contract!

---
