use core::starknet::EthAddress;
use crate::evm::model::{Account, AccountTrait, AddressTrait, Environment};

/// Populate an Environment with Starknet syscalls.
pub fn get_env(origin: EthAddress, gas_price: u128) -> Environment {
    // TODO: @beeinger random stuff in here for now
    // tx.gas_price and env.gas_price have the same values here
    // - this is not always true in EVM transactions
    Environment {
        origin: origin,
        gas_price,
        chain_id: 1,
        prevrandao: 0x2137,
        block_number: 2137,
        block_gas_limit: 7_000_000,
        block_timestamp: 1760000000,
        coinbase: 0x0000000000000000000000000000000000000000_u256.into(),
        base_fee: 1000,
        state: Default::default(),
    }
}
