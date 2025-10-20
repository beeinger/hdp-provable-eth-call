// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {HPECT2} from "./HPECT2.sol";
import {Precompiles} from "./libraries/Precompiles.sol";

/**
 * @title HPECT1 - Herodotus Prover Ethereum Call Testing Contract 1
 * @dev Comprehensive testing contract for HDP (Herodotus Data Provider) with extensive opcode coverage
 * @notice This contract provides test functions for various EVM opcodes and precompiles
 */
contract HPECT1 {
    // ============ State Variables ============
    
    HPECT2 public hpect2;
    
    // Constants
    uint256 public constant EXAMPLE_NUMBER = 2137;
    string public constant EXAMPLE_STRING = "Hello, World!";
    
    // Storage variables
    uint256 public exampleNumber;
    string public exampleString;
    mapping(address => uint256) public exampleMapping;
    
    // ============ Events ============
    
    event ExampleEvent(uint256 indexed number, string message);
    
    // ============ Constructor ============
    
    constructor(address _hpect2, uint256 _exampleNumber, string memory _exampleString, address _exampleMappingKey, uint256 _exampleMappingValue) {
        hpect2 = HPECT2(_hpect2);
        exampleNumber = _exampleNumber;
        exampleString = _exampleString;
        exampleMapping[_exampleMappingKey] = _exampleMappingValue;
    }
    
    // ============ Basic Data Retrieval Functions ============
    
    /**
     * @dev Returns hardcoded number for testing
     */
    function getHardcodedNumber() public pure returns (uint256) {
        return 1;
    }

    /**
     * @dev Returns hardcoded string for testing
     */
    function getHardcodedString() public pure returns (string memory) {
        return "Hello, World!";
    }

    /**
     * @dev Returns constant number
     */
    function getConstantNumber() public pure returns (uint256) {
        return EXAMPLE_NUMBER;
    }

    /**
     * @dev Returns constant string
     */
    function getConstantString() public pure returns (string memory) {
        return EXAMPLE_STRING;
    }

    /**
     * @dev Returns storage number
     */
    function getStorageNumber() public view returns (uint256) {
        return exampleNumber;
    }

    /**
     * @dev Returns storage string
     */
    function getStorageString() public view returns (string memory) {
        return exampleString;
    }

    /**
     * @dev Returns storage mapping value
     */
    function getStorageMapping(address account) public view returns (uint256) {
        return exampleMapping[account];
    }
    
    // ============ Arithmetic Operations ============
    
    /**
     * @dev Basic arithmetic operations (ADD, SUB, MUL, DIV)
     */
    function performArithmeticOperations(uint256 a, uint256 b) public pure returns (uint256, uint256, uint256, uint256) {
        return (a + b, a - b, a * b, a / b);
    }

    /**
     * @dev Modulo operation
     */
    function performModuloOperation(uint256 a, uint256 b) public pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Exponentiation operation
     */
    function performExponentiation(uint256 base, uint8 exponent) public pure returns (uint256) {
        return base ** exponent;
    }

    /**
     * @dev Complex arithmetic calculation
     */
    function performComplexCalculation(uint256 a, uint256 b, uint256 c) public pure returns (uint256) {
        return ((a + b) * c) / 2;
    }

    /**
     * @dev Calculation with constant number
     */
    function calculateWithConstant() public pure returns (uint256) {
        return EXAMPLE_NUMBER + 1;
    }

    /**
     * @dev Calculation with constant string
     */
    function calculateWithConstantString() public pure returns (string memory) {
        return string.concat(EXAMPLE_STRING, "!");
    }

    /**
     * @dev Calculation with storage number
     */
    function calculateWithStorageNumber() public view returns (uint256) {
        return exampleNumber + 1;
    }

    /**
     * @dev Calculation with storage string
     */
    function calculateWithStorageString() public view returns (string memory) {
        return string.concat(exampleString, "!");
    }

    /**
     * @dev Calculation with storage mapping
     */
    function calculateWithStorageMapping(address account) public view returns (uint256) {
        return exampleMapping[account] + 1;
    }
    
    // ============ Bitwise Operations ============
    
    /**
     * @dev Bitwise operations (AND, OR, XOR)
     */
    function performBitwiseOperations(uint256 a, uint256 b) public pure returns (uint256, uint256, uint256) {
        return (a & b, a | b, a ^ b);
    }

    /**
     * @dev Shift operations (SHL, SHR)
     */
    function performShiftOperations(uint256 a, uint8 shift) public pure returns (uint256, uint256) {
        return (a << shift, a >> shift);
    }
    
    // ============ Hash Operations ============
    
    /**
     * @dev KECCAK256 hash operation
     */
    function performKeccak256Hash(bytes memory data) public pure returns (bytes32) {
        return keccak256(data);
    }

    /**
     * @dev KECCAK256 hash with storage values
     */
    function performKeccak256WithStorage() public view returns (bytes32) {
        return keccak256(abi.encodePacked(exampleNumber, exampleString));
    }

    /**
     * @dev KECCAK256 hash with multiple inputs
     */
    function performKeccak256WithMultipleInputs(uint256 num, string memory str, address addr) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(num, str, addr));
    }
    
    // ============ Storage Operations ============
    
    /**
     * @dev Storage read/write operations (SLOAD, SSTORE)
     */
    function performStorageOperations() public returns (uint256, uint256) {
        uint256 oldValue = exampleNumber;
        exampleNumber = exampleNumber + 1;
        return (oldValue, exampleNumber);
    }

    /**
     * @dev Storage mapping operations
     */
    function performStorageMappingOperations(address account) public returns (uint256, uint256) {
        uint256 oldValue = exampleMapping[account];
        exampleMapping[account] = exampleMapping[account] + 1;
        return (oldValue, exampleMapping[account]);
    }

    /**
     * @dev Multiple storage operations in batch
     */
    function performMultipleStorageOperations(uint256[] memory numbers) public returns (uint256[] memory) {
        uint256[] memory results = new uint256[](numbers.length);
        for (uint256 i = 0; i < numbers.length; i++) {
            exampleMapping[msg.sender] = numbers[i];
            results[i] = exampleMapping[msg.sender];
        }
        return results;
    }
    
    // ============ Call Operations ============
    
    /**
     * @dev STATICCALL operation
     */
    function performStaticCall() public view returns (bool) {
        (bool success,) = address(hpect2).staticcall(abi.encodeWithSignature("getCallerAddress()"));
        return success;
    }

    /**
     * @dev DELEGATECALL operation with return value
     */
    function performDelegateCallWithReturn() public returns (uint256) {
        (bool success, bytes memory data) = address(hpect2).delegatecall(
            abi.encodeWithSignature("calculateForTestingCalls(uint256)", exampleNumber)
        );
        require(success, "Delegatecall failed");
        return abi.decode(data, (uint256));
    }

    /**
     * @dev DELEGATECALL operation (existing function)
     */
    function performDelegateCall() public returns (address) {
        (bool success, bytes memory data) = address(hpect2).delegatecall(
            abi.encodeWithSignature("getCallerAddress()")
        );
        require(success, "Delegatecall to getCallerAddress failed");
        return abi.decode(data, (address));
    }
    
    // ============ Create Operations ============
    
    /**
     * @dev CREATE opcode operation
     */
    function performCreateOperation() public returns (address) {
        bytes memory bytecode = abi.encodePacked(
            hex"608060405234801561001057600080fd5b50600436106100365760003560e01c8063",
            hex"c29855781461003b578063f2fde38b14610057575b600080fd5b610043610073565b60405161004e91906100a1565b60405180910390f35b610071600480360381019061006c91906100dd565b610079565b005b60008054905090565b8073ffffffffffffffffffffffffffffffffffffffff167f",
            hex"8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e060405160405180910390a350565b6000819050919050565b61009b81610088565b82525050565b60006020820190506100b66000830184610092565b92915050565b600080fd5b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b60006100e7826100bc565b9050919050565b6100f7816100dc565b811461010257600080fd5b50565b600081359050610114816100ee565b92915050565b6000602082840312156101305761012f6100b7565b5b600061013e84828501610105565b91505092915050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b6000600282049050600182168061018e57607f821691505b6020821081036101a1576101a0610147565b5b5091905056fea2646970667358221220"
        );
        
        address newContract;
        assembly {
            newContract := create(0, add(bytecode, 0x20), mload(bytecode))
        }
        return newContract;
    }

    /**
     * @dev CREATE2 opcode operation
     */
    function performCreate2Operation(bytes32 salt) public returns (address) {
        bytes memory bytecode = abi.encodePacked(
            hex"608060405234801561001057600080fd5b50600436106100365760003560e01c8063",
            hex"c29855781461003b578063f2fde38b14610057575b600080fd5b610043610073565b60405161004e91906100a1565b60405180910390f35b610071600480360381019061006c91906100dd565b610079565b005b60008054905090565b8073ffffffffffffffffffffffffffffffffffffffff167f",
            hex"8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e060405160405180910390a350565b6000819050919050565b61009b81610088565b82525050565b60006020820190506100b66000830184610092565b92915050565b600080fd5b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b60006100e7826100bc565b9050919050565b6100f7816100dc565b811461010257600080fd5b50565b600081359050610114816100ee565b92915050565b6000602082840312156101305761012f6100b7565b5b600061013e84828501610105565b91505092915050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b6000600282049050600182168061018e57607f821691505b6020821081036101a1576101a0610147565b5b5091905056fea2646970667358221220"
        );
        
        address newContract;
        assembly {
            newContract := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
        }
        return newContract;
    }
    
    // ============ Log Operations ============
    
    /**
     * @dev LOG operation with event emission
     */
    function performLogOperation(string memory message) public returns (bytes32) {
        emit ExampleEvent(exampleNumber, message);
        return keccak256(abi.encodePacked(exampleNumber, message));
    }
    
    // ============ Control Flow Operations ============
    
    /**
     * @dev REVERT operation
     */
    function performRevertOperation(bool shouldRevert) public pure returns (string memory) {
        if (shouldRevert) {
            revert("This is a test revert");
        }
        return "No revert occurred";
    }

    /**
     * @dev ASSERT operation
     */
    function performAssertOperation(uint256 value) public pure returns (bool) {
        assert(value > 0);
        return true;
    }
    
    // ============ Block Operations ============
    
    /**
     * @dev Block-related operations (NUMBER, TIMESTAMP, COINBASE, BLOCKHASH)
     */
    function performBlockOperations() public view returns (uint256, uint256, address, bytes32) {
        return (block.number, block.timestamp, block.coinbase, blockhash(block.number - 1));
    }
    
    // ============ Gas Operations ============
    
    /**
     * @dev Gas-related operations (GASLEFT, GASLIMIT)
     */
    function performGasOperations() public view returns (uint256, uint256) {
        return (gasleft(), block.gaslimit);
    }
    
    // ============ Address Operations ============
    
    /**
     * @dev Address and balance operations
     */
    function performAddressOperations() public view returns (address, uint256, bytes32) {
        return (address(this), address(this).balance, keccak256(abi.encodePacked(address(this))));
    }
    
    // ============ Complex Opcode Combinations ============
    
    /**
     * @dev Complex combination of multiple opcodes
     */
    function performComplexOpcodeCombination(uint256 a, uint256 b, bytes memory data) public pure returns (bytes32, uint256, bool) {
        bytes32 hash = keccak256(data);
        uint256 result = (a + b) * (a - b);
        bool isEven = result % 2 == 0;
        return (hash, result, isEven);
    }
    
    // ============ HPECT2 Integration Functions ============
    
    /**
     * @dev Calculation with HPECT2 number
     */
    function calculateWithHPECT2Number() public view returns (uint256) {
        return hpect2.calculateForTestingCalls(exampleNumber);
    }

    /**
     * @dev Get caller address via HPECT2
     */
    function getCallerAddressViaHPECT2() public view returns (address) {
        return hpect2.getCallerAddress();
    }
    
    // ============ Precompile Interface Functions ============
    
    /**
     * @dev ECRECOVER precompile - Recover address from signature
     * @param hash The 32-byte message hash
     * @param v Recovery ID (0 or 1)
     * @param r First 32 bytes of signature
     * @param s Last 32 bytes of signature
     * @return recovered The recovered address (0x0 if invalid)
     */
    function performEcrecover(
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public pure returns (address) {
        return Precompiles.recoverAddress(hash, v, r, s);
    }

    /**
     * @dev SHA256 precompile - Compute SHA256 hash
     * @param data Input data to hash
     * @return hash The SHA256 hash
     */
    function performSha256(bytes memory data) public pure returns (bytes32) {
        return Precompiles.computeSha256(data);
    }

    /**
     * @dev RIPEMD160 precompile - Compute RIPEMD160 hash
     * @param data Input data to hash
     * @return hash The RIPEMD160 hash
     */
    function performRipemd160(bytes memory data) public pure returns (bytes20) {
        return Precompiles.computeRipemd160(data);
    }

    /**
     * @dev IDENTITY precompile - Return input data unchanged
     * @param data Input data
     * @return result The same data (identity function)
     */
    function performIdentity(bytes memory data) public view returns (bytes memory) {
        return Precompiles.identity(data);
    }

    /**
     * @dev MODEXP precompile - Modular exponentiation
     * @param base Base value
     * @param exponent Exponent value  
     * @param modulus Modulus value
     * @return result (base^exponent) mod modulus
     */
    function performModexp(
        bytes memory base,
        bytes memory exponent, 
        bytes memory modulus
    ) public view returns (bytes memory) {
        return Precompiles.modexp(base, exponent, modulus);
    }

    /**
     * @dev BN256 ADD precompile - Point addition on BN256 curve
     * @param p1 First point (64 bytes: x1, y1)
     * @param p2 Second point (64 bytes: x2, y2)
     * @return result Sum point (64 bytes: x, y)
     */
    function performBn256Add(bytes memory p1, bytes memory p2) public view returns (bytes memory) {
        return Precompiles.bn256Add(p1, p2);
    }

    /**
     * @dev BN256 MUL precompile - Point multiplication on BN256 curve
     * @param point Point to multiply (64 bytes: x, y)
     * @param scalar Scalar multiplier (32 bytes)
     * @return result Result point (64 bytes: x, y)
     */
    function performBn256Mul(bytes memory point, bytes memory scalar) public view returns (bytes memory) {
        return Precompiles.bn256Mul(point, scalar);
    }

    /**
     * @dev BN256 PAIRING precompile - Bilinear pairing check
     * @param input Pairs of points for pairing check (multiple of 192 bytes)
     * @return result True if pairing is valid
     */
    function performBn256Pairing(bytes memory input) public view returns (bool) {
        return Precompiles.bn256Pairing(input);
    }

    /**
     * @dev BLAKE2 F precompile - BLAKE2 compression function
     * @param rounds Number of rounds
     * @param h Initial hash state (64 bytes)
     * @param m Message block (128 bytes)
     * @param t Block counter (16 bytes)
     * @param f Final block flag (1 byte)
     * @return result New hash state (64 bytes)
     */
    function performBlake2F(
        uint32 rounds,
        bytes memory h,
        bytes memory m, 
        bytes memory t,
        bytes1 f
    ) public view returns (bytes memory) {
        return Precompiles.blake2F(rounds, h, m, t, f);
    }
}