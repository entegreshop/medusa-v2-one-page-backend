const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '..', 'env-page.html');
const html = fs.readFileSync(filePath, 'utf8');

function decodeHtmlEntities(str) {
  return str
    .replace(/&quot;/g, '"')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>');
}

const snapshotRegex = /wire:snapshot="([^"]+)"/g;
let match;
const names = new Set();

while ((match = snapshotRegex.exec(html)) !== null) {
  const decoded = decodeHtmlEntities(match[1]);
  try {
    const snap = JSON.parse(decoded);
    const name = snap.memo ? snap.memo.name : 'unknown';
    names.add(name);
  } catch (e) {}
}

console.log('Component Names on Env Page:', [...names]);
