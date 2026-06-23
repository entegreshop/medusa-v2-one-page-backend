const fs = require('fs');
const path = require('path');

const html = fs.readFileSync(path.join(__dirname, '..', '..', '..', '..', 'new-resource-page.html'), 'utf8');
const lines = html.split('\n');

console.log('--- Scanning for setType and applications list ---');

lines.forEach((line, idx) => {
  if (line.includes('setType') || line.includes('public git') || line.includes('private git') || line.includes('github-type') || line.includes('git-type')) {
    console.log(`Line ${idx + 1}: ${line.trim().substring(0, 300)}`);
  }
});

// Let's also print lines that contain JSON or lists of applications
const scriptLines = lines.filter(l => l.includes('applications') || l.includes('gitBased'));
console.log(`\nFound ${scriptLines.length} script lines referring to applications.`);
scriptLines.slice(0, 10).forEach(l => console.log(l.trim().substring(0, 200)));
