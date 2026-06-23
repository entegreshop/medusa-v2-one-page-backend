const http = require('http');

const url = 'http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io/store/products';
const key = 'pk_7587df1c043fb92eebc89c01e37c6e50ef92da4fdc68ab9a49a731594c3d7b0e';

console.log('Sending request to /store/products with publishable key...');
const req = http.request(url, {
  method: 'GET',
  headers: {
    'x-publishable-api-key': key
  }
}, (res) => {
  console.log('STATUS:', res.statusCode);
  console.log('HEADERS:', JSON.stringify(res.headers, null, 2));
  
  let data = '';
  res.on('data', (chunk) => { data += chunk; });
  res.on('end', () => {
    console.log('\nBODY (first 1000 chars):');
    console.log(data.substring(0, 1000));
  });
});

req.on('error', (err) => {
  console.error('Request failed:', err.message);
});

req.end();
