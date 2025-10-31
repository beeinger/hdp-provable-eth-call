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
    use crate::evm::interpreter::EVMImpl;
    use crate::hdp_backend::TimeAndSpace;
    use crate::utils::bytecode::{ByteCodeLeWords, OriginalByteCode};


    #[storage]
    struct Storage {}


    #[external(v0)]
    pub fn main(ref self: ContractState, hdp: HDP, codeHash: u256, byteCode: ByteCodeLeWords) {
        //? byteCode has to be cloned because cairo_keccak modifies the array

        let time_and_space = TimeAndSpace { chain_id: 1, block_number: 23694687 };

        // beeinger.eth:
        let sender = 0x946F7Cc10FB0A6DC70860B6cF55Ef2C722cC7e1a.try_into().unwrap();
        // USDT contract address on Ethereum:
        let target = 0xdAC17F958D2ee523a2206206994597C13D831ec7.try_into().unwrap();

        verify_bytecode(byteCode.clone(), codeHash);

        let mut context = Context {
            hdp: hdp,
            codeHash: codeHash,
            byteCode: byteCode.get_original().bytes,
            time_and_space: time_and_space,
            sender: sender,
            target: target,
        };

        let test_data = TestData {
            // vitalik.eth address: 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045
            // raw calldata for balanceOf(address)
            // 0x70a08231000000000000000000000000d8da6bf26964af9d7eed9e03e53415d37aa96045

            calldata: [
                0x70, 0xa0, 0x82, 0x31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8, 0xda, 0x6b, 0xf2,
                0x69, 0x64, 0xaf, 0x9d, 0x7e, 0xed, 0x9e, 0x03, 0xe5, 0x34, 0x15, 0xd3, 0x7a, 0xa9,
                0x60, 0x45,
            ]
                .span(),
            correct_result: [
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0x0F, 0x98, 0xDE, 0xB9,
            ]
                .span(),
        };

        execute_call(ref self, ref context, test_data);
    }
}
