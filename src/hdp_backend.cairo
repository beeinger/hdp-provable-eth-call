use hdp_cairo::HDP;
use hdp_cairo::evm::account::{AccountKey, AccountTrait as EvmAccountTrait};
use hdp_cairo::evm::header::{HeaderKey, HeaderTrait};
use hdp_cairo::evm::storage::{StorageKey, StorageTrait};
use starknet::EthAddress;
use crate::evm::model::AddressTrait;
use crate::evm::model::account::{Account, AccountTrait};

#[derive(Destruct, Default, Copy)]
pub struct TimeAndSpace {
    pub chain_id: felt252,
    pub block_number: felt252,
}

/// Fetches the value stored at the given key for the corresponding contract accounts.
/// If the account is not deployed (in case of a create/deploy transaction), returns 0.
/// # Arguments
///
/// * `account` The account to read from.
/// * `key` The key to read.
///
/// # Returns
///
/// A `Result` containing the value stored at the given key or an `EVMError` if there was an error.
pub fn fetch_original_storage(
    hdp: Option<@HDP>, time_and_space: @TimeAndSpace, account: @Account, key: u256,
) -> u256 {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_original_storage"));

    let is_deployed = account.evm_address().is_deployed(Option::Some(hdp), time_and_space);
    if is_deployed {
        let storage_key = StorageKey {
            chain_id: *time_and_space.chain_id,
            block_number: *time_and_space.block_number,
            address: account.evm_address().into(),
            storage_slot: key,
        };

        return hdp.evm.storage_get_slot(@storage_key);
    }
    0
}

/// Checks if the EVM address is deployed.
///
/// # Returns
///
/// `true` if the address is deployed, `false` otherwise.
pub fn is_deployed(hdp: Option<@HDP>, time_and_space: @TimeAndSpace, address: @EthAddress) -> bool {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: is_deployed"));

    let account_key = AccountKey {
        chain_id: *time_and_space.chain_id,
        block_number: *time_and_space.block_number,
        address: (*address).into(),
    };

    // TODO: @herodotus [account] need a reliable way of checking if the account is deployed
    //! this wont work! it's just a placeholder, probably always says true, unless it panics.
    hdp.evm.account_get_nonce(@account_key) >= 0
}

pub fn fetch_balance(
    hdp: Option<@HDP>, time_and_space: @TimeAndSpace, address: @EthAddress,
) -> u256 {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_balance"));

    let account_key = AccountKey {
        chain_id: *time_and_space.chain_id,
        block_number: *time_and_space.block_number,
        address: (*address).into(),
    };
    hdp.evm.account_get_balance(@account_key)
}

pub fn fetch_nonce(hdp: Option<@HDP>, time_and_space: @TimeAndSpace, address: @EthAddress) -> u64 {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_nonce"));

    let account_key = AccountKey {
        chain_id: *time_and_space.chain_id,
        block_number: *time_and_space.block_number,
        address: (*address).into(),
    };
    hdp
        .evm
        .account_get_nonce(@account_key)
        .try_into()
        .unwrap_or_else(|| panic!("Failed to convert nonce to u64"))
}

//! TODO: @herodotus [account] Last one completely unimplemented!
pub fn fetch_bytecode(
    hdp: Option<@HDP>, time_and_space: @TimeAndSpace, address: @EthAddress,
) -> Span<u8> {
    let _hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_bytecode"));

    // TODO: @herodotus [account] HDP get account bytecode.
    [].span()
}

pub fn fetch_code_hash(
    hdp: Option<@HDP>, time_and_space: @TimeAndSpace, address: @EthAddress,
) -> u256 {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_code_hash"));

    let account_key = AccountKey {
        chain_id: *time_and_space.chain_id,
        block_number: *time_and_space.block_number,
        address: (*address).into(),
    };
    hdp.evm.account_get_code_hash(@account_key)
}

pub fn fetch_number(hdp: Option<@HDP>, time_and_space: @TimeAndSpace) -> u64 {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_number"));

    let header_key = HeaderKey {
        chain_id: *time_and_space.chain_id, block_number: *time_and_space.block_number,
    };
    hdp
        .evm
        .header_get_number(@header_key)
        .try_into()
        .unwrap_or_else(|| panic!("Failed to convert block number to u64"))
}

pub fn fetch_gas_limit(hdp: Option<@HDP>, time_and_space: @TimeAndSpace) -> u64 {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_gas_limit"));

    let header_key = HeaderKey {
        chain_id: *time_and_space.chain_id, block_number: *time_and_space.block_number,
    };
    hdp
        .evm
        .header_get_gas_limit(@header_key)
        .try_into()
        .unwrap_or_else(|| panic!("Failed to convert gas limit to u64"))
}

pub fn fetch_timestamp(hdp: Option<@HDP>, time_and_space: @TimeAndSpace) -> u64 {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_timestamp"));

    let header_key = HeaderKey {
        chain_id: *time_and_space.chain_id, block_number: *time_and_space.block_number,
    };
    hdp
        .evm
        .header_get_timestamp(@header_key)
        .try_into()
        .unwrap_or_else(|| panic!("Failed to convert timestamp to u64"))
}

pub fn fetch_coinbase(hdp: Option<@HDP>, time_and_space: @TimeAndSpace) -> EthAddress {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_coinbase"));

    let header_key = HeaderKey {
        chain_id: *time_and_space.chain_id, block_number: *time_and_space.block_number,
    };
    hdp
        .evm
        .header_get_coinbase(@header_key)
        .try_into()
        .unwrap_or_else(|| panic!("Failed to convert coinbase to EthAddress"))
}

pub fn fetch_base_fee(hdp: Option<@HDP>, time_and_space: @TimeAndSpace) -> u64 {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: get_base_fee"));

    let header_key = HeaderKey {
        chain_id: *time_and_space.chain_id, block_number: *time_and_space.block_number,
    };
    hdp
        .evm
        .header_get_base_fee_per_gas(@header_key)
        .try_into()
        .unwrap_or_else(|| panic!("Failed to convert base fee to u128"))
}
