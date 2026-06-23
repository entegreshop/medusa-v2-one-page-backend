const http = require('http');

const url = 'http://204.168.136.196:9001/app';

console.log('Sending GET request to:', url);

http.get(url, (res) => {
  console.log(`STATUS CODE: ${res.statusCode}`);
  console.log(`HEADERS: ${JSON.stringify(res.headers, null, 2)}`);
  
  let data = '';
  res.on('data', (chunk) => { data += chunk; });
  res.on('end', () => {
    console.log('\nRESPONSE BODY (first 1000 chars):');
    console.log(data.substring(0, 1000));
  });
}).on('error', (err) => {
  console.error('Request failed:', err.message);
});
