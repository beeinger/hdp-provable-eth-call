use hdp_cairo::HDP;
use starknet::EthAddress;
use crate::evm::interpreter::EVMImpl;
use crate::hdp_backend::TimeAndSpace;

#[derive(Destruct)]
pub struct Context {
    pub hdp: HDP,
    pub codeHash: u256,
    pub byteCode: Span<u8>,
    pub time_and_space: TimeAndSpace,
    pub sender: EthAddress,
    pub target: EthAddress,
}
