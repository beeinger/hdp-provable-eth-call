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
  const reversed = reverseBytePairs(padded);
  const low128 = "0x" + reversed.slice(32);
  const high128 = "0x" + reversed.slice(0, 32);
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

  const fullChunks = computeFullChunkCount(hex);
  const remainingNibbles = hex.length % 16;

  const values: string[] = [];

  // Array length (number of u64 words)
  values.push("0x" + fullChunks.toString(16));

  // Full 8-byte words in little-endian
  for (let i = 0; i < fullChunks * 16; i += 16) {
    const chunk = hex.slice(i, i + 16);
    values.push("0x" + toLittleEndianU64(chunk));
  }

  // Tail processing: last_input_word and last_input_num_bytes
  if (remainingNibbles > 0) {
    const remainingHex = hex.slice(fullChunks * 16);
    const paddedRemainingHex = remainingHex.padEnd(16, "0");
    const littleEndianRemaining = toLittleEndianU64(paddedRemainingHex);
    values.push("0x" + littleEndianRemaining);

    const validBytes = Math.floor(remainingNibbles / 2);
    values.push("0x" + validBytes.toString(16));
  } else {
    values.push("0x0");
    values.push("0x0");
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

async function readRawArgs(rawArgsPath: string): Promise<any[]> {
  return JSON.parse(await Bun.file(rawArgsPath).text());
}

async function writeInputsFile(inputs: Input[]): Promise<void> {
  await Bun.write("./input.json", JSON.stringify(inputs));
}

async function main() {
  const scriptDir = import.meta.dir;
  const [, , rawInputArg] = Bun.argv;
  if (!rawInputArg || rawInputArg.length === 0) {
    throw new Error(
      "Provide a path to the raw input JSON file as the first argument."
    );
  }

  const resolvedRawArgsPath = `${scriptDir}/../test_contracts/${rawInputArg}.json`;

  const args = await readRawArgs(resolvedRawArgsPath);
  const inputs = buildInputsFromArgs(args);

  //? Helpful for writing tests in cairo
  // console.log("Inputs: ");
  // for (const input of inputs) {
  //   console.write(input.value, ", ");
  // }
  // console.log();

  await writeInputsFile(inputs);
}

main();
