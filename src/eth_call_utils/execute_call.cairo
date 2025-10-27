use crate::evm::interpreter::EVMImpl;
use crate::evm::model::{ExecutionResultStatus, Message};
use crate::executable::ContractState;
use crate::utils::bytecode::OriginalByteCode;
use crate::utils::env::get_env;
use super::test_data::TestData;
use super::types::Context;

pub fn execute_call(ref self: ContractState, ref context: Context, test_data: TestData) -> u8 {
    let message = Message {
        caller: context.sender,
        target: context.target,
        gas_limit: 50_000_000,
        data: test_data.calldata,
        code: context.byteCode,
        code_address: context.target,
        value: 0,
        should_transfer_value: false,
        depth: 0,
        read_only: false,
        accessed_addresses: Default::default(),
        accessed_storage_keys: Default::default(),
    };

    let env = get_env(context.sender, 0, Some(@context.hdp), @context.time_and_space);

    let result = EVMImpl::process_message_call(
        message, env, false, Some(@context.hdp), @context.time_and_space,
    );

    if result.status != ExecutionResultStatus::Success {
        println!("Result status is not Success, it is {:?}", result.status);
        return 0;
    }

    println!("Result: {:?}", result.return_data);

    if result.return_data != test_data.correct_result {
        println!("Result does not match");
        return 0;
    }

    println!("Result matches");
    return 1;
}
