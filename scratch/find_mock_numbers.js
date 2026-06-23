const fs = require('fs');
const path = require('path');

const targetNumbers = ['988', '1870', '10900', '5200', '410'];

function walkDir(dir) {
  let results = [];
  const list = fs.readdirSync(dir);
  list.forEach(file => {
    // skip node_modules, .git, .next, dist
    if (['node_modules', '.git', '.next', 'dist', '.medusa', '.turbo', 'build'].includes(file)) {
      return;
    }
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    if (stat && stat.isDirectory()) {
      results = results.concat(walkDir(filePath));
    } else {
      if (file.endsWith('.ts') || file.endsWith('.tsx') || file.endsWith('.js') || file.endsWith('.jsx') || file.endsWith('.json') || file.endsWith('.html')) {
        results.push(filePath);
      }
    }
  });
  return results;
}

const rootDir = 'c:\\Users\\Asus\\Downloads\\Medusa V2 - One Page';
console.log('Scanning files...');
const files = walkDir(rootDir);
console.log(`Found ${files.length} candidate files. Searching...`);

files.forEach(file => {
  try {
    const content = fs.readFileSync(file, 'utf8');
    targetNumbers.forEach(num => {
      if (content.includes(num)) {
        console.log(`Match: file "${file}" contains "${num}"`);
      }
    });
  } catch (err) {
    // Ignore read errors
  }
});
console.log('Search finished.');
