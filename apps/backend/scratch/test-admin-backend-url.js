const http = require('http');

const url = 'http://204.168.136.196:9001/app/assets/index-p6FA_fOf.js';

console.log('Fetching admin JS bundle from:', url);

http.get(url, (res) => {
  if (res.statusCode !== 200) {
    console.error('Failed to fetch JS bundle. Status:', res.statusCode);
    return;
  }
  
  let data = '';
  res.on('data', (chunk) => { data += chunk; });
  res.on('end', () => {
    console.log('JS bundle fetched successfully. Size:', data.length, 'bytes');
    
    // Check if localhost:9001 or fnjekbskvqux7jzy4rjs1yef is in the bundle
    const hasLocalhost = data.includes('localhost:9001');
    const hasSslip = data.includes('fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io');
    
    console.log('Contains "localhost:9001":', hasLocalhost);
    console.log('Contains "fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io":', hasSslip);
    
    // Let's print occurrences around the backend URL references
    let idx = data.indexOf('fnjekbskvqux7jzy4rjs1yef');
    if (idx !== -1) {
      console.log('\nContext around sslip.io:');
      console.log(data.substring(Math.max(0, idx - 100), Math.min(data.length, idx + 150)));
    }
    
    idx = data.indexOf('localhost:9001');
    if (idx !== -1) {
      console.log('\nContext around localhost:9001:');
      console.log(data.substring(Math.max(0, idx - 100), Math.min(data.length, idx + 100)));
    }
  });
}).on('error', (err) => {
  console.error('Request failed:', err.message);
});
