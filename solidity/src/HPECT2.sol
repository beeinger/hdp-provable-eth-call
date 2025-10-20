// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/**
 * @title HPECT2 - Herodotus Prover Ethereum Call Testing Contract 2
 * @dev Supporting contract for HPECT1 with utility functions for cross-contract testing
 * @notice This contract provides helper functions for testing cross-contract calls and interactions
 */
contract HPECT2 {
    // ============ Constants ============
    
    uint256 public constant EXAMPLE_NUMBER = 21;
    uint256 public constant EXAMPLE_NUMBER_2 = 37;

    // ============ Core Functions ============
    
    /**
     * @dev Performs a calculation for testing cross-contract calls
     * @param x Input value for calculation
     * @return result The calculated result (x * EXAMPLE_NUMBER + EXAMPLE_NUMBER_2)
     */
    function calculateForTestingCalls(uint256 x) public pure returns (uint256) {
        return x * EXAMPLE_NUMBER + EXAMPLE_NUMBER_2;
    }

    /**
     * @dev Returns the caller address for testing
     * @return caller The address of the message sender
     */
    function getCallerAddress() public view returns (address) {
        return msg.sender;
    }
}