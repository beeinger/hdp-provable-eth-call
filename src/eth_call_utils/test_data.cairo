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
