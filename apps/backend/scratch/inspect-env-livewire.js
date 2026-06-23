const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '..', 'env-page.html');
if (!fs.existsSync(filePath)) {
  console.error('File not found:', filePath);
  process.exit(1);
}

const html = fs.readFileSync(filePath, 'utf8');

function decodeHtmlEntities(str) {
  return str
    .replace(/&quot;/g, '"')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&#039;/g, "'");
}

console.log('--- Scanning Livewire Snapshots on Env Page ---');

const snapshotRegex = /wire:snapshot="([^"]+)"/g;
let match;
let count = 0;

while ((match = snapshotRegex.exec(html)) !== null) {
  const decoded = decodeHtmlEntities(match[1]);
  try {
    const snap = JSON.parse(decoded);
    console.log(`\nComponent #${++count}:`);
    console.log('Name:', snap.memo ? snap.memo.name : 'unknown');
    console.log('Path:', snap.memo ? snap.memo.path : 'unknown');
    console.log('Data keys:', Object.keys(snap.data || {}));
    if (snap.memo && snap.memo.name === 'shared.environment-variable.show') {
      console.log('  Env Details: key =', snap.data.key, ', value =', snap.data.value, ', isBuildTime =', snap.data.isBuildTime);
    }
  } catch (e) {
    // Ignore invalid JSON
  }
}
