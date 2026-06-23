const fs = require('fs');

const html = fs.readFileSync('env-page.html', 'utf8');

// Find all wire:snapshot attributes
const snapshotRegex = /wire:snapshot="([^"]+)"/g;
let match;
let count = 0;

function decodeHtmlEntities(str) {
  return str
    .replace(/&quot;/g, '"')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&#039;/g, "'");
}

console.log('--- COOLIFY ENVIRONMENT VARIABLES ---');

while ((match = snapshotRegex.exec(html)) !== null) {
  const decoded = decodeHtmlEntities(match[1]);
  try {
    const snap = JSON.parse(decoded);
    if (snap.data && snap.data.key) {
      const key = snap.data.key;
      const value = snap.data.value;
      console.log(`${key} = ${value}`);
      count++;
    }
  } catch (e) {
    // Ignore invalid JSON snapshots
  }
}

console.log(`\nTotal variables found: ${count}`);
