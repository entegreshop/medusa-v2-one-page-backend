const http = require('http');
const querystring = require('querystring');
const fs = require('fs');
const path = require('path');

// Step 1: GET /login
function getLoginDetails() {
  return new Promise((resolve, reject) => {
    const options = {
      hostname: '204.168.136.196',
      port: 8000,
      path: '/login',
      method: 'GET',
      headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
      }
    };

    const req = http.request(options, (res) => {
      let cookies = res.headers['set-cookie'] || [];
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => {
        const csrfMatch = data.match(/name="_token"\s+value="([^"]+)"/) || data.match(/name="csrf-token"\s+content="([^"]+)"/);
        if (csrfMatch) {
          resolve({
            csrfToken: csrfMatch[1],
            cookies: cookies.map(c => c.split(';')[0]).join('; ')
          });
        } else {
          reject(new Error('CSRF token not found'));
        }
      });
    });
    req.on('error', reject);
    req.end();
  });
}

// Step 2: POST /login
function postLogin(csrfToken, initialCookies) {
  return new Promise((resolve, reject) => {
    const postData = querystring.stringify({
      _token: csrfToken,
      email: 'modaskop@gmail.com',
      password: 'Destan@2018'
    });

    const options = {
      hostname: '204.168.136.196',
      port: 8000,
      path: '/login',
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(postData),
        'Cookie': initialCookies,
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        'Referer': 'http://204.168.136.196:8000/login',
        'Origin': 'http://204.168.136.196:8000',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8'
      }
    };

    const req = http.request(options, (res) => {
      let cookies = res.headers['set-cookie'] || [];
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => {
        resolve({
          statusCode: res.statusCode,
          redirectUrl: res.headers.location,
          cookies: cookies.map(c => c.split(';')[0]).join('; '),
          body: data
        });
      });
    });
    
    req.on('error', reject);
    req.write(postData);
    req.end();
  });
}

// Step 3: GET page
function getPage(urlPath, authenticatedCookies) {
  return new Promise((resolve, reject) => {
    const options = {
      hostname: '204.168.136.196',
      port: 8000,
      path: urlPath,
      method: 'GET',
      headers: {
        'Cookie': authenticatedCookies,
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
      }
    };

    const req = http.request(options, (res) => {
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => {
        resolve(data);
      });
    });
    
    req.on('error', reject);
    req.end();
  });
}

async function run() {
  try {
    const details = await getLoginDetails();
    const loginResult = await postLogin(details.csrfToken, details.cookies);
    if (loginResult.statusCode !== 302) {
      console.error('Login failed!');
      return;
    }
    
    const logsPath = '/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef/logs';
    console.log(`Fetching application runtime logs page: ${logsPath}`);
    const html = await getPage(logsPath, loginResult.cookies);
    
    // Save html to app-logs-page.html in scratch
    const outputPath = path.join('C:\\Users\\Asus\\.gemini\\antigravity\\brain\\8a551e00-e49c-4d87-8ce3-e1dbcfa02685\\scratch', 'app-logs-page.html');
    fs.writeFileSync(outputPath, html);
    console.log(`Saved full HTML to ${outputPath}`);
    
    // Check if there are any log lines in the page (some logs may be rendered statically if cached)
    const lines = html.split('\n');
    console.log('Searching for lines containing log messages...');
    let found = 0;
    lines.forEach((line, index) => {
      if (line.includes('wait-for-db') || line.toLowerCase().includes('medusa') || line.includes('Starting') || line.includes('ready')) {
        found++;
        if (found <= 30) {
          console.log(`Line ${index+1}: ${line.trim().substring(0, 300)}`);
        }
      }
    });
    console.log(`Total matching lines: ${found}`);
    
    // Parse Livewire component snapshots to find the logs component
    console.log('\nParsing snapshots for logs component...');
    const snapshotRegex = /wire:snapshot="([^"]+)"/g;
    let match;
    while ((match = snapshotRegex.exec(html)) !== null) {
      const decoded = match[1].replace(/&quot;/g, '"').replace(/&amp;/g, '&');
      if (decoded.includes('logs') || decoded.includes('activity')) {
        console.log('Found logs related component:', decoded.substring(0, 500));
      }
    }
    
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
