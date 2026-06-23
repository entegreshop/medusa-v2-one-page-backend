const fs = require('fs');
const path = require('path');

const html = fs.readFileSync(path.join(__dirname, '..', '..', '..', '..', 'new-resource-page.html'), 'utf8');

console.log('--- Searching for project.new.select wire:click and actions ---');

const lines = html.split('\n');
lines.forEach((line, idx) => {
  if (line.includes('wire:click') || line.includes('wire:submit') || line.includes('select')) {
    if (line.includes('project.new.select') || line.includes('type') || line.includes('server') || line.includes('git')) {
      console.log(`Line ${idx + 1}: ${line.trim().substring(0, 300)}`);
    }
  }
});
