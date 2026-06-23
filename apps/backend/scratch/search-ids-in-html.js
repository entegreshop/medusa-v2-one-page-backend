const fs = require('fs');
const path = require('path');

const html = fs.readFileSync(path.join(__dirname, '..', '..', '..', '..', 'new-resource-page.html'), 'utf8');
const lines = html.split('\n');

console.log('--- Searching for UUIDs in new-resource-page.html ---');

lines.forEach((line, idx) => {
  if (line.includes('u3ygv4ejpxwxey72m8ailvw2') || line.includes('zglc5innzscg8e9nc0xdy71l')) {
    console.log(`Line ${idx + 1}: ${line.trim().substring(0, 300)}`);
  }
});
