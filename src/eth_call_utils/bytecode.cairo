use crate::utils::traits::bytes::U8SpanExTrait;

pub fn verify_bytecode(byteCode: Span<u8>, codeHash: u256) -> u8 {
    println!("Received code hash: 0x{:x}", codeHash);

    let computedCodeHash = byteCode.compute_keccak256_hash();
    println!("Computed code hash: 0x{:x}", computedCodeHash);

    if computedCodeHash == codeHash {
        println!("Code hash matches");
        return 1;
    } else {
        println!("Code hash does not match");
        return 0;
    }
}
