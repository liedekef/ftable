// build.mjs
import { readFile, writeFile, copyFile } from 'fs/promises';

const input = 'src/ftable.js'; // Your source
const outputEsm = 'ftable.esm.js';
const outputUmd = 'ftable.umd.js';
const outputStandalone = 'ftable.js'; // ← This is the standalone version

const source = await readFile(input, 'utf8');

// ESM version
const esm = `
${source}
export default FTable;
`;
await writeFile(outputEsm, esm);

// UMD version
const umd = `
(function (global) {
    ${source}

    // Expose classes globally
    global.FTable = FTable;
    global.FtableModal = FtableModal;
    global.FTableHttpClient = FTableHttpClient;

    // For CommonJS
    if (typeof module !== 'undefined' && module.exports) {
        module.exports = FTable;
        module.exports.FtableModal = FtableModal;
        module.exports.FTableHttpClient = FTableHttpClient;
    }
}(typeof globalThis !== 'undefined' ? globalThis :
  typeof window !== 'undefined' ? window :
  typeof global !== 'undefined' ? global : this));
`;
await writeFile(outputUmd, umd);

// ✅ Make ftable.js the standalone/UMD version (for backward compatibility)
await copyFile(outputUmd, outputStandalone);

console.log('✅ Built ftable.js (standalone), ftable.esm.js, ftable.umd.js');
