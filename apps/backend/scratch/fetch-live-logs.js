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

// Step 4: POST /livewire/update to load containers
function loadContainers(csrfToken, authenticatedCookies, snapshotStr) {
  return new Promise((resolve, reject) => {
    const xsrfCookie = authenticatedCookies.split('; ').find(row => row.startsWith('XSRF-TOKEN='));
    const xsrfToken = xsrfCookie ? decodeURIComponent(xsrfCookie.split('=')[1]) : '';

    const postData = JSON.stringify({
      _token: csrfToken,
      components: [
        {
          snapshot: snapshotStr,
          updates: {},
          calls: [
            {
              path: '',
              method: 'loadAllContainers',
              params: []
            }
          ]
        }
      ]
    });

    const options = {
      hostname: '204.168.136.196',
      port: 8000,
      path: '/livewire/update',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(postData),
        'Cookie': authenticatedCookies,
        'X-XSRF-TOKEN': xsrfToken,
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        'Referer': 'http://204.168.136.196:8000/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef/logs',
        'Origin': 'http://204.168.136.196:8000',
        'Accept': 'application/json'
      }
    };

    const req = http.request(options, (res) => {
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => {
        resolve({
          statusCode: res.statusCode,
          body: data
        });
      });
    });
    
    req.on('error', reject);
    req.write(postData);
    req.end();
  });
}

function decodeHtmlEntities(str) {
  return str
    .replace(/&quot;/g, '"')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>');
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
    const html = await getPage(logsPath, loginResult.cookies);

    const csrfMatch = html.match(/name="csrf-token"\s+content="([^"]+)"/) || html.match(/"csrfToken":\s*"([^"]+)"/);
    const authCsrfToken = csrfMatch ? csrfMatch[1] : null;
    if (!authCsrfToken) {
      console.error('No CSRF token');
      return;
    }

    const snapshotRegex = /wire:snapshot="([^"]+)"/g;
    let match;
    let logsSnapshot = null;

    while ((match = snapshotRegex.exec(html)) !== null) {
      const decoded = decodeHtmlEntities(match[1]);
      if (decoded.includes('project.shared.logs') && decoded.includes('fnjekbskvqux7jzy4rjs1yef')) {
        logsSnapshot = decoded;
        break;
      }
    }

    if (!logsSnapshot) {
      console.error('Could not find Livewire snapshot for logs component!');
      return;
    }

    console.log('Sending Livewire loadAllContainers request...');
    const result = await loadContainers(authCsrfToken, loginResult.cookies, logsSnapshot);
    
    if (result.statusCode !== 200) {
      console.error('Livewire refresh failed. Status:', result.statusCode);
      return;
    }

    const parsedRes = JSON.parse(result.body);
    const componentRes = parsedRes.components[0];
    const htmlOutput = componentRes.effects.html;

    if (htmlOutput) {
      fs.writeFileSync(path.join('C:\\Users\\Asus\\.gemini\\antigravity\\brain\\8a551e00-e49c-4d87-8ce3-e1dbcfa02685\\scratch', 'live-logs.html'), htmlOutput);
      console.log('Saved loaded containers HTML to live-logs.html');
      
      // Print the returned HTML to check what containers are running and if logs are displayed
      console.log('\n--- Livewire Response HTML (first 3000 chars) ---');
      console.log(htmlOutput.substring(0, 3000));
    } else {
      console.log('No HTML returned in Livewire response.');
    }
    
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
