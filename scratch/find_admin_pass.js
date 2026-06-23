const fs = require('fs');
const path = require('path');

function walkDir(dir) {
  let results = [];
  const list = fs.readdirSync(dir);
  list.forEach(file => {
    if (['node_modules', '.git', '.next', 'dist', '.medusa', '.turbo', 'build'].includes(file)) {
      return;
    }
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    if (stat && stat.isDirectory()) {
      results = results.concat(walkDir(filePath));
    } else {
      if (file.endsWith('.ts') || file.endsWith('.tsx') || file.endsWith('.js') || file.endsWith('.json')) {
        results.push(filePath);
      }
    }
  });
  return results;
}

const files = walkDir('c:\\Users\\Asus\\Downloads\\Medusa V2 - One Page');
files.forEach(file => {
  try {
    const content = fs.readFileSync(file, 'utf8');
    if (content.includes('admin@medusa-test.com') || content.includes('create-local-user') || content.includes('create-admin')) {
      console.log(`Match in file: ${file}`);
      // Print lines containing the match
      const lines = content.split('\n');
      lines.forEach((line, idx) => {
        if (line.includes('admin@medusa-test.com') || line.includes('create-local-user') || line.includes('create-admin') || line.includes('password')) {
          console.log(`  L${idx + 1}: ${line.trim()}`);
        }
      });
    }
  } catch (err) {}
});
