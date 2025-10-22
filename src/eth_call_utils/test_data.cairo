pub struct TestData {
    pub calldata: Span<u8>,
    pub correct_result: Span<u8>,
}

pub fn test_data_get_storage_number() -> TestData {
    TestData {
        calldata: [0x20, 0x47, 0x87, 0x23].span(),
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x08, 0x59,
        ]
            .span(),
    }
}
// getHardcodedNumber() - 0x9dfcf569
// let calldata: Span<u8> = [0x9d, 0xfc, 0xf5, 0x69].span();

// performStorageOperations() - 0xcd07a432
// let calldata: Span<u8> = [0xcd, 0x07, 0xa4, 0x32].span();


