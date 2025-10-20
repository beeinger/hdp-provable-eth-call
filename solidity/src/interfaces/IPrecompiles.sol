// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * @title IPrecompiles
 * @dev Interface for Ethereum precompiles with clean, typed function signatures
 */
interface IPrecompiles {
    // ============ Cryptographic Precompiles ============
    
    /**
     * @dev ECRECOVER precompile (0x01) - Recover address from signature
     * @param hash The 32-byte message hash
     * @param v Recovery ID (0 or 1)
     * @param r First 32 bytes of signature
     * @param s Last 32 bytes of signature
     * @return recovered The recovered address (0x0 if invalid)
     */
    function recoverAddress(bytes32 hash, uint8 v, bytes32 r, bytes32 s) external pure returns (address);
    
    /**
     * @dev SHA256 precompile (0x02) - Compute SHA256 hash
     * @param data Input data to hash
     * @return hash The SHA256 hash
     */
    function computeSha256(bytes memory data) external pure returns (bytes32);
    
    /**
     * @dev RIPEMD160 precompile (0x03) - Compute RIPEMD160 hash
     * @param data Input data to hash
     * @return hash The RIPEMD160 hash
     */
    function computeRipemd160(bytes memory data) external pure returns (bytes20);
    
    // ============ Data Manipulation Precompiles ============
    
    /**
     * @dev IDENTITY precompile (0x04) - Return input data unchanged
     * @param data Input data
     * @return result The same data (identity function)
     */
    function identity(bytes memory data) external pure returns (bytes memory);
    
    // ============ Mathematical Precompiles ============
    
    /**
     * @dev MODEXP precompile (0x05) - Modular exponentiation
     * @param base Base value
     * @param exponent Exponent value  
     * @param modulus Modulus value
     * @return result (base^exponent) mod modulus
     */
    function modexp(
        bytes memory base,
        bytes memory exponent, 
        bytes memory modulus
    ) external view returns (bytes memory);
    
    // ============ Elliptic Curve Precompiles ============
    
    /**
     * @dev BN256 ADD precompile (0x06) - Point addition on BN256 curve
     * @param p1 First point (64 bytes: x1, y1)
     * @param p2 Second point (64 bytes: x2, y2)
     * @return result Sum point (64 bytes: x, y)
     */
    function bn256Add(bytes memory p1, bytes memory p2) external view returns (bytes memory);
    
    /**
     * @dev BN256 MUL precompile (0x07) - Point multiplication on BN256 curve
     * @param point Point to multiply (64 bytes: x, y)
     * @param scalar Scalar multiplier (32 bytes)
     * @return result Result point (64 bytes: x, y)
     */
    function bn256Mul(bytes memory point, bytes memory scalar) external view returns (bytes memory);
    
    /**
     * @dev BN256 PAIRING precompile (0x08) - Bilinear pairing check
     * @param input Pairs of points for pairing check (multiple of 192 bytes)
     * @return result True if pairing is valid
     */
    function bn256Pairing(bytes memory input) external view returns (bool);
    
    // ============ Hash Function Precompiles ============
    
    /**
     * @dev BLAKE2 F precompile (0x09) - BLAKE2 compression function
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
    ) external view returns (bytes memory);
}
