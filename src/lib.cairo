pub mod evm;
pub mod utils;


#[starknet::contract]
pub mod executable {
    use core::keccak::cairo_keccak;
    use hdp_cairo::HDP;
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

        return 1;
    }
}

