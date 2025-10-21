use core::keccak::cairo_keccak;
use crate::utils::bytecode::ByteCodeLeWords;

pub fn verify_codehash(byteCode: ByteCodeLeWords, codeHash: u256) -> u8 {
    println!("Received code hash: 0x{:x}", codeHash);
    let mut words64bit = byteCode.words64bit;

    let computedCodeHash = cairo_keccak(
        ref words64bit, byteCode.lastInputWord, byteCode.lastInputNumBytes,
    );
    println!("Computed code hash: 0x{:x}", computedCodeHash);

    if computedCodeHash == codeHash {
        println!("Code hash matches");
        return 1;
    } else {
        println!("Code hash does not match");
        return 0;
    }
}
