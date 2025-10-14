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

- [ ] fix precompiles in `fn execute_code(ref vm: VM) -> ExecutionResult {`
- [ ] trustless Environment setup instead of hardcoding
- [ ] add HDP for getting accounts, storage slots etc
- [ ] resolve TODOs in code

---

This project makes use of code adapted from [**Kakarot**](https://github.com/kkrt-labs/kakarot-ssj) (@kkrt-labs/kakarot-ssj) under the [MIT License](https://github.com/kkrt-labs/kakarot-ssj/blob/main/LICENSE).

Thanks for all the hard work guys 🙏

> Original project: https://github.com/kkrt-labs/kakarot-ssj  
> License file: https://github.com/kkrt-labs/kakarot-ssj/blob/main/LICENSE
