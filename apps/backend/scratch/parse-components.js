const fs = require('fs');
const path = require('path');

const htmlPath = 'C:\\Users\\Asus\\.gemini\\antigravity\\brain\\8a551e00-e49c-4d87-8ce3-e1dbcfa02685\\scratch\\deploy-page.html';
const html = fs.readFileSync(htmlPath, 'utf8');

function decodeHtmlEntities(str) {
  return str
    .replace(/&quot;/g, '"')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>');
}

console.log('Parsing Livewire component snapshots...');
const snapshotRegex = /wire:snapshot="([^"]+)"/g;
let match;
let count = 0;

while ((match = snapshotRegex.exec(html)) !== null) {
  count++;
  const decoded = decodeHtmlEntities(match[1]);
  try {
    const parsed = JSON.parse(decoded);
    console.log(`\nComponent #${count}:`);
    console.log(`ID: ${parsed.memo.id}`);
    console.log(`Name: ${parsed.memo.name}`);
    console.log(`Data Keys: ${Object.keys(parsed.data).join(', ')}`);
    
    // If it contains logs or activity, print them
    if (parsed.data.logs) {
      console.log('Logs (truncated):', parsed.data.logs.substring(0, 500));
    }
    if (parsed.data.activity) {
      console.log('Activity (truncated):', JSON.stringify(parsed.data.activity).substring(0, 500));
    }
    if (parsed.data.application_deployment_queue) {
      console.log('Deployment Queue Status:', parsed.data.application_deployment_queue);
    }
  } catch (err) {
    console.log(`Component #${count} failed to parse:`, err.message);
  }
}
