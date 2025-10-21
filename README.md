# HDP EVM ByteCode

## Prerequisites

### [HDP CLI](https://github.com/HerodotusDev/hdp-cairo)

To install run:

```
curl -fsSL https://raw.githubusercontent.com/HerodotusDev/hdp-cairo/main/install-cli.sh | bash
```

### [Bun](https://bun.com/)

To install run:

```
curl -fsSL https://bun.sh/install | bash
```

## Before first run

```
hdp-cli link
cd input && bun i && cd ..
```

## Development

To run see commands in [`run.sh`](./run.sh) or run it directly:

```
./run.sh
```

### TODOs

#### Next Goals:

- [x] execute simple bytecode (DONE! run ERC20 decimals())
- [x] execute more complex bytecode accessing storage slots
  - [ ] needs `fusaka compatibility PR` on HDP for the sound run to pass
- [ ] execute even more complex bytecode - a proxy running the code of another contract
  - [ ] needs `account_get_bytecode PR` on HDP to be possible

#### TODOs:

> ℹ️ Search the code for `TODO: @herodotus [<subject>]`

- [ ] Cleanup lib.cairo

  - [ ] split into functions
  - [ ] generic function for running calldata and expecting a result
  - [ ] file with testing setup - a list of all calldata + expected result pairs to not have them hardcoded in lib.cairo
  - [ ] run all methods on the HPECT1 contract - comment out the ones using calls to other contracts or precompiles we dont support

- [x] implement everything in [hdp-backend.cairo](./src/evm/hdp_backend.cairo)

  - [x] storage - todos with `[storage]`
  - [x] account - todos with `[account]`
    - [ ] `fetch_bytecode` remains unimplemented, it needs HDP support.
    - [ ] `is_deployed` currently returns `true` always, unless it panics, needs a proper way of handling this check

- [x] fix precompiles in [interpreter.cairo](./src/evm/interpreter.cairo) search for: `[precompiles]`
  - [ ] two precompiles need HDP to support them first: `EcAdd`, `EcMul`
  - [ ] also everything based on `secp256r1` won't work until HDP supports it
- [x] resolve `[misc]` TODOs along the way
- [x] Cleanup & brainstorm how to tackle Environment and Message structs setup in [lib.cairo](./src/lib.cairo)

  - [x] Especially Environment stuff like gas price, chain id, prevrandao, block number, gas limit, timestamp, coinbase, base fee - they all have to come from somewhere
    - [ ] Only field missing is `prevrundao`
    - [ ] Better setup is places in `new_main` but needs HDP to support bytecode first.

- [x] Create a new folder `solidity` for testing contracts to use
  - [x] basic function, just simple bytecode
  - [x] more advanced functions
    - [x] using storage slots
    - [x] using precompiles
  - [x] proxy contract

#### HDP requested features

- [ ] `account_get_bytecode`
- [ ] `fusaka fork` compatibility
- [ ] `account_is_deployed`
- [ ] `header_get_prevrandao`
- [ ] `secp256r1` support
- [ ] `EC ops` support

---

This project makes use of code adapted from [**Kakarot**](https://github.com/kkrt-labs) [(@kkrt-labs/kakarot-ssj)](https://github.com/kkrt-labs/kakarot-ssj) under the [MIT License](https://github.com/kkrt-labs/kakarot-ssj/blob/main/LICENSE).

Thanks for all the hard work guys 🙏

> Original project: https://github.com/kkrt-labs/kakarot-ssj  
> License file: https://github.com/kkrt-labs/kakarot-ssj/blob/main/LICENSE
