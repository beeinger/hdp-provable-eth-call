bun run input/src/index.ts &&\
    scarb build &&\
    hdp-cli dry-run -m ./target/dev/hdp_bytecode_executable.compiled_contract_class.json --inputs ./input.json --print_output

hdp-cli fetch-proofs

hdp-cli sound-run -m target/dev/hdp_bytecode_executable.compiled_contract_class.json --inputs ./input.json --print_output