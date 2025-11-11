# HDP EVM ByteCode

> ℹ️ This repo has served it's purpose, provable ETH call is now a part of [HDP Cairo](https://github.com/HerodotusDev/hdp-cairo) 🎉🚀
>
> What is left here is an example of usage of the provable ETH call, with testing contracts, serving as a testing/experimentation suite for the provable ETH call.
>
> Last state before move to the HDP Cairo repo is available on the [`before-move-to-hdp`](https://github.com/beeinger/hdp-provable-eth-call/tree/before-move-to-hdp) branch.

## Prerequisites

### [HDP CLI](https://github.com/HerodotusDev/hdp-cairo)

To install run:

```
curl -fsSL https://raw.githubusercontent.com/HerodotusDev/hdp-cairo/main/install-cli.sh | bash
```

## Development

To run see commands in [`run.sh`](./run.sh) or run it directly:

```
./run.sh
```

### Waiting on HDP features

- [x] `account_get_bytecode`
- [x] `fusaka fork` compatibility
- [ ] `account_is_deployed`
- [ ] `header_get_prevrandao`
- [ ] `secp256r1` support
- [ ] `EC ops` support

### TODOs

#### Next Goals:

- [x] execute simple bytecode (DONE! run ERC20 decimals())
- [x] execute more complex bytecode accessing storage slots
  - [x] ~~needs `fusaka compatibility PR` on HDP for the sound run to pass~~
- [x] execute even more complex bytecode - a proxy running the code of another contract
  - [x] needs `account_get_bytecode PR` on HDP to be possible

#### TODOs:

> ℹ️ Search the code for `TODO: @herodotus [<subject>]`

- [x] Cleanup lib.cairo

  - [x] split into functions
  - [x] generic function for running calldata and expecting a result
  - [x] file with testing setup - a list of all calldata + expected result pairs to not have them hardcoded in lib.cairo
  - [x] run all methods on the HPECT1 contract - comment out the ones using calls to other contracts or precompiles we dont support

- [x] implement everything in [hdp-backend.cairo](./src/evm/hdp_backend.cairo)

  - [x] storage - todos with `[storage]`
  - [x] account - todos with `[account]`
    - [x] ~~`fetch_bytecode` remains unimplemented, it needs HDP support.~~
    - [ ] `is_deployed` currently returns `true` always, unless it panics, needs a proper way of handling this check

- [x] fix precompiles in [interpreter.cairo](./src/evm/interpreter.cairo) search for: `[precompiles]`
  - [ ] two precompiles need HDP to support them first: `EcAdd`, `EcMul`
  - [ ] also everything based on `secp256r1` won't work until HDP supports it
- [x] resolve `[misc]` TODOs along the way
- [x] Cleanup & brainstorm how to tackle Environment and Message structs setup in [lib.cairo](./src/lib.cairo)

  - [x] Especially Environment stuff like gas price, chain id, prevrandao, block number, gas limit, timestamp, coinbase, base fee - they all have to come from somewhere
    - [ ] Only field missing is `prevrundao`
    - [x] Better setup is places in `new_main` but needs HDP to support bytecode first.

- [x] Create a new folder `solidity` for testing contracts to use
  - [x] basic function, just simple bytecode
  - [x] more advanced functions
    - [x] using storage slots
    - [x] using precompiles
  - [x] proxy contract

---

## Mentions

This project makes use of code adapted from [**Kakarot**](https://github.com/kkrt-labs) [(@kkrt-labs/kakarot-ssj)](https://github.com/kkrt-labs/kakarot-ssj) under the [MIT License](https://github.com/kkrt-labs/kakarot-ssj/blob/main/LICENSE).

Thanks for all the hard work guys 🙏

> Original project: https://github.com/kkrt-labs/kakarot-ssj  
> License file: https://github.com/kkrt-labs/kakarot-ssj/blob/main/LICENSE

---

## License

`hdp-provable-eth-call` is licensed under the [GNU General Public License v3.0](./LICENSE).

---
