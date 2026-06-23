const fs = require('fs');

const html = fs.readFileSync('env-page.html', 'utf8');
const lines = html.split('\n');

const start = 12130;
const end = 12190;
for (let i = start; i <= end; i++) {
  if (lines[i]) {
    console.log(`${i + 1}: ${lines[i].trim()}`);
  }
}
