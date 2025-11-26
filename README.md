# EIP-7623 Calldata Cost Demo

This project demonstrates how calldata size influences gas usage in Solidity smart contracts, especially after EIP-7623 (Pectra Upgrade).

## Features

- Gas usage measurement for small and large calldata inputs
- Input validation for security
- Reentrancy guard using OpenZeppelin
- Production-level best practices

## Usage

Deploy the contract and call `smallInput` or `largeInput` with appropriate calldata arrays. Events will emit the gas used and data length.

## Security

- Input validation ensures non-zero data
- Reentrancy protection on all external functions

## Development

- Optimized for gas efficiency
- Ready for further extension (upgradeability, oracles, etc.)

## Next Steps

- Implement checks-effects-interactions pattern
- Add upgradeability support
- Integrate Chainlink oracle example
- Improve documentation

---

For more details, see the contract in `contracts/CalldataCostDemo.sol`.
# CallDataCost
