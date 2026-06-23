const fs = require('fs');
const path = require('path');

const html = fs.readFileSync(path.join(__dirname, '..', '..', '..', '..', 'new-resource-page.html'), 'utf8');
const lines = html.split('\n');

const startIdx = lines.findIndex(l => l.includes('project.new.select'));
if (startIdx !== -1) {
  console.log(`Found component at line ${startIdx + 1}`);
  const segment = lines.slice(5370, 5570);
  segment.forEach((line, idx) => {
    console.log(`${5370 + 1 + idx}: ${line.trim()}`);
  });
} else {
  console.log('Component not found');
}
