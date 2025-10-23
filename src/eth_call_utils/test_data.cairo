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

pub fn test_data_get_hardcoded_number() -> TestData {
    TestData {
        calldata: [0x9d, 0xfc, 0xf5, 0x69].span(),
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x01,
        ]
            .span(),
    }
}

pub fn test_data_get_hardcoded_string() -> TestData {
    TestData {
        calldata: [0xa6, 0x87, 0x5a, 0x2f].span(),
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x0d, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57, 0x6f, 0x72,
            0x6c, 0x64, 0x21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_get_constant_number() -> TestData {
    TestData {
        calldata: [0xaa, 0x27, 0x74, 0x48].span(),
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x08, 0x59,
        ]
            .span(),
    }
}

pub fn test_data_get_constant_string() -> TestData {
    TestData {
        calldata: [0x9e, 0xa4, 0x0c, 0x01].span(),
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x0d, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57, 0x6f, 0x72,
            0x6c, 0x64, 0x21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_get_storage_string() -> TestData {
    TestData {
        calldata: [0xfe, 0x6d, 0x7b, 0xf7].span(),
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x0d, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57, 0x6f, 0x72,
            0x6c, 0x64, 0x21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}
// getHardcodedNumber() - 0x9dfcf569
// let calldata: Span<u8> = [0x9d, 0xfc, 0xf5, 0x69].span();

// performStorageOperations() - 0xcd07a432
// let calldata: Span<u8> = [0xcd, 0x07, 0xa4, 0x32].span();


