pub mod eth_call_utils;
pub mod evm;
pub mod hdp_backend;
pub mod utils;


#[starknet::contract]
pub mod executable {
    use hdp_cairo::HDP;
    use crate::eth_call_utils::bytecode::verify_bytecode;
    use crate::eth_call_utils::execute_call::execute_call;
    use crate::eth_call_utils::test_data::*;
    use crate::eth_call_utils::types::Context;
    use crate::evm::gas::calculate_intrinsic_gas_cost;
    use crate::evm::interpreter::EVMImpl;
    use crate::hdp_backend::TimeAndSpace;
    use crate::utils::bytecode::{ByteCodeLeWords, OriginalByteCode};
    use crate::utils::eth_transaction::common::TxKind;
    use crate::utils::eth_transaction::eip1559::TxEip1559;
    use crate::utils::eth_transaction::transaction::Transaction;


    #[storage]
    struct Storage {}


    #[external(v0)]
    pub fn main(ref self: ContractState, hdp: HDP, codeHash: u256, byteCode: ByteCodeLeWords) {
        //? byteCode has to be cloned because cairo_keccak modifies the array

        let time_and_space = TimeAndSpace { chain_id: 11155111, block_number: 9455096 };

        // beeinger.eth on Sepolia:
        let sender = 0x946F7Cc10FB0A6DC70860B6cF55Ef2C722cC7e1a.try_into().unwrap();
        // HPECT1 testing contract address on Sepolia:
        let target = 0xe5d5bc62Cf36FB14eFd8c32238c5d39B15bbFFd1.try_into().unwrap();

        verify_bytecode(byteCode.clone(), codeHash);

        let mut context = Context {
            hdp: hdp,
            codeHash: codeHash,
            byteCode: byteCode.get_original().bytes,
            time_and_space: time_and_space,
            sender: sender,
            target: target,
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
    }

    ///? Usable after HDP bytecode support is here,
    ///? this is how it should work, the above is just a hack to run bytecode directly.
    pub fn new_main(ref self: ContractState, hdp: HDP) -> u8 {
        // decimals()
        let calldata: Span<u8> = [0x31, 0x3c, 0xe5, 0x67].span();

        let time_and_space = TimeAndSpace { chain_id: 1, block_number: 0 };

        // beeinger.eth on L1 ETH:
        let sender = 0x946F7Cc10FB0A6DC70860B6cF55Ef2C722cC7e1a.try_into().unwrap();
        // ARB ERC20 token on L1 ETH:
        let target = 0xB50721BCf8d664c30412Cfbc6cf7a15145234ad1.try_into().unwrap();

        let tx = Transaction::Eip1559(
            TxEip1559 {
                chain_id: time_and_space.chain_id.try_into().unwrap(),
                nonce: 0,
                gas_limit: 50_000_000,
                max_fee_per_gas: 1_000_000_000,
                max_priority_fee_per_gas: 500_000,
                to: TxKind::Call(target),
                value: 0,
                access_list: [].span(),
                input: calldata,
            },
        );

        let intrinsic_gas_cost = calculate_intrinsic_gas_cost(@tx);

        let result = EVMImpl::process_transaction(
            sender, tx, intrinsic_gas_cost, Some(@hdp), @time_and_space,
        );

        println!("Result: {:?}", result.return_data);

        if result
            .return_data != [
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 18,
            ]
            .span() {
            println!("Result does not match, should be 18");
            return 0;
        }

        println!("Result matches");
        return 1;
    }
}
