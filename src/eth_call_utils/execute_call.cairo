use crate::evm::gas::calculate_intrinsic_gas_cost;
use crate::evm::interpreter::EVMImpl;
use crate::executable::ContractState;
use crate::utils::bytecode::OriginalByteCode;
use crate::utils::eth_transaction::common::TxKind;
use crate::utils::eth_transaction::eip1559::TxEip1559;
use crate::utils::eth_transaction::transaction::Transaction;
use super::test_data::TestData;
use super::types::Context;

pub fn execute_call(ref self: ContractState, ref context: Context, test_data: TestData) -> u8 {
    let tx = Transaction::Eip1559(
        TxEip1559 {
            chain_id: context.time_and_space.chain_id.try_into().unwrap(),
            nonce: 0,
            gas_limit: 50_000_000,
            max_fee_per_gas: 1_000_000_000,
            max_priority_fee_per_gas: 500_000,
            to: TxKind::Call(context.target),
            value: 0,
            access_list: [].span(),
            input: test_data.calldata,
        },
    );

    let intrinsic_gas_cost = calculate_intrinsic_gas_cost(@tx);

    let result = EVMImpl::process_transaction(
        context.sender, tx, intrinsic_gas_cost, Some(@context.hdp), @context.time_and_space,
    );

    if !result.success {
        println!("Result status is not Success, it is {:?}", result.return_data);
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
