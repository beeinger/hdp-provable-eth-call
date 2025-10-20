// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console} from "forge-std/console.sol";
import {Script} from "forge-std/Script.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {HPECT1} from "../src/HPECT1.sol";
import {HPECT2} from "../src/HPECT2.sol";
import {HPECT3} from "../src/HPECT3.sol";

contract DeployScript is Script {
    function run() public {
        vm.startBroadcast();

        // 1. Deploy HPECT2 - contract used for testing calls (delegatecall)
        address hpect2 = address(new HPECT2());
        console.log("HPECT2 deployed at:", hpect2);

        // 2. Deploy HPECT1 - contract used for most of the testing
        address hpect1 = address(new HPECT1(hpect2, 2137, "Hello, World!", address(1), 21));
        console.log("HPECT1 deployed at:", hpect1);

        // 3. Deploy HPECT3 - contract used for testing proxies
        address proxy = Upgrades.deployUUPSProxy(
            "HPECT3.sol:HPECT3",
            abi.encodeCall(HPECT3.initialize, (tx.origin))
        );
        console.log("HPECT3 UUPS proxy deployed at:", proxy);

        vm.stopBroadcast();
    }
}
