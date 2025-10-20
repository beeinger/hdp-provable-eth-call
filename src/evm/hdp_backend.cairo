use starknet::EthAddress;
use crate::evm::model::AddressTrait;
use crate::evm::model::account::{Account, AccountTrait};

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
pub fn fetch_original_storage(account: @Account, key: u256) -> u256 {
    let is_deployed = account.evm_address().is_deployed();
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
pub fn is_deployed(address: @EthAddress) -> bool {
    // TODO: @herodotus [account] HDP check if account is deployed here.
    //? Just for reference, it used to be this code:
    // let mut kakarot_state = KakarotCore::unsafe_new_contract_state();
    // let address = kakarot_state.address_registry(*self);
    // return address.is_non_zero();
    true
}

pub fn fetch_balance(address: @EthAddress) -> u256 {
    // TODO: @herodotus [account] HDP get account balance.
    0
}

pub fn fetch_nonce(address: @EthAddress) -> u64 {
    // TODO: @herodotus [account] HDP get account nonce.
    0
}

pub fn fetch_bytecode(address: @EthAddress) -> Span<u8> {
    // TODO: @herodotus [account] HDP get account bytecode.
    [].span()
}

pub fn fetch_code_hash(address: @EthAddress) -> u256 {
    // TODO: @herodotus [account] HDP get account code hash.
    0
}

//? Found this note:
//? Charge the cost of intrinsic gas - which has been verified to be <= gas_limit.
pub fn get_base_fee() -> u128 {
    // TODO: [env] get base fee?
    0
}
