pub struct TestData {
    pub calldata: Span<u8>,
    pub correct_result: Span<u8>,
}

pub fn test_data_get_storage_number() -> TestData {
    TestData {
        // params = none
        calldata: [0x20, 0x47, 0x87, 0x23].span(),
        // result = 2137
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x08, 0x59,
        ]
            .span(),
    }
}

pub fn test_data_get_hardcoded_number() -> TestData {
    TestData {
        // params = none
        calldata: [0x9d, 0xfc, 0xf5, 0x69].span(),
        // result = 1
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x01,
        ]
            .span(),
    }
}

pub fn test_data_get_hardcoded_string() -> TestData {
    TestData {
        // params = none
        calldata: [0xa6, 0x87, 0x5a, 0x2f].span(),
        // result = "Hello, World!"
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
        // params = none
        calldata: [0xaa, 0x27, 0x74, 0x48].span(),
        // result = 2137
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x08, 0x59,
        ]
            .span(),
    }
}

pub fn test_data_get_constant_string() -> TestData {
    TestData {
        // params = none
        calldata: [0x9e, 0xa4, 0x0c, 0x01].span(),
        // result = "Hello, World!"
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
        // params = none
        calldata: [0xfe, 0x6d, 0x7b, 0xf7].span(),
        // result = "Hello, World!"
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x0d, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57, 0x6f, 0x72,
            0x6c, 0x64, 0x21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_get_storage_mapping() -> TestData {
    TestData {
        // params = account: 0x0000000000000000000000000000000000000001
        calldata: [
            0x81, 0x0e, 0x84, 0x50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01,
        ]
            .span(),
        // result = 21
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x15,
        ]
            .span(),
    }
}

pub fn test_data_perform_arithmetic_operations() -> TestData {
    TestData {
        // params = a: 2137, b: 1
        calldata: [
            0x29, 0x87, 0xf2, 0x33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01,
        ]
            .span(),
        // result = (2138, 2136, 2137, 2137)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x08, 0x5a, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x08, 0x58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59,
        ]
            .span(),
    }
}

pub fn test_data_perform_modulo_operation() -> TestData {
    TestData {
        // params = a: 2137, b: 5000
        calldata: [
            0x10, 0xf7, 0xc6, 0x7a, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x13, 0x88,
        ]
            .span(),
        // result = 2137
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x08, 0x59,
        ]
            .span(),
    }
}

pub fn test_data_perform_exponentiation() -> TestData {
    TestData {
        // params = base: 2137, exponent: 1
        calldata: [
            0x29, 0x2b, 0x6f, 0x65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01,
        ]
            .span(),
        // result = 2137
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x08, 0x59,
        ]
            .span(),
    }
}

pub fn test_data_perform_complex_calculation() -> TestData {
    TestData {
        // params = a: 2137, b: 2137, c: 1
        calldata: [
            0x9f, 0x4f, 0xe3, 0x8d, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01,
        ]
            .span(),
        // result = 2137
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x08, 0x59,
        ]
            .span(),
    }
}

pub fn test_data_calculate_with_constant() -> TestData {
    TestData {
        // params = none
        calldata: [0x7d, 0x06, 0x9e, 0x60].span(),
        // result = 2138
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x08, 0x5a,
        ]
            .span(),
    }
}

pub fn test_data_calculate_with_constant_string() -> TestData {
    TestData {
        // params = none
        calldata: [0x1a, 0x18, 0xa1, 0x5a].span(),
        // result = "Hello, World!!"
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x0e, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57, 0x6f, 0x72,
            0x6c, 0x64, 0x21, 0x21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_calculate_with_storage_number() -> TestData {
    TestData {
        // params = none
        calldata: [0xbe, 0xbc, 0xb5, 0xc1].span(),
        // result = 2138
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x08, 0x5a,
        ]
            .span(),
    }
}

pub fn test_data_calculate_with_storage_string() -> TestData {
    TestData {
        // params = none
        calldata: [0x4a, 0xf4, 0x02, 0x42].span(),
        // result = "Hello, World!!"
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x0e, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57, 0x6f, 0x72,
            0x6c, 0x64, 0x21, 0x21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_calculate_with_storage_mapping() -> TestData {
    TestData {
        // params = account: 0x0000000000000000000000000000000000000001
        calldata: [
            0xc8, 0xbd, 0x83, 0x2f, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01,
        ]
            .span(),
        // result = 22
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x16,
        ]
            .span(),
    }
}

pub fn test_data_perform_bitwise_operations() -> TestData {
    TestData {
        // params = a: 2137, b: 1
        calldata: [
            0x41, 0x50, 0, 0xfb, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01,
        ]
            .span(),
        // result = (1, 2137, 2136)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x58,
        ]
            .span(),
    }
}

pub fn test_data_perform_shift_operations() -> TestData {
    TestData {
        // params = a: 2137, shift: 1
        calldata: [
            0xbf, 0x1f, 0x47, 0xe3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01,
        ]
            .span(),
        // result = (4274, 1068)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x10, 0xb2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x04, 0x2c,
        ]
            .span(),
    }
}

pub fn test_data_perform_keccak256_hash() -> TestData {
    TestData {
        // params = data: [0x01]
        calldata: [
            0x8c, 0xec, 0x56, 0x3d, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = keccak256([0x01])
        correct_result: [
            0x5f, 0xe7, 0xf9, 0x77, 0xe7, 0x1d, 0xba, 0x2e, 0xa1, 0xa6, 0x8e, 0x21, 0x05, 0x7b,
            0xee, 0xbb, 0x9b, 0xe2, 0xac, 0x30, 0xc6, 0x41, 0x0a, 0xa3, 0x8d, 0x4f, 0x3f, 0xbe,
            0x41, 0xdc, 0xff, 0xd2,
        ]
            .span(),
    }
}

pub fn test_data_perform_keccak256_with_storage() -> TestData {
    TestData {
        // params = none
        calldata: [0x64, 0x3d, 0xbb, 0x43].span(),
        // result = keccak256(abi.encodePacked(exampleNumber, exampleString))
        correct_result: [
            0x3e, 0xa0, 0xbf, 0xdd, 0x36, 0x15, 0x26, 0xcc, 0xa9, 0x4b, 0xa1, 0xb3, 0xf7, 0x5e,
            0xa5, 0xc8, 0xd2, 0x77, 0xb9, 0xb1, 0x9f, 0xb7, 0xb0, 0xb2, 0x03, 0x60, 0x85, 0xf6,
            0xf3, 0x0b, 0xa9, 0xd9,
        ]
            .span(),
    }
}

pub fn test_data_perform_keccak256_with_multiple_inputs() -> TestData {
    TestData {
        // params = num: 2137, str: "Hello, World!", addr:
        // 0x0000000000000000000000000000000000000001
        calldata: [
            0x1b, 0xe6, 0xd8, 0xa9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x0d, 0x48, 0x65,
            0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64, 0x21, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = keccak256(abi.encodePacked(num, str, addr))
        correct_result: [
            0xc8, 0xf8, 0x48, 0x46, 0xc4, 0x87, 0x8d, 0x9b, 0xc2, 0x29, 0x38, 0xe2, 0xaa, 0x64,
            0xc1, 0xb2, 0x4b, 0xf8, 0x7c, 0xec, 0x4f, 0x2f, 0x5b, 0x4f, 0xa4, 0xa3, 0xce, 0xac,
            0x50, 0x02, 0xf3, 0xc6,
        ]
            .span(),
    }
}
// getHardcodedNumber() - 0x9dfcf569
// let calldata: Span<u8> = [0x9d, 0xfc, 0xf5, 0x69].span();

// performStorageOperations() - 0xcd07a432
// let calldata: Span<u8> = [0xcd, 0x07, 0xa4, 0x32].span();


