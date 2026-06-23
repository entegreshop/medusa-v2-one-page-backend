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
    
    const appPath = '/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef';
    const html = await getPage(appPath, loginResult.cookies);
    
    // Save to app-page.html
    const outputHtmlPath = path.join('C:\\Users\\Asus\\.gemini\\antigravity\\brain\\8a551e00-e49c-4d87-8ce3-e1dbcfa02685\\scratch', 'app-page.html');
    fs.writeFileSync(outputHtmlPath, html);
    console.log(`Saved full HTML to ${outputHtmlPath}`);

    console.log('\nParsing component snapshots to find start command configurations...');
    const snapshotRegex = /wire:snapshot="([^"]+)"/g;
    let match;
    let count = 0;

    while ((match = snapshotRegex.exec(html)) !== null) {
      count++;
      const decoded = decodeHtmlEntities(match[1]);
      try {
        const parsed = JSON.parse(decoded);
        
        // Check if snapshot contains start_command or if it is the project.application.general component
        const name = parsed.memo.name;
        const keys = Object.keys(parsed.data);
        
        const hasStartCommand = keys.some(k => k.includes('start') || k.includes('cmd')) || 
                                (parsed.data.application && parsed.data.application[1] && parsed.data.application[1].start_command !== undefined) ||
                                JSON.stringify(parsed.data).includes('db:migrate');

        if (hasStartCommand) {
          console.log(`\nComponent #${count} (MATCHES START COMMAND):`);
          console.log(`ID: ${parsed.memo.id}`);
          console.log(`Name: ${name}`);
          console.log(`Keys: ${keys.join(', ')}`);
          
          if (parsed.data.application) {
            console.log(`Application Details:`, JSON.stringify(parsed.data.application));
          }
        }
      } catch (err) {
        // ignore JSON parse errors for non-Livewire snapshots
      }
    }
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
