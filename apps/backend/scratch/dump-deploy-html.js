const http = require('http');
const querystring = require('querystring');

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
    
    const deployPath = '/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef/deployment/gc5w6zsanmeuyw7ahlaiap1b';
    const html = await getPage(deployPath, loginResult.cookies);
    
    console.log('Extracting logs in HTML...');
    // Look for lines containing "git", "nixpacks", "build", "step", "docker", "progress" or date-like formats
    const lines = html.split('\n');
    let logLines = [];
    lines.forEach((line, index) => {
      const trimmed = line.trim();
      if (trimmed.length > 0 && (
        trimmed.includes('nixpacks') ||
        trimmed.includes('Docker') ||
        trimmed.includes('npm') ||
        trimmed.includes('Git') ||
        trimmed.includes('Cloning') ||
        trimmed.includes('Building') ||
        trimmed.includes('Successfully') ||
        trimmed.includes('phase') ||
        trimmed.includes('exporting') ||
        trimmed.match(/\d{4}-\w{3}-\d{2}\s\d{2}:\d{2}:\d{2}/)
      )) {
        logLines.push(`[Line ${index+1}] ${trimmed}`);
      }
    });

    console.log(`Matching log lines: ${logLines.length}`);
    logLines.slice(0, 50).forEach(l => console.log(l));

    // Let's also check if there is a Livewire snapshot for deployments activity log
    console.log('\nSearching for deployments or activity Livewire snapshots...');
    const snapshotRegex = /wire:snapshot="([^"]+)"/g;
    let match;
    while ((match = snapshotRegex.exec(html)) !== null) {
      const decoded = decodeURIComponent(match[1]);
      if (decoded.includes('activity') || decoded.includes('log') || decoded.includes('deployment')) {
        console.log(`Found matching Livewire snapshot ID:`, decoded.match(/"id":"([^"]+)"/)?.[1]);
        console.log(`Snapshot info:`, decoded.substring(0, 300));
      }
    }
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
