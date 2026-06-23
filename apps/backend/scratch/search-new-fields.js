const fs = require('fs');
const path = require('path');

const html = fs.readFileSync(path.join(__dirname, '..', '..', '..', '..', 'new-resource-page.html'), 'utf8');
const lines = html.split('\n');

console.log('--- Searching for inputs and selects in new-resource-page.html ---');

lines.forEach((line, idx) => {
  if (line.includes('wire:model') || line.includes('select') || line.includes('option')) {
    if (line.includes('server') || line.includes('destination') || line.includes('uuid') || line.includes('id')) {
      console.log(`Line ${idx + 1}: ${line.trim().substring(0, 300)}`);
    }
  }
});
