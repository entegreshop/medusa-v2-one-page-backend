const fs = require('fs');
const path = require('path');

const html = fs.readFileSync(path.join(__dirname, '..', '..', '..', '..', 'new-resource-page.html'), 'utf8');

function decodeHtmlEntities(str) {
  return str
    .replace(/&quot;/g, '"')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>');
}

console.log('--- Inspecting project.new.select snapshot data ---');
const snapshotRegex = /wire:snapshot="([^"]+)"/g;
let match;
while ((match = snapshotRegex.exec(html)) !== null) {
  const decoded = decodeHtmlEntities(match[1]);
  if (decoded.includes('project.new.select')) {
    const snap = JSON.parse(decoded);
    console.log(JSON.stringify(snap, null, 2));
  }
}
