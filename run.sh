# bun run input/src/index.ts -c HPECT1 &&\
bun run input/src/index.ts -a 0xdAC17F958D2ee523a2206206994597C13D831ec7 &&\
    scarb build --verbosity no-warnings &&\
    hdp-cli dry-run -m ./target/dev/hdp_provable_eth_call_executable.compiled_contract_class.json --inputs ./input.json --print_output &&\
    hdp-cli fetch-proofs &&\
    hdp-cli sound-run -m target/dev/hdp_provable_eth_call_executable.compiled_contract_class.json --inputs ./input.json --print_output --proof_mode
    # hdp-cli sound-run -m target/dev/hdp_provable_eth_call_executable.compiled_contract_class.json --inputs ./input.json --print_output --cairo_pie ./pie.zip


#? If you're feeling brave (probably need like 500GB of RAM, for sure more than 70GB):
# hdp-cli sound-run -m target/dev/hdp_provable_eth_call_executable.compiled_contract_class.json --inputs ./input.json --proof_mode --stwo_proof ./proof.json