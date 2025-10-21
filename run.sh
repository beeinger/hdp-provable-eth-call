bun run input/src/index.ts -c HPECT1 &&\
    scarb build --verbosity no-warnings &&\
    hdp-cli dry-run -m ./target/dev/hdp_bytecode_executable.compiled_contract_class.json --inputs ./input.json --print_output

hdp-cli fetch-proofs

hdp-cli sound-run -m target/dev/hdp_bytecode_executable.compiled_contract_class.json --inputs ./input.json --print_output --cairo_pie ./pie.zip

# If you're feeling brave:
# hdp-cli sound-run -m target/dev/hdp_bytecode_executable.compiled_contract_class.json --inputs ./input.json --proof_mode --stwo_proof ./proof.json