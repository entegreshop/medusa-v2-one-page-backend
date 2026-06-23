const fs = require('fs');
const path = require('path');

const htmlPath = 'C:\\Users\\Asus\\.gemini\\antigravity\\brain\\8a551e00-e49c-4d87-8ce3-e1dbcfa02685\\scratch\\deploy-page.html';
const html = fs.readFileSync(htmlPath, 'utf8');

console.log('Searching for log elements in HTML...');

// 1. Search for <pre> tags
const preRegex = /<pre[^>]*>([\s\S]*?)<\/pre>/gi;
let match;
let preCount = 0;
while ((match = preRegex.exec(html)) !== null) {
  preCount++;
  console.log(`\n--- Pre Tag #${preCount} (first 500 chars) ---`);
  console.log(match[1].trim().substring(0, 500));
}

// 2. Search for code tags
const codeRegex = /<code[^>]*>([\s\S]*?)<\/code>/gi;
let codeCount = 0;
while ((match = codeRegex.exec(html)) !== null) {
  codeCount++;
  console.log(`\n--- Code Tag #${codeCount} (first 500 chars) ---`);
  console.log(match[1].trim().substring(0, 500));
}

// 3. Search for divs with classes like log, activity, terminal, console
const divRegex = /<div\s+[^>]*class="[^"]*(log|activity|terminal|console)[^"]*"[^>]*>([\s\S]*?)<\/div>/gi;
let divCount = 0;
while ((match = divRegex.exec(html)) !== null) {
  divCount++;
  console.log(`\n--- Div Tag #${divCount} (first 500 chars) ---`);
  console.log(match[2].trim().substring(0, 500));
}

console.log(`\nSearch complete. Pre count: ${preCount}, Code count: ${codeCount}, Div count: ${divCount}`);
