const fs = require('fs');
const path = require('path');

const htmlPath = 'C:\\Users\\Asus\\.gemini\\antigravity\\brain\\8a551e00-e49c-4d87-8ce3-e1dbcfa02685\\scratch\\app-logs-page.html';
const html = fs.readFileSync(htmlPath, 'utf8');

console.log('Parsing Livewire component snapshots from logs page...');
const snapshotRegex = /wire:snapshot="([^"]+)"/g;
let match;
let count = 0;

while ((match = snapshotRegex.exec(html)) !== null) {
  count++;
  const decoded = match[1].replace(/&quot;/g, '"').replace(/&amp;/g, '&');
  try {
    const parsed = JSON.parse(decoded);
    const name = parsed.memo.name;
    
    // Check if the component name is related to logs or container
    if (name.includes('log') || name.includes('activity') || name.includes('container') || name.includes('show') || name.includes('general')) {
      console.log(`\nComponent #${count}:`);
      console.log(`ID: ${parsed.memo.id}`);
      console.log(`Name: ${name}`);
      console.log(`Data Keys: ${Object.keys(parsed.data).join(', ')}`);
      
      if (parsed.data.container) {
        console.log(`Container:`, JSON.stringify(parsed.data.container));
      }
      if (parsed.data.containers) {
        console.log(`Containers:`, JSON.stringify(parsed.data.containers));
      }
    }
  } catch (err) {
    // ignore
  }
}
