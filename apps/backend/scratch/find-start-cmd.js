const fs = require('fs');
const path = require('path');

const htmlPath = 'C:\\Users\\Asus\\.gemini\\antigravity\\brain\\8a551e00-e49c-4d87-8ce3-e1dbcfa02685\\scratch\\deploy-page.html';
const html = fs.readFileSync(htmlPath, 'utf8');

console.log('Searching for start command in build logs...');
const lines = html.split('\n');

lines.forEach((line, index) => {
  if (line.includes('CMD') || line.toLowerCase().includes('start') || line.includes('nixpacks.toml') || line.includes('logging')) {
    // Only print lines that look like log lines or configurations
    if (line.includes('data-line-text')) {
      console.log(`[Line ${index+1}] ${line.trim().substring(0, 300)}`);
    }
  }
});
