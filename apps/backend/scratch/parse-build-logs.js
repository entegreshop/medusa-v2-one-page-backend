const fs = require('fs');
const path = require('path');

const htmlPath = 'C:\\Users\\Asus\\.gemini\\antigravity\\brain\\8a551e00-e49c-4d87-8ce3-e1dbcfa02685\\scratch\\check-deploy-page.html';
if (!fs.existsSync(htmlPath)) {
  console.error('HTML file not found at:', htmlPath);
  process.exit(1);
}

const html = fs.readFileSync(htmlPath, 'utf8');
const logLineRegex = /data-log-content="([^"]+)"/g;
let match;
let logs = [];

while ((match = logLineRegex.exec(html)) !== null) {
  const content = match[1]
    .replace(/&quot;/g, '"')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&#039;/g, "'");
  logs.push(content);
}

console.log(`Total log lines found: ${logs.length}`);
console.log('--- FIRST 50 LOG LINES ---');
logs.slice(0, 50).forEach(line => console.log(line));

console.log('\n--- LAST 100 LOG LINES ---');
logs.slice(-100).forEach(line => console.log(line));
