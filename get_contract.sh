#!/usr/bin/env bash
set -euo pipefail



### USAGE
### PASS FILE NAME AND ADDRESS
### NEEDS /inputs/test_contracts dir

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <contract_address> <output_name>" >&2
  echo "   or: $0 <output_name> <contract_address>" >&2
  exit 1
fi

is_address_like() {
  local value="${1:-}"
  [[ "${value,,}" =~ ^0x[0-9a-f]{40}$ || "${value,,}" =~ ^[0-9a-f]{40}$ ]]
}

ARG1="$1"
ARG2="$2"

if is_address_like "${ARG1}"; then
  ADDRESS="${ARG1}"
  OUTPUT_NAME="${ARG2}"
elif is_address_like "${ARG2}"; then
  ADDRESS="${ARG2}"
  OUTPUT_NAME="${ARG1}"
else
  echo "Provide a 20-byte address (with or without 0x prefix) as one of the two arguments." >&2
  echo "Usage: $0 <contract_address> <output_name>" >&2
  echo "   or: $0 <output_name> <contract_address>" >&2
  exit 1
fi

OUTPUT_DIR="input/test_contracts"
OUTPUT_PATH="${OUTPUT_DIR}/${OUTPUT_NAME}.json"
RPC_URL="${RPC_URL_ETHEREUM_TESTNET:-}"
BLOCK_TAG="${BLOCK_TAG:-latest}"

if [[ -z "$RPC_URL" && -f ".env" ]]; then
  # shellcheck disable=SC1091
  source .env
  RPC_URL="${RPC_URL_ETHEREUM_TESTNET:-}"
fi

if [[ -z "$RPC_URL" ]]; then
  echo "Set RPC_URL_ETHEREUM_TESTNET in your environment to call Sepolia." >&2
  exit 1
fi

if [[ "${ADDRESS:0:2}" != "0x" ]]; then
  ADDRESS="0x${ADDRESS}"
fi

if [[ "${OUTPUT_NAME}" == *".json" ]]; then
  echo "Provide output name without extension (example: contract1)." >&2
  exit 1
fi

if [[ "${OUTPUT_NAME}" == *"/"* ]]; then
  echo "Output name must not contain '/' characters." >&2
  exit 1
fi

fetch_json() {
  local method="$1"
  local params="$2"
  curl -s \
    -X POST \
    -H 'Content-Type: application/json' \
    --data "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"${method}\",\"params\":${params}}" \
    "${RPC_URL}"
}

extract_or_fail() {
  local response="$1"
  local jq_filter="$2"
  local description="$3"

  local error
  error="$(jq -r '.error.message? // empty' <<<"${response}")"
  if [[ -n "${error}" ]]; then
    echo "RPC error while fetching ${description}: ${error}" >&2
    exit 1
  fi

  jq -er "${jq_filter}" <<<"${response}"
}

proof_response="$(fetch_json "eth_getProof" "[\"${ADDRESS}\", [], \"${BLOCK_TAG}\"]")"
code_hash="$(extract_or_fail "${proof_response}" '.result.codeHash' "code hash")"

code_response="$(fetch_json "eth_getCode" "[\"${ADDRESS}\", \"${BLOCK_TAG}\"]")"
bytecode="$(extract_or_fail "${code_response}" '.result' "contract bytecode")"

if [[ "${bytecode}" == "0x" ]]; then
  echo "Contract at ${ADDRESS} has no deployed bytecode on ${BLOCK_TAG}." >&2
  exit 1
fi

mkdir -p "${OUTPUT_DIR}"
jq -n --arg codeHash "${code_hash}" --arg bytecode "${bytecode}" '[ $codeHash, $bytecode ]' >"${OUTPUT_PATH}"

echo "Wrote code hash and bytecode for ${ADDRESS} to ${OUTPUT_PATH}"
