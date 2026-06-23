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

// Step 4: POST /livewire/update to update start command
function updateStartCommand(csrfToken, authenticatedCookies, snapshotStr) {
  return new Promise((resolve, reject) => {
    const xsrfCookie = authenticatedCookies.split('; ').find(row => row.startsWith('XSRF-TOKEN='));
    const xsrfToken = xsrfCookie ? decodeURIComponent(xsrfCookie.split('=')[1]) : '';

    const postData = JSON.stringify({
      _token: csrfToken,
      components: [
        {
          snapshot: snapshotStr,
          updates: {
            startCommand: 'cd apps/backend && node start-with-logging.js'
          },
          calls: [
            {
              path: '',
              method: 'submit',
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
        'Referer': 'http://204.168.136.196:8000/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef',
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

// Step 5: Trigger deploy via Livewire on application page
function triggerDeploy(csrfToken, authenticatedCookies, headingSnapshotStr) {
  return new Promise((resolve, reject) => {
    const xsrfCookie = authenticatedCookies.split('; ').find(row => row.startsWith('XSRF-TOKEN='));
    const xsrfToken = xsrfCookie ? decodeURIComponent(xsrfCookie.split('=')[1]) : '';

    const postData = JSON.stringify({
      _token: csrfToken,
      components: [
        {
          snapshot: headingSnapshotStr,
          updates: {},
          calls: [
            {
              path: '',
              method: 'deploy',
              params: [true] // true for force deploy
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
        'Referer': 'http://204.168.136.196:8000/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef',
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
          headers: res.headers,
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
    console.log('1. Fetching login page details...');
    const details = await getLoginDetails();

    console.log('2. Logging into Coolify...');
    const loginResult = await postLogin(details.csrfToken, details.cookies);
    if (loginResult.statusCode !== 302) {
      console.error('Login failed!');
      return;
    }
    console.log('Login successful! Session cookies obtained.');

    const appPath = '/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef';
    console.log(`3. Fetching application details page: ${appPath}`);
    const html = await getPage(appPath, loginResult.cookies);

    console.log('4. Extracting CSRF token and Livewire snapshots...');
    
    const csrfMatch = html.match(/name="csrf-token"\s+content="([^"]+)"/) || html.match(/"csrfToken":\s*"([^"]+)"/);
    const authCsrfToken = csrfMatch ? csrfMatch[1] : null;
    if (!authCsrfToken) {
      console.error('Could not find authenticated CSRF token!');
      return;
    }
    console.log(`Found authenticated CSRF Token: ${authCsrfToken}`);

    // Parse snapshots
    const snapshotRegex = /wire:snapshot="([^"]+)"/g;
    let match;
    let generalSnapshot = null;
    let headingSnapshot = null;

    while ((match = snapshotRegex.exec(html)) !== null) {
      const decoded = decodeHtmlEntities(match[1]);
      if (decoded.includes('project.application.general') && decoded.includes('fnjekbskvqux7jzy4rjs1yef')) {
        generalSnapshot = decoded;
      }
      if (decoded.includes('project.application.heading') && decoded.includes('fnjekbskvqux7jzy4rjs1yef')) {
        headingSnapshot = decoded;
      }
    }

    if (!generalSnapshot) {
      console.error('Could not find Livewire snapshot for project.application.general component!');
      return;
    }
    if (!headingSnapshot) {
      console.error('Could not find Livewire snapshot for project.application.heading component!');
      return;
    }

    console.log('5. Updating Start Command in Coolify settings...');
    const updateResult = await updateStartCommand(authCsrfToken, loginResult.cookies, generalSnapshot);
    console.log(`Update Start Command Status: ${updateResult.statusCode}`);
    
    // Check if the update succeeded (Livewire returns 200 on successful state updates)
    if (updateResult.statusCode !== 200) {
      console.error('Failed to update Start Command. Body:', updateResult.body);
      return;
    }
    console.log('Start Command successfully updated to "cd apps/backend && node start-with-logging.js"!');

    // Since settings changed, we should trigger a fresh deployment!
    console.log('6. Triggering new deployment to apply changes...');
    const deployResult = await triggerDeploy(authCsrfToken, loginResult.cookies, headingSnapshot);
    console.log(`Deploy Trigger Status: ${deployResult.statusCode}`);
    if (deployResult.statusCode === 302) {
      console.log('Deployment successfully queued and triggered!');
      console.log(`Redirect URL: ${deployResult.headers.location}`);
    } else {
      console.error('Deployment trigger failed. Body:', deployResult.body);
    }
    
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
