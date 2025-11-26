// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/**
 * @title EIP-7623 Calldata Cost Demo
 * @notice Demonstrates how calldata size influences gas usage.
 * @dev After EIP-7623 (Pectra Upgrade) each calldata byte costs more gas.
 */

contract CalldataCostDemo is ReentrancyGuard {
    event GasUsed(uint256 GasUsed, uint256 dataLength);

    function smallInput(uint256[2] calldata numbers) external nonReentrant {
        require(numbers.length == 2, "Invalid input length");
        require(numbers[0] != 0 || numbers[1] != 0, "Input cannot be all zero");
        uint256 gasBefore = gasleft();
        uint256 sum = numbers[0] + numbers[1];
        uint256 gasAfter = gasleft();
        emit GasUsed(gasBefore - gasAfter, numbers.length * 32);
    }

    function largeInput(uint256[200] calldata numbers) external nonReentrant {
        require(numbers.length == 200, "Invalid input length");
        bool nonZero = false;
        for (uint256 i = 0; i < numbers.length; ++i) {
            if (numbers[i] != 0) {
                nonZero = true;
                break;
            }
        }
        require(nonZero, "Input cannot be all zero");
        uint256 gasBefore = gasleft();
        uint256 sum;
        unchecked {
            for (uint256 i = 0; i < numbers.length; ++i) {
                sum += numbers[i];
            }
        }
        uint256 gasAfter = gasleft();
        emit GasUsed(gasBefore - gasAfter, numbers.length * 32);
    }
}
