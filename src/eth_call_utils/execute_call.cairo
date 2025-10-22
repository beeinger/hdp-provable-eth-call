

use starknet::EthAddress;
use crate::executable::ContractState;
use hdp_cairo::HDP;
use crate::utils::bytecode::{ByteCodeLeWords, OriginalByteCode};
use crate::utils::env::get_env;
use crate::evm::model::{ExecutionResultStatus, Message};
use crate::evm::interpreter::EVMImpl;
use crate::hdp_backend::TimeAndSpace;


pub fn execute_call(
    ref self: ContractState,
    hdp: HDP, 
    codeHash: u256,
    byteCode: ByteCodeLeWords,
    calldata: Span<u8>,
    time_and_space: TimeAndSpace,
    correct_result: Span<u8>,
    sender: EthAddress,
    target: EthAddress

) -> u8 {

    // getStorageNumber() - 0x20478723

    let message = Message {
        caller: sender,
        target: target,
        gas_limit: 50_000_000,
        data: calldata,
        code: byteCode.get_original().bytes,
        code_address: target,
        value: 0,
        should_transfer_value: false,
        depth: 0,
        read_only: false,
        accessed_addresses: Default::default(),
        accessed_storage_keys: Default::default(),
    }; 

    let env = get_env(sender, 0, Some(@hdp), @time_and_space);

    let result = EVMImpl::process_message_call(
        message, env, false, Some(@hdp), @time_and_space,
    );

    if result.status != ExecutionResultStatus::Success {
        println!("Result status is not Success, it is {:?}", result.status);
        return 0;
    }

    println!("Result: {:?}", result.return_data);

    if result.return_data != correct_result {
        println!("Result does not match, should be 2137");
        return 0;
    }

    println!("Result matches");
    return 1;
} 