// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IPrecompiles} from "../interfaces/IPrecompiles.sol";

/**
 * @title Precompiles
 * @dev Clean, gas-optimized implementations of Ethereum precompiles
 * @notice This library provides clean interfaces to all Ethereum precompiles
 */
library Precompiles {
    // ============ Constants ============
    
    address constant ECRECOVER_ADDR = address(0x01);
    address constant SHA256_ADDR = address(0x02);
    address constant RIPEMD160_ADDR = address(0x03);
    address constant IDENTITY_ADDR = address(0x04);
    address constant MODEXP_ADDR = address(0x05);
    address constant BN256_ADD_ADDR = address(0x06);
    address constant BN256_MUL_ADDR = address(0x07);
    address constant BN256_PAIRING_ADDR = address(0x08);
    address constant BLAKE2F_ADDR = address(0x09);
    
    // ============ Errors ============
    
    error PrecompileCallFailed(address precompile, string operation);
    error InvalidInputLength(string operation, uint256 expected, uint256 actual);
    error InvalidPointFormat(string operation);
    
    // ============ Cryptographic Precompiles ============
    
    /**
     * @dev ECRECOVER precompile - Recover address from signature
     * @param hash The 32-byte message hash
     * @param v Recovery ID (0 or 1)
     * @param r First 32 bytes of signature
     * @param s Last 32 bytes of signature
     * @return recovered The recovered address (0x0 if invalid)
     */
    function recoverAddress(bytes32 hash, uint8 v, bytes32 r, bytes32 s) internal pure returns (address) {
        return ecrecover(hash, v, r, s);
    }
    
    /**
     * @dev SHA256 precompile - Compute SHA256 hash
     * @param data Input data to hash
     * @return hash The SHA256 hash
     */
    function computeSha256(bytes memory data) internal pure returns (bytes32) {
        return sha256(data);
    }
    
    /**
     * @dev RIPEMD160 precompile - Compute RIPEMD160 hash
     * @param data Input data to hash
     * @return hash The RIPEMD160 hash
     */
    function computeRipemd160(bytes memory data) internal pure returns (bytes20) {
        return ripemd160(data);
    }
    
    // ============ Data Manipulation Precompiles ============
    
    /**
     * @dev IDENTITY precompile - Return input data unchanged
     * @param data Input data
     * @return result The same data (identity function)
     */
    function identity(bytes memory data) internal view returns (bytes memory) {
        address precompile = IDENTITY_ADDR;
        bytes memory result = new bytes(data.length);
        
        assembly {
            let success := staticcall(
                gas(),
                precompile,
                add(data, 0x20),
                mload(data),
                add(result, 0x20),
                mload(data)
            )
            if iszero(success) {
                revert(0, 0)
            }
        }
        
        return result;
    }
    
    // ============ Mathematical Precompiles ============
    
    /**
     * @dev MODEXP precompile - Modular exponentiation
     * @param base Base value
     * @param exponent Exponent value  
     * @param modulus Modulus value
     * @return result (base^exponent) mod modulus
     */
    function modexp(
        bytes memory base,
        bytes memory exponent, 
        bytes memory modulus
    ) internal view returns (bytes memory) {
        address precompile = MODEXP_ADDR;
        
        // Calculate input length: base_len + exp_len + mod_len + 96 (3 * 32 for lengths)
        uint256 inputLength = base.length + exponent.length + modulus.length + 96;
        bytes memory input = new bytes(inputLength);
        
        // Pack the input: [base_len][exp_len][mod_len][base][exp][mod]
        assembly {
            let ptr := add(input, 0x20)
            
            // Store lengths (32 bytes each)
            mstore(ptr, mload(base))
            mstore(add(ptr, 0x20), mload(exponent))
            mstore(add(ptr, 0x40), mload(modulus))
            
            // Copy data
            let dataPtr := add(ptr, 0x60)
            calldatacopy(dataPtr, add(base, 0x20), mload(base))
            calldatacopy(add(dataPtr, mload(base)), add(exponent, 0x20), mload(exponent))
            calldatacopy(add(dataPtr, add(mload(base), mload(exponent))), add(modulus, 0x20), mload(modulus))
        }
        
        // Calculate output length (same as modulus length)
        bytes memory output = new bytes(modulus.length);
        
        assembly {
            let success := staticcall(
                gas(),
                precompile,
                add(input, 0x20),
                inputLength,
                add(output, 0x20),
                mload(modulus)
            )
            if iszero(success) {
                revert(0, 0)
            }
        }
        
        return output;
    }
    
    // ============ Elliptic Curve Precompiles ============
    
    /**
     * @dev BN256 ADD precompile - Point addition on BN256 curve
     * @param p1 First point (64 bytes: x1, y1)
     * @param p2 Second point (64 bytes: x2, y2)
     * @return result Sum point (64 bytes: x, y)
     */
    function bn256Add(bytes memory p1, bytes memory p2) internal view returns (bytes memory) {
        if (p1.length != 64) revert InvalidInputLength("bn256Add", 64, p1.length);
        if (p2.length != 64) revert InvalidInputLength("bn256Add", 64, p2.length);
        
        address precompile = BN256_ADD_ADDR;
        bytes memory input = new bytes(128);
        bytes memory output = new bytes(64);
        
        assembly {
            // Copy p1 and p2 to input
            calldatacopy(add(input, 0x20), add(p1, 0x20), 64)
            calldatacopy(add(input, 0x60), add(p2, 0x20), 64)
            
            let success := staticcall(
                gas(),
                precompile,
                add(input, 0x20),
                128,
                add(output, 0x20),
                64
            )
            if iszero(success) {
                revert(0, 0)
            }
        }
        
        return output;
    }
    
    /**
     * @dev BN256 MUL precompile - Point multiplication on BN256 curve
     * @param point Point to multiply (64 bytes: x, y)
     * @param scalar Scalar multiplier (32 bytes)
     * @return result Result point (64 bytes: x, y)
     */
    function bn256Mul(bytes memory point, bytes memory scalar) internal view returns (bytes memory) {
        if (point.length != 64) revert InvalidInputLength("bn256Mul", 64, point.length);
        if (scalar.length != 32) revert InvalidInputLength("bn256Mul", 32, scalar.length);
        
        address precompile = BN256_MUL_ADDR;
        bytes memory input = new bytes(96);
        bytes memory output = new bytes(64);
        
        assembly {
            // Copy point and scalar to input
            calldatacopy(add(input, 0x20), add(point, 0x20), 64)
            calldatacopy(add(input, 0x60), add(scalar, 0x20), 32)
            
            let success := staticcall(
                gas(),
                precompile,
                add(input, 0x20),
                96,
                add(output, 0x20),
                64
            )
            if iszero(success) {
                revert(0, 0)
            }
        }
        
        return output;
    }
    
    /**
     * @dev BN256 PAIRING precompile - Bilinear pairing check
     * @param input Pairs of points for pairing check (multiple of 192 bytes)
     * @return result True if pairing is valid
     */
    function bn256Pairing(bytes memory input) internal view returns (bool) {
        if (input.length % 192 != 0) {
            revert InvalidInputLength("bn256Pairing", 192, input.length);
        }
        
        address precompile = BN256_PAIRING_ADDR;
        uint256 result;
        
        assembly {
            let success := staticcall(
                gas(),
                precompile,
                add(input, 0x20),
                mload(input),
                0x00,
                0x20
            )
            if iszero(success) {
                revert(0, 0)
            }
            result := mload(0x00)
        }
        
        return result != 0;
    }
    
    // ============ Hash Function Precompiles ============
    
    /**
     * @dev BLAKE2 F precompile - BLAKE2 compression function
     * @param rounds Number of rounds
     * @param h Initial hash state (64 bytes)
     * @param m Message block (128 bytes)
     * @param t Block counter (16 bytes)
     * @param f Final block flag (1 byte)
     * @return result New hash state (64 bytes)
     */
    function blake2F(
        uint32 rounds,
        bytes memory h,
        bytes memory m, 
        bytes memory t,
        bytes1 f
    ) internal view returns (bytes memory) {
        if (h.length != 64) revert InvalidInputLength("blake2F", 64, h.length);
        if (m.length != 128) revert InvalidInputLength("blake2F", 128, m.length);
        if (t.length != 16) revert InvalidInputLength("blake2F", 16, t.length);
        
        address precompile = BLAKE2F_ADDR;
        bytes memory input = new bytes(213); // 4 + 64 + 128 + 16 + 1 = 213
        bytes memory output = new bytes(64);
        
        assembly {
            let ptr := add(input, 0x20)
            
            // Pack input: [rounds][h][m][t][f]
            mstore(ptr, rounds)
            calldatacopy(add(ptr, 4), add(h, 0x20), 64)
            calldatacopy(add(ptr, 68), add(m, 0x20), 128)
            calldatacopy(add(ptr, 196), add(t, 0x20), 16)
            mstore8(add(ptr, 212), f)
            
            let success := staticcall(
                gas(),
                precompile,
                add(input, 0x20),
                213,
                add(output, 0x20),
                64
            )
            if iszero(success) {
                revert(0, 0)
            }
        }
        
        return output;
    }
}
