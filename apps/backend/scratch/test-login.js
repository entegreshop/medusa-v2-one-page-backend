const http = require('http');

const url = 'http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io/auth/user/emailpass';

const postData = JSON.stringify({
  email: 'admin@medusa.com',
  password: 'ModaskopMedusa2026!'
});

console.log('Sending login POST request to:', url);

const req = http.request(url, {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Content-Length': Buffer.byteLength(postData),
    'Origin': 'http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io'
  }
}, (res) => {
  console.log(`STATUS CODE: ${res.statusCode}`);
  console.log(`HEADERS: ${JSON.stringify(res.headers, null, 2)}`);
  
  let data = '';
  res.on('data', (chunk) => { data += chunk; });
  res.on('end', () => {
    console.log('\nRESPONSE BODY:');
    console.log(data);
  });
});

req.on('error', (err) => {
  console.error('Request failed:', err.message);
});

req.write(postData);
req.end();
