const fs = require('fs');
const path = require('path');

const htmlPath = 'C:\\Users\\Asus\\.gemini\\antigravity\\brain\\8a551e00-e49c-4d87-8ce3-e1dbcfa02685\\scratch\\app-page.html';
const html = fs.readFileSync(htmlPath, 'utf8');

console.log('Searching for submit actions inside project.application.general...');

// Find the section of HTML that belongs to this component
const componentId = 'wmTOinvaIiscx6J5xRHs';
const componentIndex = html.indexOf(`wire:id="${componentId}"`);
if (componentIndex === -1) {
  console.error(`Component with ID ${componentId} not found in HTML.`);
  return;
}

// Slice the HTML starting from the component's opening tag (up to 30000 chars should cover the form)
const componentHtml = html.substring(componentIndex, componentIndex + 30000);

// Search for wire:submit or wire:click or submit buttons
console.log('\nSearching for submit directives...');
const submitMatch = componentHtml.match(/wire:submit(?:\.prevent)?="([^"]+)"/g) || componentHtml.match(/wire:click="([^"]+)"/g);
if (submitMatch) {
  console.log('Found submit/click directives:', JSON.stringify([...new Set(submitMatch)], null, 2));
} else {
  console.log('No direct submit/click directives found in first 30000 chars.');
}

// Let's print out lines containing "submit" or "button" or "save" inside the component HTML
const lines = componentHtml.split('\n');
console.log('\nSample lines containing form elements:');
lines.filter(line => line.includes('submit') || line.includes('save') || line.includes('button') || line.includes('submitGeneralSettings') || line.includes('submitGeneral'))
     .slice(0, 20)
     .forEach(line => console.log(line.trim()));
