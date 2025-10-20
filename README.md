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
- [ ] execute more complex bytecode accessing storage slots
- [ ] execute even more complex bytecode - a proxy running the code of another contract

#### TODOs:

> ℹ️ Search the code for `TODO: @herodotus [<subject>]`

- [ ] implement everything in [hdp-backend.cairo](./src/evm/hdp_backend.cairo)

  - [ ] storage - todos with `[storage]`
  - [ ] account - todos with `[account]`

- [ ] fix precompiles in [interpreter.cairo](./src/evm/interpreter.cairo) search for: `[precompiles]`
- [ ] resolve `[misc]` TODOs along the way
- [ ] Cleanup & brainstorm how to tackle Environment and Message structs setup in [lib.cairo](./src/lib.cairo)
  - [ ] Especially Environment stuff like gas price, chain id, randao, block number, gas limit, timestamp, coinbase, base fee - they all have to come from somewhere

---

This project makes use of code adapted from [**Kakarot**](https://github.com/kkrt-labs) [(@kkrt-labs/kakarot-ssj)](https://github.com/kkrt-labs/kakarot-ssj) under the [MIT License](https://github.com/kkrt-labs/kakarot-ssj/blob/main/LICENSE).

Thanks for all the hard work guys 🙏

> Original project: https://github.com/kkrt-labs/kakarot-ssj  
> License file: https://github.com/kkrt-labs/kakarot-ssj/blob/main/LICENSE
