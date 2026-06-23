const http = require('http');
const querystring = require('querystring');
const fs = require('fs');

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
          cookies: cookies.map(c => c.split(';')[0]).join('; ')
        });
      });
    });
    
    req.on('error', reject);
    req.write(postData);
    req.end();
  });
}

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

function postLivewireUpdate(csrfToken, authenticatedCookies, referer, snapshotStr, type) {
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
              method: 'loadServices',
              params: []
            },
            {
              path: '',
              method: 'setType',
              params: [type]
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
        'Referer': `http://204.168.136.196:8000${referer}`,
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
    
    const newPath = '/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/new';
    console.log(`Fetching new resource page...`);
    const html = await getPage(newPath, loginResult.cookies);
    
    const csrfMatch = html.match(/name="csrf-token"\s+content="([^"]+)"/) || html.match(/"csrfToken":\s*"([^"]+)"/);
    const authCsrfToken = csrfMatch ? csrfMatch[1] : null;
    
    const snapshotRegex = /wire:snapshot="([^"]+)"/g;
    let match;
    let selectSnapshot = null;
    while ((match = snapshotRegex.exec(html)) !== null) {
      const decoded = decodeHtmlEntities(match[1]);
      if (decoded.includes('project.new.select')) {
        selectSnapshot = decoded;
        break;
      }
    }
    
    if (!selectSnapshot) {
      console.error('Select snapshot not found');
      return;
    }
    
    console.log('Setting type to "public" via Livewire setType...');
    const res = await postLivewireUpdate(authCsrfToken, loginResult.cookies, newPath, selectSnapshot, 'public');
    console.log('Status:', res.statusCode);
    
    // Save response to file
    fs.writeFileSync('setType-response.json', res.body);
    console.log('Saved response to setType-response.json');
    
    const parsed = JSON.parse(res.body);
    const component = parsed.components[0];
    if (component && component.snapshot) {
      const snap = JSON.parse(component.snapshot);
      console.log('\n--- Next Snapshot State ---');
      console.log('Current Step:', snap.data.current_step);
      console.log('Server ID:', snap.data.server_id);
      console.log('Destination UUID:', snap.data.destination_uuid);
      console.log('Type:', snap.data.type);
      console.log('Available keys in data:', Object.keys(snap.data));
    }
    if (component && component.effects && component.effects.html) {
      fs.writeFileSync('setType-html.html', component.effects.html);
      console.log('Saved new HTML to setType-html.html');
    }
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
