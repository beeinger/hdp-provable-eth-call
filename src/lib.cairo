pub mod evm;
pub mod utils;


#[starknet::contract]
pub mod executable {
    use core::keccak::cairo_keccak;
    use core::num::traits::Zero;
    use hdp_cairo::HDP;
    use crate::evm::interpreter::EVMImpl;
    use crate::evm::model::{Environment, Message};
    use crate::evm::state::State;
    use crate::utils::bytecode::{ByteCodeLeWords, OriginalByteCode};

    #[storage]
    struct Storage {}

    #[external(v0)]
    pub fn main(
        ref self: ContractState, hdp: HDP, codeHash: u256, byteCode: ByteCodeLeWords,
    ) -> u8 {
        println!("Received code hash: 0x{:x}", codeHash);
        //? byteCode has to be cloned because cairo_keccak modifies the array
        let mut byteCodeCopy = byteCode.clone();
        let computedCodeHash = cairo_keccak(
            ref byteCodeCopy.words64bit, byteCodeCopy.lastInputWord, byteCodeCopy.lastInputNumBytes,
        );
        println!("Computed code hash: 0x{:x}", computedCodeHash);

        if computedCodeHash == codeHash {
            println!("Code hash matches");
        } else {
            println!("Code hash does not match");
            return 0;
        }

        let originial_bytecode = byteCode.get_original();
        // println!("Original bytecode: {:?}", bytecode_bytes);

        // decimals()
        let calldata: Span<u8> = [0x31, 0x3c, 0xe5, 0x67].span();

        let message = Message {
            caller: Zero::zero(),
            target: Zero::zero(),
            gas_limit: 1000000000000,
            data: calldata,
            code: originial_bytecode.bytes,
            code_address: 0xC4ed0A9Ea70d5bCC69f748547650d32cC219D882.try_into().unwrap(),
            value: 0,
            should_transfer_value: false,
            depth: 0,
            read_only: false,
            accessed_addresses: Default::default(),
            accessed_storage_keys: Default::default(),
        };

        let env = Environment {
            origin: Zero::zero(),
            gas_price: 0,
            chain_id: 42161,
            prevrandao: 0,
            block_number: 2137,
            block_gas_limit: 1000000000000,
            block_timestamp: 0,
            coinbase: 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1.try_into().unwrap(),
            base_fee: 0,
            state: State {
                accounts: Default::default(),
                accounts_storage: Default::default(),
                events: Default::default(),
                transfers: Default::default(),
                transient_account_storage: Default::default(),
            },
        };

        let result = EVMImpl::process_message_call(message, env, false, Some(@hdp));
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

