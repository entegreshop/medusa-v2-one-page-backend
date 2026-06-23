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

function postLivewireUpdate(csrfToken, authenticatedCookies, referer, snapshotStr, updates, methodCall) {
  return new Promise((resolve, reject) => {
    const xsrfCookie = authenticatedCookies.split('; ').find(row => row.startsWith('XSRF-TOKEN='));
    const xsrfToken = xsrfCookie ? decodeURIComponent(xsrfCookie.split('=')[1]) : '';

    const postData = JSON.stringify({
      _token: csrfToken,
      components: [
        {
          snapshot: snapshotStr,
          updates: updates,
          calls: [
            {
              path: '',
              method: methodCall,
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
    console.log('1. Fetching login details...');
    const details = await getLoginDetails();

    console.log('2. Logging into Coolify...');
    const loginResult = await postLogin(details.csrfToken, details.cookies);
    if (loginResult.statusCode !== 302) {
      console.error('Login failed!');
      return;
    }

    const appPath = '/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef';
    const envPath = `${appPath}/environment-variables`;

    // --- STEP 1: UPDATE ENVIRONMENT VARIABLES ---
    console.log(`\n--- PART 1: Updating Environment Variables ---`);
    console.log(`Fetching env variables page: ${envPath}`);
    const envHtml = await getPage(envPath, loginResult.cookies);

    const csrfMatch = envHtml.match(/name="csrf-token"\s+content="([^"]+)"/) || envHtml.match(/"csrfToken":\s*"([^"]+)"/);
    const authCsrfToken = csrfMatch ? csrfMatch[1] : null;
    if (!authCsrfToken) {
      console.error('Could not find CSRF token on env page!');
      return;
    }

    // Targets
    const targets = {
      'PORT': '9001',
      'ADMIN_CORS': 'http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io/app,http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io,http://204.168.136.196:9001/app,http://204.168.136.196:9001',
      'STORE_CORS': 'http://localhost:8001,http://204.168.136.196:8001',
      'AUTH_CORS': 'http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io,http://204.168.136.196:9001,http://localhost:8001,http://204.168.136.196:8001'
    };

    const snapshotRegex = /wire:snapshot="([^"]+)"/g;
    let match;
    const showSnapshots = {};
    let addSnapshot = null;

    while ((match = snapshotRegex.exec(envHtml)) !== null) {
      const decoded = decodeHtmlEntities(match[1]);
      try {
        const snap = JSON.parse(decoded);
        const name = snap.memo ? snap.memo.name : 'unknown';
        if (name === 'project.shared.environment-variable.show') {
          const key = snap.data.key || (snap.data.env && snap.data.env.key);
          if (key) {
            showSnapshots[key] = decoded;
          }
        } else if (name === 'project.shared.environment-variable.add') {
          addSnapshot = decoded;
        }
      } catch (e) {}
    }

    // Update existing env variables
    for (const [key, newValue] of Object.entries(targets)) {
      const snap = showSnapshots[key];
      if (snap) {
        console.log(`Updating environment variable [${key}] to value: ${newValue}`);
        const res = await postLivewireUpdate(
          authCsrfToken,
          loginResult.cookies,
          envPath,
          snap,
          { value: newValue },
          'submit'
        );
        console.log(`Update [${key}] Status: ${res.statusCode}`);
      } else {
        console.log(`Environment variable [${key}] not found to update!`);
      }
    }

    // Add MEDUSA_BACKEND_URL if not exists
    if (!showSnapshots['MEDUSA_BACKEND_URL'] && addSnapshot) {
      console.log('Adding new environment variable [MEDUSA_BACKEND_URL]...');
      const res = await postLivewireUpdate(
        authCsrfToken,
        loginResult.cookies,
        envPath,
        addSnapshot,
        {
          key: 'MEDUSA_BACKEND_URL',
          value: 'http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io',
          is_buildtime: true,
          is_runtime: true
        },
        'submit'
      );
      console.log(`Add [MEDUSA_BACKEND_URL] Status: ${res.statusCode}`);
    } else {
      console.log('MEDUSA_BACKEND_URL already exists or add snapshot not found.');
      // If it exists, let's update it anyway to make sure it matches
      if (showSnapshots['MEDUSA_BACKEND_URL']) {
        console.log('Updating existing MEDUSA_BACKEND_URL...');
        const res = await postLivewireUpdate(
          authCsrfToken,
          loginResult.cookies,
          envPath,
          showSnapshots['MEDUSA_BACKEND_URL'],
          { value: 'http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io' },
          'submit'
        );
        console.log(`Update [MEDUSA_BACKEND_URL] Status: ${res.statusCode}`);
      }
    }


    // --- STEP 2: UPDATE GENERAL SETTINGS (PORTS AND FQDN) ---
    console.log(`\n--- PART 2: Updating General Settings (Exposed Ports, Mappings, FQDN) ---`);
    console.log(`Fetching general configuration page: ${appPath}`);
    const appHtml = await getPage(appPath, loginResult.cookies);

    const appCsrfMatch = appHtml.match(/name="csrf-token"\s+content="([^"]+)"/) || appHtml.match(/"csrfToken":\s*"([^"]+)"/);
    const appCsrfToken = appCsrfMatch ? appCsrfMatch[1] : null;

    let generalSnapshot = null;
    let headingSnapshot = null;
    const appSnapshotRegex = /wire:snapshot="([^"]+)"/g;
    let appMatch;

    while ((appMatch = appSnapshotRegex.exec(appHtml)) !== null) {
      const decoded = decodeHtmlEntities(appMatch[1]);
      try {
        const snap = JSON.parse(decoded);
        const name = snap.memo ? snap.memo.name : 'unknown';
        if (name === 'project.application.general') {
          generalSnapshot = decoded;
        } else if (name === 'project.application.heading') {
          headingSnapshot = decoded;
        }
      } catch (e) {}
    }

    if (generalSnapshot) {
      console.log('Updating ports and FQDN settings in Coolify...');
      const res = await postLivewireUpdate(
        appCsrfToken,
        loginResult.cookies,
        appPath,
        generalSnapshot,
        {
          portsExposes: '9001',
          portsMappings: '9001:9001',
          fqdn: 'http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io:9001'
        },
        'submit'
      );
      console.log(`General Configuration Update Status: ${res.statusCode}`);
    } else {
      console.error('Could not find general config component snapshot.');
      return;
    }


    // --- STEP 3: TRIGGER DEPLOYMENT ---
    if (headingSnapshot) {
      console.log('\n--- PART 3: Triggering Deployment ---');
      const res = await postLivewireUpdate(
        appCsrfToken,
        loginResult.cookies,
        appPath,
        headingSnapshot,
        {},
        'deploy'
      );
      console.log(`Deployment Trigger Status: ${res.statusCode}`);
      if (res.statusCode === 200 || res.statusCode === 302) {
        console.log('SUCCESS: Deployment triggered successfully!');
      } else {
        console.error('FAILED to trigger deployment. Body:', res.body);
      }
    } else {
      console.error('Could not find heading snapshot for deployment trigger.');
    }

  } catch (err) {
    console.error('Error:', err);
  }
}

run();
