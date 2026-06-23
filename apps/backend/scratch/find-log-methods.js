const fs = require('fs');
const path = require('path');

const htmlPath = 'C:\\Users\\Asus\\.gemini\\antigravity\\brain\\8a551e00-e49c-4d87-8ce3-e1dbcfa02685\\scratch\\app-logs-page.html';
const html = fs.readFileSync(htmlPath, 'utf8');

console.log('Searching for log fetching methods...');
const componentId = 'Nmgfsla7t0ExWGDGIH6I';
const componentIndex = html.indexOf(`wire:id="${componentId}"`);
if (componentIndex === -1) {
  console.error('Component not found');
  return;
}

const componentHtml = html.substring(componentIndex, componentIndex + 15000);

// Search for wire:
const wireMatches = componentHtml.match(/wire:[a-zA-Z0-9\.:=\(\)'-]+/g) || [];
console.log('Wire directives found in logs component:', JSON.stringify([...new Set(wireMatches)], null, 2));

// Let's print out lines containing "container" or "server" or "select"
const lines = componentHtml.split('\n');
console.log('\nSample lines from logs component:');
lines.filter(l => l.includes('wire:') || l.toLowerCase().includes('select') || l.includes('container') || l.includes('log'))
     .slice(0, 20)
     .forEach(l => console.log(l.trim()));
