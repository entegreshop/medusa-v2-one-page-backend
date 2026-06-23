const fs = require('fs');
const path = require('path');

const htmlPath = 'C:\\Users\\Asus\\.gemini\\antigravity\\brain\\8a551e00-e49c-4d87-8ce3-e1dbcfa02685\\scratch\\live-logs.html';
const html = fs.readFileSync(htmlPath, 'utf8');

console.log('Searching for logs loading methods...');
const componentIndex = html.indexOf('project.shared.get-logs');
if (componentIndex === -1) {
  console.error('Component not found');
  return;
}

const componentHtml = html.substring(componentIndex - 500, componentIndex + 15000);

// Find wire directives
const wireMatches = componentHtml.match(/wire:[a-zA-Z0-9\.:=\(\)'-]+/g) || [];
console.log('Wire directives found in get-logs component:', JSON.stringify([...new Set(wireMatches)], null, 2));

// Print sample lines containing x-init or wire:
const lines = componentHtml.split('\n');
console.log('\nSample lines from get-logs component:');
lines.filter(l => l.includes('wire:') || l.includes('x-init') || l.includes('polling') || l.includes('get'))
     .slice(0, 20)
     .forEach(l => console.log(l.trim()));
