// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract HPECT3 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    // ============ State Variables ============
    
    uint256 public exampleNumber;
    string public exampleString;
    mapping(address => uint256) public exampleMapping;
    mapping(address => mapping(uint256 => bool)) public exampleNestedMapping;
    uint256[] public exampleArray;
    
    // ============ Events ============
    
    event ExampleEvent(uint256 indexed number, string message, address caller);
    event ComplexExampleEvent(uint256[] numbers, bytes32 hash, bool success);
    
    /// @custom:oz-upgrades-unsafe-allow state-variable-immutable constructor
    constructor() {
        _disableInitializers(); // prevents initializing the implementation directly
    }

    function initialize(address initialOwner) public initializer {
        __Ownable_init(initialOwner);
        __UUPSUpgradeable_init();
    }

    // UUPS auth — only owner can upgrade
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    // ============ Comprehensive Test Function ============
    
    /**
     * @dev Comprehensive test function for proxy contracts using multiple storage slots and opcodes
     * @param inputNumber Input number for calculations
     * @param inputString Input string for processing
     * @param inputArray Array of numbers to process
     * @return result Complex result containing multiple values
     */
    function performComprehensiveProxyTest(
        uint256 inputNumber,
        string memory inputString,
        uint256[] memory inputArray
    ) public returns (
        uint256 result,
        bytes32 hash,
        address caller,
        uint256 blockNumber,
        uint256 gasLeft,
        bool success
    ) {
        // Store caller address
        caller = msg.sender;
        
        // Arithmetic operations (ADD, SUB, MUL, DIV, MOD)
        exampleNumber = inputNumber;
        uint256 arithmeticResult = (inputNumber + 100) * 2 - 50;
        
        // String operations and KECCAK256
        exampleString = inputString;
        hash = keccak256(abi.encodePacked(inputString, inputNumber));
        
        // Storage operations (SLOAD, SSTORE)
        exampleMapping[msg.sender] = inputNumber;
        exampleNestedMapping[msg.sender][inputNumber] = true;
        
        // Array operations
        for (uint256 i = 0; i < inputArray.length; i++) {
            exampleArray.push(inputArray[i]);
        }
        
        // Complex calculations with multiple opcodes
        uint256 complexResult = 0;
        for (uint256 i = 0; i < exampleArray.length; i++) {
            complexResult += inputArray[i] * (i + 1);
        }
        
        // Bitwise operations (AND, OR, XOR)
        uint256 bitwiseResult = (inputNumber & 0xFF) | (arithmeticResult & 0xFF00);
        
        // Block operations
        blockNumber = block.number;
        gasLeft = gasleft();
        
        // Final result calculation
        result = (arithmeticResult + complexResult + bitwiseResult) % 1000000;
        
        // Event emission (LOG operations)
        emit ExampleEvent(result, inputString, msg.sender);
        emit ComplexExampleEvent(inputArray, hash, true);
        
        success = true;
        
        return (result, hash, caller, blockNumber, gasLeft, success);
    }

    // Storage gap for future-proofing (adjust size if you add vars)
    uint256[44] private __gap;
}