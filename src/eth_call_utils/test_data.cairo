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

pub fn test_data_perform_storage_operations() -> TestData {
    TestData {
        // params = none
        calldata: [0xcd, 0x07, 0xa4, 0x32].span(),
        // result = (2137, 2138)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x08, 0x5a,
        ]
            .span(),
    }
}

pub fn test_data_perform_storage_mapping_operations() -> TestData {
    TestData {
        // params = account: 0x0000000000000000000000000000000000000001
        calldata: [
            0xb0, 0xa2, 0x0a, 0xb5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01,
        ]
            .span(),
        // result = (21, 22)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x16,
        ]
            .span(),
    }
}

pub fn test_data_perform_multiple_storage_operations() -> TestData {
    TestData {
        // params = numbers: [2137, 2138]
        calldata: [
            0x9d, 0x2f, 0x81, 0x19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x5a,
        ]
            .span(),
        // result = [2137, 2138]
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08, 0x5a,
        ]
            .span(),
    }
}

pub fn test_data_perform_static_call() -> TestData {
    TestData {
        // params = none
        calldata: [0x31, 0x70, 0x42, 0x8e].span(),
        // result = true
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x01,
        ]
            .span(),
    }
}

pub fn test_data_perform_delegate_call_with_return() -> TestData {
    TestData {
        // params = none
        calldata: [0xe5, 0x8e, 0x6c, 0x6d].span(),
        // result = 44914
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0xaf, 0x72,
        ]
            .span(),
    }
}

pub fn test_data_perform_delegate_call() -> TestData {
    TestData {
        // params = none
        calldata: [0x73, 0x26, 0xcb, 0xd2].span(),
        // result = sender address
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x94, 0x6f, 0x7c, 0xc1, 0x0f, 0xb0, 0xa6, 0xdc,
            0x70, 0x86, 0x0b, 0x6c, 0xf5, 0x5e, 0xf2, 0xc7, 0x22, 0xcc, 0x7e, 0x1a,
        ]
            .span(),
    }
}
pub fn test_data_perform_create_operation() -> TestData {
    TestData {
        // params = none
        calldata: [0xbb, 0xd4, 0xed, 0x26].span(),
        // result = CREATE address (nonce 1)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xae, 0x6b, 0x2c, 0xad, 0x6c, 0xcb, 0x9c, 0x0f,
            0x8d, 0x50, 0x1b, 0x3d, 0x5a, 0x3d, 0x72, 0xf2, 0x8b, 0x1b, 0xe9, 0x58,
        ]
            .span(),
    }
}

pub fn test_data_perform_create2_operation() -> TestData {
    TestData {
        // params = salt: 0x0
        calldata: [
            0xe5, 0xb8, 0x8b, 0xd5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = CREATE2 address (salt = 0)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd2, 0x19, 0xbc, 0xc4, 0xe4, 0x33, 0x0e, 0xa1,
            0xdf, 0xe5, 0xb8, 0x0e, 0x97, 0x18, 0x0b, 0xd3, 0x3f, 0x6e, 0x2c, 0x6d,
        ]
            .span(),
    }
}
pub fn test_data_perform_revert_operation() -> TestData {
    TestData {
        // params = shouldRevert: false
        calldata: [
            0x30, 0x9a, 0x58, 0xda, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = "No revert occurred"
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x12, 0x4e, 0x6f, 0x20, 0x72, 0x65, 0x76, 0x65, 0x72, 0x74, 0x20,
            0x6f, 0x63, 0x63, 0x75, 0x72, 0x72, 0x65, 0x64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0,
        ]
            .span(),
    }
}
// TODO @herodotus doesnt work
pub fn test_data_perform_log_operation() -> TestData {
    TestData {
        // params = message: "Hello, World!"
        calldata: [
            0xc5, 0xb2, 0x32, 0xa2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x0d, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c,
            0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64, 0x21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0,
        ]
            .span(),
        // result = keccak256(abi.encodePacked(exampleNumber, message))
        correct_result: [
            0x3e, 0xa0, 0xbf, 0xdd, 0x36, 0x15, 0x26, 0xcc, 0xa9, 0x4b, 0xa1, 0xb3, 0xf7, 0x5e,
            0xa5, 0xc8, 0xd2, 0x77, 0xb9, 0xb1, 0x9f, 0xb7, 0xb0, 0xb2, 0x03, 0x60, 0x85, 0xf6,
            0xf3, 0x0b, 0xa9, 0xd9,
        ]
            .span(),
    }
}

pub fn test_data_perform_assert_operation() -> TestData {
    TestData {
        // params = value: 1
        calldata: [
            0xd0, 0xcc, 0xb0, 0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01,
        ]
            .span(),
        // result = true
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x01,
        ]
            .span(),
    }
}

pub fn test_data_perform_block_operations() -> TestData {
    TestData {
        // params = none
        calldata: [0x89, 0x5c, 0, 0xd7].span(),
        // result = (block.number, timestamp, coinbase, parent hash)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0x90, 0x45, 0xf8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0x68, 0xf6, 0xb8, 0x48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x12, 0x68,
            0xad, 0x18, 0x95, 0x26, 0xac, 0x0b, 0x38, 0x6f, 0xaf, 0x06, 0xef, 0xfc, 0x46, 0x77,
            0x9c, 0x34, 0x0e, 0xe6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_perform_gas_operations() -> TestData {
    TestData {
        // params = none
        calldata: [0xc9, 0x3c, 0x41, 0xf2].span(),
        // result = (gasleft, block.gaslimit)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0x02, 0xfa, 0xef, 0x9a, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0x03, 0x93, 0x87, 0,
        ]
            .span(),
    }
}

pub fn test_data_perform_address_operations() -> TestData {
    TestData {
        // params = none
        calldata: [0xc4, 0x49, 0x41, 0x9e].span(),
        // result = (self address, self balance, hash(address(this)))
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xe5, 0xd5, 0xbc, 0x62, 0xcf, 0x36, 0xfb, 0x14,
            0xef, 0xd8, 0xc3, 0x22, 0x38, 0xc5, 0xd3, 0x9b, 0x15, 0xbb, 0xff, 0xd1, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x82,
            0x87, 0xa6, 0xc0, 0xf2, 0x46, 0x36, 0x42, 0x49, 0xac, 0xb9, 0x19, 0x98, 0x69, 0xf9,
            0xe0, 0xf5, 0x56, 0x0c, 0x51, 0x9b, 0xda, 0x90, 0xb7, 0x34, 0x70, 0x50, 0x55, 0xac,
            0x88, 0x19, 0xf8,
        ]
            .span(),
    }
}

pub fn test_data_perform_complex_opcode_combination() -> TestData {
    TestData {
        // params = a: 1069, b: 1068, data: "Hello, World !"
        calldata: [
            0xff, 0x31, 0x9a, 0x03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0x04, 0x2d, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x04, 0x2c, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0x60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x0e, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20,
            0x57, 0x6f, 0x72, 0x6c, 0x64, 0x20, 0x21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = (keccak256(data), 2137, false)
        correct_result: [
            0xb1, 0xe8, 0x8f, 0xe3, 0x5b, 0x1c, 0x4c, 0x54, 0x22, 0xf7, 0x9f, 0x14, 0x69, 0x1b,
            0xa7, 0xa8, 0xf6, 0x19, 0x4e, 0x38, 0xe5, 0x64, 0xed, 0xf0, 0xd6, 0xd3, 0xc6, 0x67,
            0xcf, 0x97, 0x16, 0xdb, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0x08, 0x59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_calculate_with_hpect2_number() -> TestData {
    TestData {
        // params = none
        calldata: [0xa2, 0x20, 0x04, 0xef].span(),
        // result = 44914
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0xaf, 0x72,
        ]
            .span(),
    }
}

pub fn test_data_get_caller_address_via_hpect2() -> TestData {
    TestData {
        // params = none
        calldata: [0xe2, 0x16, 0xdb, 0x22].span(),
        // result = HPECT1 contract address (msg.sender inside HPECT2)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xe5, 0xd5, 0xbc, 0x62, 0xcf, 0x36, 0xfb, 0x14,
            0xef, 0xd8, 0xc3, 0x22, 0x38, 0xc5, 0xd3, 0x9b, 0x15, 0xbb, 0xff, 0xd1,
        ]
            .span(),
    }
}

// ============ Precompile Interface Functions ============

pub fn test_data_perform_ecrecover() -> TestData {
    TestData {
        // params = hash: 0x...42, v: 27, r: 0, s: 0
        calldata: [
            0xd3, 0x00, 0x3f, 0x24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x1b, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = recovered address (zero)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_perform_sha256() -> TestData {
    TestData {
        // params = data: "Hello, World !"
        calldata: [
            0x6c, 0x5a, 0x7f, 0x08, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x0e, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57,
            0x6f, 0x72, 0x6c, 0x64, 0x20, 0x21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = sha256("Hello, World !")
        correct_result: [
            0x7d, 0x48, 0x69, 0x15, 0xb9, 0x14, 0x33, 0x2b, 0xb5, 0x73, 0x0f, 0xd7, 0x72, 0x22,
            0x3e, 0x8b, 0x27, 0x69, 0x19, 0xe5, 0x1e, 0xdc, 0xa2, 0xde, 0x0f, 0x82, 0xc5, 0xfc,
            0x1b, 0xce, 0x7e, 0xb5,
        ]
            .span(),
    }
}

pub fn test_data_perform_ripemd160() -> TestData {
    TestData {
        // params = data: "Hello, World !"
        calldata: [
            0x90, 0x8b, 0x91, 0x03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x0e, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57,
            0x6f, 0x72, 0x6c, 0x64, 0x20, 0x21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = ripemd160("Hello, World !")
        correct_result: [
            0xae, 0xe1, 0xbf, 0x58, 0xa7, 0x5e, 0x48, 0x14, 0x13, 0x13, 0x1a, 0xcc, 0x83, 0x22,
            0xb5, 0x68, 0xdc, 0x13, 0x69, 0x78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_perform_identity() -> TestData {
    TestData {
        // params = data: 0x0102030405
        calldata: [
            0xea, 0xd1, 0x0c, 0x57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x05, 0x01, 0x02, 0x03, 0x04, 0x05, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = same bytes returned
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0x05, 0x01, 0x02, 0x03, 0x04, 0x05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_perform_modexp() -> TestData {
    TestData {
        // params = base: 0x02, exponent: 0x05, modulus: 0x0d
        calldata: [
            0x6b, 0xc8, 0x71, 0x39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xa0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xe0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0x01, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0x01, 0x05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0x01, 0x0d, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = (2^5 mod 13) = 6
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0x01, 0x06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_perform_bn256_add() -> TestData {
    TestData {
        // params = p1: (1,2), p2: (1,2)
        calldata: [
            0x50, 0x14, 0x7e, 0x54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xa0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x02, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0x40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = placeholder (pending reliable fixture)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0x40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_perform_bn256_mul() -> TestData {
    TestData {
        // params = point: (1,2), scalar: 1
        calldata: [
            0xe9, 0x08, 0xd0, 0x14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xa0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x02, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0x01,
        ]
            .span(),
        // result = placeholder (pending reliable fixture)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0x40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_perform_bn256_pairing() -> TestData {
    TestData {
        // params = input: 192 zero bytes (placeholder)
        calldata: [
            0x5d, 0xa2, 0x60, 0x56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
        // result = placeholder (pending reliable fixture)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0,
        ]
            .span(),
    }
}

pub fn test_data_perform_blake2f() -> TestData {
    TestData {
        // params = rounds: 1, h/m/t zeroed, f = 0x00
        calldata: [
            0x3b, 0xe5, 0x1f, 0x91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xa0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0xe0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0,
        ]
            .span(),
        // result = placeholder (pending reliable fixture)
        correct_result: [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0x20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0x40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]
            .span(),
    }
}
// getHardcodedNumber() - 0x9dfcf569
// let calldata: Span<u8> = [0x9d, 0xfc, 0xf5, 0x69].span();

// performStorageOperations() - 0xcd07a432
// let calldata: Span<u8> = [0xcd, 0x07, 0xa4, 0x32].span();


