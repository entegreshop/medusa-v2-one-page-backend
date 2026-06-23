const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, 'app_fnjekbskvqux7jzy4rjs1yef.html');
if (!fs.existsSync(filePath)) {
  console.error('File not found:', filePath);
  process.exit(1);
}

const html = fs.readFileSync(filePath, 'utf8');

function decodeHtmlEntities(str) {
  return str
    .replace(/&quot;/g, '"')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>');
}

const snapshotRegex = /wire:snapshot="([^"]+)"/g;
let match;

while ((match = snapshotRegex.exec(html)) !== null) {
  const decoded = decodeHtmlEntities(match[1]);
  try {
    const snap = JSON.parse(decoded);
    const name = snap.memo ? snap.memo.name : 'unknown';
    if (name.includes('project.application')) {
      console.log(`\n================ COMPONENT: ${name} ================`);
      const a = snap.data.application || {};
      console.log('destination:', a.destination || snap.data.destination);
      console.log('server:', a.server || snap.data.server);
      // Let's print all keys in data
      console.log('Data keys:', Object.keys(snap.data));
      // Print application properties
      if (snap.data.application) {
        console.log('Application keys:', Object.keys(snap.data.application));
        console.log('Destination ID:', snap.data.application.destination_id);
        console.log('Server ID:', snap.data.application.server_id);
      }
    }
  } catch (e) {}
}
