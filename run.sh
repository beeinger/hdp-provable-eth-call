scarb build --verbosity no-warnings &&\
hdp dry-run -m ./target/dev/hdp_provable_eth_call_executable.compiled_contract_class.json --print_output &&\
hdp fetch-proofs &&\
hdp sound-run -m target/dev/hdp_provable_eth_call_executable.compiled_contract_class.json --print_output --proof_mode &&\
hdp sound-run -m target/dev/hdp_provable_eth_call_executable.compiled_contract_class.json --print_output

# hdp sound-run -m target/dev/hdp_provable_eth_call_executable.compiled_contract_class.json --print_output --cairo_pie ./pie.zip


#? If you're feeling brave (probably need like 500GB of RAM, for sure more than 70GB):
# hdp sound-run -m target/dev/hdp_provable_eth_call_executable.compiled_contract_class.json --print_output --proof_mode --stwo_proof ./proof.json