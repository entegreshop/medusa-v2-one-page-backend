const fs = require('fs');
const path = require('path');

const scratchDir = path.join(__dirname);
const files = fs.readdirSync(scratchDir);

console.log('--- Searching for SSH in scratch files ---');

files.forEach(file => {
  if (file.endsWith('.js')) {
    const content = fs.readFileSync(path.join(scratchDir, file), 'utf8');
    if (content.includes('ssh') || content.includes('PrivateKey') || content.includes('ssh2')) {
      console.log(`File: ${file} contains SSH references.`);
      
      // Print lines containing ssh
      const lines = content.split('\n');
      lines.forEach((line, idx) => {
        if (line.includes('ssh') || line.includes('PrivateKey') || line.includes('ssh2')) {
          console.log(`  Line ${idx + 1}: ${line.trim()}`);
        }
      });
    }
  }
});
