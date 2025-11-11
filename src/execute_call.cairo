use hdp_cairo::HDP;
use hdp_cairo::eth_call::hdp_backend::TimeAndSpace;
use super::test_data::TestData;

pub fn execute_call(hdp: @HDP, time_and_space: @TimeAndSpace, test_data: TestData) -> u8 {
    // beeinger.eth on Sepolia:
    let sender = 0x946F7Cc10FB0A6DC70860B6cF55Ef2C722cC7e1a.try_into().unwrap();

    let result = hdp_cairo::execute_eth_call(
        hdp, time_and_space, sender, test_data.target, test_data.calldata,
    );

    println!("Gas used (EVM): {:?}", result.gas_used);

    if !result.success {
        println!("Result status is not Success, it is {:?}", result.return_data);
        return 0;
    }

    println!("Result: {:?}", result.return_data);

    if result.return_data != test_data.correct_result {
        println!("Result does not match");
        return 0;
    }

    println!("Result matches");
    return 1;
}
