const fs = require('fs');
const path = require('path');

function searchDir(dir, pattern) {
  const files = fs.readdirSync(dir);
  for (const file of files) {
    const fullPath = path.join(dir, file);
    const stat = fs.statSync(fullPath);
    if (stat.isDirectory()) {
      if (file !== 'node_modules' && !file.startsWith('.')) {
        searchDir(fullPath, pattern);
      }
    } else if (file.endsWith('.js') || file.endsWith('.ts')) {
      const content = fs.readFileSync(fullPath, 'utf8');
      if (content.includes(pattern)) {
        console.log(`Found in file: ${fullPath}`);
        const lines = content.split('\n');
        lines.forEach((line, idx) => {
          if (line.includes(pattern)) {
            console.log(`${idx + 1}: ${line.trim()}`);
          }
        });
      }
    }
  }
}

console.log('Searching for "User created successfully"...');
searchDir('c:\\Users\\Asus\\Downloads\\Medusa V2 - One Page\\backend\\node_modules\\@medusajs', 'User created successfully');
