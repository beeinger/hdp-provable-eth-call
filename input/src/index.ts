import { existsSync, mkdirSync } from "fs";
import { join } from "path";

interface Input {
  visibility: "public";
  value: string;
}

function normalizeHex(hexString: string): string {
  return hexString.startsWith("0x") ? hexString.slice(2) : hexString;
}

function reverseBytePairs(hexString: string): string {
  const pairs = hexString.match(/.{2}/g);
  return pairs ? pairs.reverse().join("") : hexString;
}

function processCodeHash(codeHashArg: string): [string, string] {
  const normalized = normalizeHex(codeHashArg);
  const padded = normalized.padStart(64, "0");
  // const reversed = reverseBytePairs(padded);
  const low128 = "0x" + padded.slice(32);
  const high128 = "0x" + padded.slice(0, 32);
  return [low128, high128];
}

function computeFullChunkCount(bytecodeHex: string): number {
  return Math.floor(bytecodeHex.length / 16);
}

function toLittleEndianU64(hex16: string): string {
  return reverseBytePairs(hex16);
}

function buildBytecodeInputs(bytecodeArg: string): string[] {
  const hex = normalizeHex(bytecodeArg);

  //? Helpful for writing tests in cairo
  // console.log("Bytecode bytes: ");
  // for (let i = 0; i < hex.length; i += 2) {
  //   console.write("0x", hex.slice(i, i + 2), ", ");
  // }
  // console.log();

  // const fullChunks = computeFullChunkCount(hex);
  // const remainingNibbles = hex.length % 16;

  // const values: string[] = [];

  // // Array length (number of u64 words)
  // values.push("0x" + fullChunks.toString(16));

  // // Full 8-byte words in little-endian
  // for (let i = 0; i < fullChunks * 16; i += 16) {
  //   const chunk = hex.slice(i, i + 16);
  //   values.push("0x" + toLittleEndianU64(chunk));
  // }

  // // Tail processing: last_input_word and last_input_num_bytes
  // if (remainingNibbles > 0) {
  //   const remainingHex = hex.slice(fullChunks * 16);
  //   const paddedRemainingHex = remainingHex.padEnd(16, "0");
  //   const littleEndianRemaining = toLittleEndianU64(paddedRemainingHex);
  //   values.push("0x" + littleEndianRemaining);

  //   const validBytes = Math.floor(remainingNibbles / 2);
  //   values.push("0x" + validBytes.toString(16));
  // } else {
  //   values.push("0x0");
  //   values.push("0x0");
  // }

  // Ensure hex length is even by prepending with '0' if needed
  let normalizedHex = hex.length % 2 === 1 ? "0" + hex : hex;
  const values: string[] = [];
  // The byte length, in hex, prepended as first element
  values.push("0x" + (normalizedHex.length / 2).toString(16));
  for (let i = 0; i < normalizedHex.length; i += 2) {
    values.push("0x" + normalizedHex.slice(i, i + 2));
  }

  return values;
}

function buildInputsFromArgs(args: any[]): Input[] {
  const inputs: Input[] = [];

  const [codeHashLow128, codeHashHigh128] = processCodeHash(args[0]);
  inputs.push({ visibility: "public", value: codeHashLow128 });
  inputs.push({ visibility: "public", value: codeHashHigh128 });

  for (const value of buildBytecodeInputs(args[1])) {
    inputs.push({ visibility: "public", value });
  }

  return inputs;
}

async function readRawArgs(rawArgsPath: string): Promise<[string, string]> {
  return JSON.parse(await Bun.file(rawArgsPath).text());
}

async function writeInputsFile(inputs: Input[]): Promise<void> {
  await Bun.write("./input.json", JSON.stringify(inputs));
}

function getCacheDir(): string {
  const scriptDir = import.meta.dir;
  const cacheDir = join(scriptDir, "../cache");
  if (!existsSync(cacheDir)) {
    mkdirSync(cacheDir, { recursive: true });
  }
  return cacheDir;
}

function getCachePath(contractName: string): string {
  return join(getCacheDir(), `${contractName.toLowerCase()}.json`);
}

async function loadFromCache(
  contractName: string
): Promise<[string, string] | null> {
  const cachePath = getCachePath(contractName);
  if (!existsSync(cachePath)) {
    return null;
  }

  try {
    const cachedData = JSON.parse(await Bun.file(cachePath).text());
    return [cachedData.codeHash, cachedData.bytecode];
  } catch (error) {
    console.warn(`Failed to load cache for ${contractName}:`, error);
    return null;
  }
}

async function saveToCache(
  contractName: string,
  codeHash: string,
  bytecode: string
): Promise<void> {
  const cachePath = getCachePath(contractName);
  const cacheData = {
    codeHash,
    bytecode,
    timestamp: new Date().toISOString(),
  };

  await Bun.write(cachePath, JSON.stringify(cacheData, null, 2));
}

async function getRpcUrl(): Promise<string> {
  const scriptDir = import.meta.dir;
  const envPath = `${scriptDir}/../../solidity/.env`;
  const envContent = await Bun.file(envPath).text();
  const envLines = envContent.split("\n");

  for (const line of envLines) {
    if (line.startsWith("RPC_URL=")) {
      return line.split("=")[1].trim();
    }
  }

  throw new Error("RPC_URL not found in solidity/.env");
}

async function fetchContractData(
  contractAddress: string
): Promise<[string, string]> {
  const rpcUrl = await getRpcUrl();

  // Make RPC calls to get codeHash and bytecode
  const getProofResponse = await fetch(rpcUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      jsonrpc: "2.0",
      method: "eth_getProof",
      params: [contractAddress, [], "latest"],
      id: 1,
    }),
  });

  const getCodeResponse = await fetch(rpcUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      jsonrpc: "2.0",
      method: "eth_getCode",
      params: [contractAddress, "latest"],
      id: 2,
    }),
  });

  const proofData = await getProofResponse.json();
  const codeData = await getCodeResponse.json();

  if (proofData.error) {
    throw new Error(`eth_getProof failed: ${proofData.error.message}`);
  }

  if (codeData.error) {
    throw new Error(`eth_getCode failed: ${codeData.error.message}`);
  }

  const codeHash = proofData.result.codeHash;
  const bytecode = codeData.result;

  return [codeHash, bytecode];
}

async function loadContractDataByAddress(
  contractAddress: string,
  useCache: boolean = true
): Promise<[string, string]> {
  const cacheKey = `address_${contractAddress.toLowerCase()}`;

  // Try to load from cache first if caching is enabled
  if (useCache) {
    const cachedData = await loadFromCache(cacheKey);
    if (cachedData) {
      console.log(`Using cached data for address ${contractAddress}`);
      return cachedData;
    }
  } else {
    console.log(`Not using cache for address ${contractAddress}`);
  }

  const [codeHash, bytecode] = await fetchContractData(contractAddress);

  // Save to cache if caching is enabled
  if (useCache) {
    await saveToCache(cacheKey, codeHash, bytecode);
    console.log(`Cached data for address ${contractAddress}`);
  }

  return [codeHash, bytecode];
}

async function loadContractData(
  contractName: string,
  useCache: boolean = true
): Promise<[string, string]> {
  // Try to load from cache first if caching is enabled
  if (useCache) {
    const cachedData = await loadFromCache(contractName);
    if (cachedData) {
      console.log(`Using cached data for ${contractName}`);
      return cachedData;
    }
  } else {
    console.log(`Not using cache for ${contractName}`);
  }

  // Get contract address from env file
  const scriptDir = import.meta.dir;
  const envPath = `${scriptDir}/../../solidity/.env`;
  const envContent = await Bun.file(envPath).text();
  const envLines = envContent.split("\n");

  let contractAddress = "";
  for (const line of envLines) {
    if (line.startsWith(`${contractName}_ADDRESS=`)) {
      contractAddress = line.split("=")[1].trim();
      break;
    }
  }

  if (!contractAddress) {
    throw new Error(`${contractName}_ADDRESS not found in solidity/.env`);
  }

  const [codeHash, bytecode] = await fetchContractData(contractAddress);

  // Save to cache if caching is enabled
  if (useCache) {
    await saveToCache(contractName, codeHash, bytecode);
    console.log(`Cached data for ${contractName}`);
  }

  return [codeHash, bytecode];
}

function showHelp() {
  console.log(`
Usage: bun run index.ts <command> [options]

Commands:
  -f <file_path>     Load raw input from test_contracts directory
  -c <contract_name> Load contract data by name (HPECT1, HPECT2, HPECT3)
  -a <address>       Load contract data by Ethereum address
  -h, --help         Show this help message

Options:
  --no-cache         Bypass cache and fetch fresh data from RPC

Examples:
  bun run index.ts -f HPECT1
  bun run index.ts -c HPECT1
  bun run index.ts -a 0xe5d5bc62cf36fb14efd8c32238c5d39b15bbffd1
  bun run index.ts -c HPECT1 --no-cache
  bun run index.ts -a 0x1234... --no-cache

Cache:
  Contract data is cached in the 'cache' directory for faster subsequent runs.
  Use --no-cache to force fresh data from the blockchain.
`);
}

async function main() {
  const args = Bun.argv.slice(2);

  // Check for help flag
  if (args.length === 0 || args.includes("-h") || args.includes("--help")) {
    showHelp();
    return;
  }

  if (args.length < 2) {
    console.error("Error: Missing required arguments");
    showHelp();
    process.exit(1);
  }

  // Check for --no-cache flag
  const noCache = args.includes("--no-cache");
  const filteredArgs = args.filter((arg) => arg !== "--no-cache");

  if (filteredArgs.length < 2) {
    console.error(
      "Error: Missing required arguments after filtering --no-cache"
    );
    showHelp();
    process.exit(1);
  }

  const [flag, value] = filteredArgs;
  let rawArgs: [string, string];

  if (flag === "-f") {
    // File mode: load from test_contracts directory
    rawArgs = await readRawArgs(value);
  } else if (flag === "-c") {
    // Contract mode: load from deployment data
    const allowedContracts = ["HPECT1", "HPECT2", "HPECT3"];
    if (!allowedContracts.includes(value)) {
      console.error(
        `Error: Contract name must be one of: ${allowedContracts.join(", ")}`
      );
      showHelp();
      process.exit(1);
    }
    rawArgs = await loadContractData(value, !noCache);
  } else if (flag === "-a") {
    // Address mode: load from arbitrary contract address
    if (!value.startsWith("0x") || value.length !== 42) {
      console.error(
        "Error: Invalid address format. Must be a valid Ethereum address (0x...)"
      );
      showHelp();
      process.exit(1);
    }
    rawArgs = await loadContractDataByAddress(value, !noCache);
  } else {
    console.error(
      `Error: Invalid flag '${flag}'. Use -f for file path, -c for contract name, or -a for address`
    );
    showHelp();
    process.exit(1);
  }

  const inputs = buildInputsFromArgs(rawArgs);

  //? Helpful for writing tests in cairo
  // console.log("Inputs: ");
  // for (const input of inputs) {
  //   console.write(input.value, ", ");
  // }
  // console.log();

  await writeInputsFile(inputs);
}

main();
