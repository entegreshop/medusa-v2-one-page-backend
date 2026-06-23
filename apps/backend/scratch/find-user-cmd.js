const fs = require('fs');
const path = require('path');

const cliPath = 'c:\\Users\\Asus\\Downloads\\Medusa V2 - One Page\\backend\\node_modules\\@medusajs\\cli\\dist\\create-cli.js';
if (!fs.existsSync(cliPath)) {
  console.log('CLI JS not found at:', cliPath);
  process.exit(1);
}

const content = fs.readFileSync(cliPath, 'utf8');
const lines = content.split('\n');

let foundIndex = -1;
lines.forEach((line, index) => {
  if (line.includes('User created successfully')) {
    foundIndex = index;
  }
});

if (foundIndex !== -1) {
  console.log(`Found "User created successfully" at line ${foundIndex + 1}:`);
  const start = Math.max(0, foundIndex - 20);
  const end = Math.min(lines.length - 1, foundIndex + 20);
  for (let i = start; i <= end; i++) {
    console.log(`${i + 1}: ${lines[i]}`);
  }
} else {
  console.log('Could not find "User created successfully" in create-cli.js');
}
