const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, 'app_fnjekbskvqux7jzy4rjs1yef.html');
if (!fs.existsSync(filePath)) {
  console.error('File not found:', filePath);
  process.exit(1);
}

const html = fs.readFileSync(filePath, 'utf8');

console.log('--- Searching for inputs and configuration in Coolify App HTML ---');

// Find all input fields with their names/wire:model and values
const inputRegex = /<input[^>]+>/g;
let match;
while ((match = inputRegex.exec(html)) !== null) {
  const tag = match[0];
  const nameMatch = tag.match(/(?:name|wire:model|id)="([^"]+)"/);
  const valueMatch = tag.match(/value="([^"]*)"/);
  if (nameMatch || valueMatch) {
    const name = nameMatch ? nameMatch[1] : 'unknown';
    const value = valueMatch ? valueMatch[1] : 'none';
    if (name.includes('fqdn') || name.includes('port') || name.includes('mapping') || value.includes('sslip.io') || value.includes('3000') || value.includes('9001')) {
      console.log(`Input: ${tag}`);
    }
  }
}

// Let's search for "9001", "3000", "8001" anywhere in the HTML
const lines = html.split('\n');
console.log('\n--- Mentions of Ports/Numbers in HTML ---');
lines.forEach((line, idx) => {
  if (line.includes('9001') || line.includes('8001') || line.includes('3000')) {
    console.log(`Line ${idx + 1}: ${line.trim()}`);
  }
});
