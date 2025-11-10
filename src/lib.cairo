pub mod eth_call_utils;
pub mod evm;
pub mod hdp_backend;
pub mod utils;


#[starknet::contract]
pub mod executable {
    use hdp_cairo::HDP;
    use crate::eth_call_utils::execute_call::execute_call;
    use crate::eth_call_utils::test_data::*;
    use crate::eth_call_utils::types::Context;
    use crate::evm::interpreter::EVMImpl;
    use crate::hdp_backend::TimeAndSpace;
    use crate::utils::bytecode::OriginalByteCode;


    #[storage]
    struct Storage {}

    ///? Just a function with simple bytecode
    #[external(v0)]
    pub fn main(ref self: ContractState, hdp: HDP) {
        let time_and_space = TimeAndSpace { chain_id: 11155111, block_number: 9455096 };

        // beeinger.eth on Sepolia:
        let sender = 0x946F7Cc10FB0A6DC70860B6cF55Ef2C722cC7e1a.try_into().unwrap();
        // HPECT1 testing contract address on Sepolia:
        let target = 0xe5d5bc62Cf36FB14eFd8c32238c5d39B15bbFFd1.try_into().unwrap();

        let mut context = Context {
            hdp: hdp, time_and_space: time_and_space, sender: sender, target: target,
        };


    // ============ Basic Data Retrieval Functions ============
    execute_call(ref self, ref context, test_data_get_storage_number());
    execute_call(ref self, ref context, test_data_get_hardcoded_number());
    execute_call(ref self, ref context, test_data_get_hardcoded_string());
    execute_call(ref self, ref context, test_data_get_constant_number());
    execute_call(ref self, ref context, test_data_get_constant_string());
    // ============ Arithmetic Operations ============
    execute_call(ref self, ref context, test_data_get_storage_string());
    execute_call(ref self, ref context, test_data_get_storage_mapping());
    execute_call(ref self, ref context, test_data_perform_arithmetic_operations());
    execute_call(ref self, ref context, test_data_perform_modulo_operation());
    execute_call(ref self, ref context, test_data_perform_exponentiation());
    execute_call(ref self, ref context, test_data_perform_complex_calculation());
    execute_call(ref self, ref context, test_data_calculate_with_constant());
    execute_call(ref self, ref context, test_data_calculate_with_constant_string());
    execute_call(ref self, ref context, test_data_calculate_with_storage_number());
    execute_call(ref self, ref context, test_data_calculate_with_storage_string());
    execute_call(ref self, ref context, test_data_calculate_with_storage_mapping());
    // ============ Bitwise Operations ============
    execute_call(ref self, ref context, test_data_perform_bitwise_operations());
    execute_call(ref self, ref context, test_data_perform_shift_operations());
    // ============ Hash Operations ============
    execute_call(ref self, ref context, test_data_perform_keccak256_hash());
    execute_call(ref self, ref context, test_data_perform_keccak256_with_storage());
    execute_call(ref self, ref context, test_data_perform_keccak256_with_multiple_inputs());
    // ============ Storage Operations ============
    execute_call(ref self, ref context, test_data_perform_storage_operations());
    execute_call(ref self, ref context, test_data_perform_storage_mapping_operations());
    execute_call(ref self, ref context, test_data_perform_multiple_storage_operations());
    // ============ Call Operations ============
    execute_call(ref self, ref context, test_data_perform_static_call());
    execute_call(ref self, ref context, test_data_perform_delegate_call_with_return());
    execute_call(ref self, ref context, test_data_perform_delegate_call());
    // ============ Create Operations ============
    // TODO: @herodotus [tests]
    //execute_call(ref self, ref context, test_data_perform_create_operation());
    // TODO: @herodotus [tests]
    //execute_call(ref self, ref context, test_data_perform_create2_operation());
    // ============ Log Operations ============
    execute_call(ref self, ref context, test_data_perform_log_operation());
    // ============ Control Flow Operations ============
    // TODO: @herodotus [tests ]- there is no revert as a return value suppport in lib
    execute_call(ref self, ref context, test_data_perform_revert_operation());
    execute_call(ref self, ref context, test_data_perform_assert_operation());
    //============ Block Operations ============
    execute_call(ref self, ref context, test_data_perform_block_operations());
    //============ Gas Operations ============
    execute_call(ref self, ref context, test_data_perform_gas_operations());
    //============ Address Operations ============
    execute_call(ref self, ref context, test_data_perform_address_operations());
    //============ Complex OpcodeOperations ============
    execute_call(ref self, ref context, test_data_perform_complex_opcode_combination());
    // ============ HPECT2 Integration Functions ============
     execute_call(ref self, ref context, test_data_calculate_with_hpect2_number());
     execute_call(ref self, ref context, test_data_get_caller_address_via_hpect2());
    // ============ Precompile Interface Functions ============
    // TODO: @herodotus [tests] every test in precompiles
    // execute_call(ref self, ref context, test_data_perform_ecrecover());
    // execute_call(ref self, ref context, test_data_perform_sha256());
    // execute_call(ref self, ref context, test_data_perform_ripemd160());
    // execute_call(ref self, ref context, test_data_perform_identity());
    // execute_call(ref self, ref context, test_data_perform_modexp());
    // execute_call(ref self, ref context, test_data_perform_bn256_add());
    // execute_call(ref self, ref context, test_data_perform_bn256_mul());
    // execute_call(ref self, ref context, test_data_perform_bn256_pairing());
    // execute_call(ref self, ref context, test_data_perform_blake2f());
    }
}
