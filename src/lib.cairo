#[starknet::contract]
mod module {
    use core::keccak::cairo_keccak;
    use hdp_cairo::HDP;

    #[storage]
    struct Storage {}

    #[external(v0)]
    pub fn main(
        ref self: ContractState,
        hdp: HDP,
        codeHash: u256,
        mut byteCode: Array<u64>,
        lastInputWord: u64,
        lastInputNumBytes: usize,
    ) -> u8 {
        println!("Received code hash: 0x{:x}", codeHash);
        let computedCodeHash = cairo_keccak(ref byteCode, lastInputWord, lastInputNumBytes);
        println!("Computed code hash: 0x{:x}", computedCodeHash);

        if computedCodeHash == codeHash {
            println!("Code hash matches");
            return 1;
        }
        println!("Code hash does not match");
        return 0;
    }
}

