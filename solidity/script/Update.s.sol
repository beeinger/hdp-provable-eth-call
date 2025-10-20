// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console} from "forge-std/console.sol";
import {Script} from "forge-std/Script.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";

contract UpdateScript is Script {
    function run() public {
        vm.startBroadcast();

        address proxy = vm.envAddress("HPECT3_ADDRESS");
        Upgrades.upgradeProxy(
            proxy,
            "src/HPECT3.sol:HPECT3",
            ""
        );

        vm.stopBroadcast();
    }
}
