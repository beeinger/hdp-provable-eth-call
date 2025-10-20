use hdp_cairo::HDP;
use hdp_cairo::evm::account::{AccountKey, AccountTrait as EvmAccountTrait};
use hdp_cairo::evm::header::{HeaderKey, HeaderTrait};
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
        // TODO: @herodotus [storage] HDP get storage here
        return 0;
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

    // TODO: @herodotus [account] HDP check if account is deployed here.
    //? Just for reference, it used to be this code:
    // let mut kakarot_state = KakarotCore::unsafe_new_contract_state();
    // let address = kakarot_state.address_registry(*self);
    // return address.is_non_zero();

    // TODO: @herodotus [context] get chain id and block number from context.
    let account_key = AccountKey {
        chain_id: *time_and_space.chain_id,
        block_number: *time_and_space.block_number,
        address: (*address).into(),
    };

    // TODO: @herodotus [account] need a reliable way of checking if the account is deployed
    //! this wont work! nonce can be 0, not a reliable way to check if the account is deployed.
    hdp.evm.account_get_nonce(@account_key) > 0
}

pub fn fetch_balance(
    hdp: Option<@HDP>, time_and_space: @TimeAndSpace, address: @EthAddress,
) -> u256 {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_balance"));

    // TODO: @herodotus [context] get chain id and block number from context.
    let account_key = AccountKey {
        chain_id: *time_and_space.chain_id,
        block_number: *time_and_space.block_number,
        address: (*address).into(),
    };
    hdp.evm.account_get_balance(@account_key)
}

pub fn fetch_nonce(hdp: Option<@HDP>, time_and_space: @TimeAndSpace, address: @EthAddress) -> u64 {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_nonce"));

    // TODO: @herodotus [context] get chain id and block number from context.
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

    // TODO: @herodotus [context] get chain id and block number from context.
    let account_key = AccountKey {
        chain_id: *time_and_space.chain_id,
        block_number: *time_and_space.block_number,
        address: (*address).into(),
    };
    hdp.evm.account_get_code_hash(@account_key)
}

pub fn fetch_number(hdp: Option<@HDP>, time_and_space: @TimeAndSpace) -> u64 {
    let hdp = hdp.unwrap_or_else(|| panic!("HDP is not set: fetch_number"));

    // TODO: @herodotus [context] get chain id and block number from context.
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

    // TODO: @herodotus [context] get chain id and block number from context.
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

    // TODO: @herodotus [context] get chain id and block number from context.
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

    // TODO: @herodotus [context] get chain id and block number from context.
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

    // TODO: @herodotus [context] get chain id and block number from context.
    let header_key = HeaderKey {
        chain_id: *time_and_space.chain_id, block_number: *time_and_space.block_number,
    };
    hdp
        .evm
        .header_get_base_fee_per_gas(@header_key)
        .try_into()
        .unwrap_or_else(|| panic!("Failed to convert base fee to u128"))
}
