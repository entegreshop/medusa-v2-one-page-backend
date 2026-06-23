const http = require('http');
const querystring = require('querystring');
const fs = require('fs');

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

// Step 5: POST /livewire/update to fetch getLogs
function fetchGetLogs(csrfToken, authenticatedCookies, snapshotStr) {
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
              method: 'getLogs',
              params: [true] // true for force refresh logs
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
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"');
}

async function run() {
  try {
    console.log('1. Fetching login details...');
    const details = await getLoginDetails();

    console.log('2. Logging in...');
    const loginResult = await postLogin(details.csrfToken, details.cookies);
    if (loginResult.statusCode !== 302) {
      console.error('Login failed!');
      return;
    }

    const logsPath = '/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef/logs';
    console.log(`3. Fetching logs page: ${logsPath}`);
    const html = await getPage(logsPath, loginResult.cookies);

    const csrfMatch = html.match(/name="csrf-token"\s+content="([^"]+)"/) || html.match(/"csrfToken":\s*"([^"]+)"/);
    const authCsrfToken = csrfMatch ? csrfMatch[1] : null;
    if (!authCsrfToken) {
      console.error('Could not find CSRF token!');
      return;
    }

    // Get snapshot of project.shared.logs
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
      console.error('Could not find Livewire snapshot for project.shared.logs component!');
      return;
    }

    console.log('4. Loading running containers list...');
    const loadContainersResult = await loadContainers(authCsrfToken, loginResult.cookies, logsSnapshot);
    if (loadContainersResult.statusCode !== 200) {
      console.error('Failed to load containers list. Status:', loadContainersResult.statusCode);
      return;
    }

    // Extract the snapshot of project.shared.get-logs from the response HTML
    console.log('5. Extracting snapshot of child logs component (project.shared.get-logs)...');
    const parsedLoadRes = JSON.parse(loadContainersResult.body);
    const loadHtmlOutput = parsedLoadRes.components[0].effects.html;

    if (!loadHtmlOutput) {
      console.error('No HTML returned during container load.');
      return;
    }

    let getLogsSnapshot = null;
    const subSnapshotRegex = /wire:snapshot="([^"]+)"/g;
    let subMatch;
    while ((subMatch = subSnapshotRegex.exec(loadHtmlOutput)) !== null) {
      const decoded = decodeHtmlEntities(subMatch[1]);
      if (decoded.includes('project.shared.get-logs') && decoded.includes('fnjekbskvqux7jzy4rjs1yef-')) {
        getLogsSnapshot = decoded;
        break;
      }
    }

    if (!getLogsSnapshot) {
      console.error('Could not find Livewire snapshot for project.shared.get-logs child component!');
      return;
    }

    console.log('6. Querying actual container logs...');
    const logsResult = await fetchGetLogs(authCsrfToken, loginResult.cookies, getLogsSnapshot);
    if (logsResult.statusCode !== 200) {
      console.error('Failed to query container logs. Status:', logsResult.statusCode);
      return;
    }

    // Parse the output logs from the JSON response
    const parsedLogsRes = JSON.parse(logsResult.body);
    console.log('parsedLogsRes keys:', Object.keys(parsedLogsRes));
    if (parsedLogsRes.components) {
      console.log('Components count:', parsedLogsRes.components.length);
      const getLogsComponent = parsedLogsRes.components[0];
      if (getLogsComponent) {
        const logsOutput = (getLogsComponent.data && getLogsComponent.data.outputs) || (getLogsComponent.effects && getLogsComponent.effects.html);
        if (logsOutput) {
          console.log('\n================ CONTAINER RUNTIME LOGS ================');
          if (logsOutput.trim().startsWith('<')) {
            const lines = logsOutput.split('\n');
            lines.forEach(line => {
              const cleanLineMatch = line.match(/>([^<]+)<\/span>/) || line.match(/data-line-text="([^"]+)"/);
              if (cleanLineMatch) {
                console.log(decodeHtmlEntities(cleanLineMatch[1]));
              }
            });
          } else {
            console.log(logsOutput);
          }
          console.log('========================================================');
        } else {
          console.log('No logs found or state is unchanged.');
          console.log('Component data:', JSON.stringify(getLogsComponent.data || {}, null, 2));
          console.log('Component effects:', JSON.stringify(getLogsComponent.effects || {}, null, 2));
        }
      } else {
        console.log('First component is undefined.');
      }
    } else {
      console.log('No components key in response. Full response:', JSON.stringify(parsedLogsRes, null, 2));
    }
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
