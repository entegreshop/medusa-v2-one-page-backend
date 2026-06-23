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

console.log('--- Existing Environment Variable Components ---');

const snapshotRegex = /wire:snapshot="([^"]+)"/g;
let match;

while ((match = snapshotRegex.exec(html)) !== null) {
  const decoded = decodeHtmlEntities(match[1]);
  try {
    const snap = JSON.parse(decoded);
    const name = snap.memo ? snap.memo.name : 'unknown';
    if (name === 'project.shared.environment-variable.show') {
      const data = snap.data || {};
      const envObj = data.env || {};
      
      console.log(`\nKey: ${data.key || envObj.key}`);
      console.log('Value:', data.value || envObj.value);
      console.log('ID (wire:id):', snap.memo.id);
      console.log('Data keys:', Object.keys(data));
      if (data.env) {
        console.log('  env properties:', Object.keys(data.env));
        console.log('  env.id:', data.env.id);
      }
    }
  } catch (e) {}
}
