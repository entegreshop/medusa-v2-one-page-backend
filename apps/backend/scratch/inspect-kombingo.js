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

function decodeHtmlEntities(str) {
  return str
    .replace(/&quot;/g, '"')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&#039;/g, "'");
}

async function run() {
  try {
    const details = await getLoginDetails();
    const loginResult = await postLogin(details.csrfToken, details.cookies);
    if (loginResult.statusCode !== 302) {
      console.error('Login failed!');
      return;
    }
    
    const apps = [
      { id: 'i12t1gx28id2dgkey31apn77', name: 'kombingo-backend', envPath: '/project/xttzxfmqak2xfxop5vaeuj8f/environment/y2r2tb7zeqr25bxjkd1g4qll/application/i12t1gx28id2dgkey31apn77/environment-variables', configPath: '/project/xttzxfmqak2xfxop5vaeuj8f/environment/y2r2tb7zeqr25bxjkd1g4qll/application/i12t1gx28id2dgkey31apn77' },
      { id: 'c57phdwv3t9f8b190xed8ywy', name: 'kombingo-medusa-v2', envPath: '/project/xttzxfmqak2xfxop5vaeuj8f/environment/y2r2tb7zeqr25bxjkd1g4qll/application/c57phdwv3t9f8b190xed8ywy/environment-variables', configPath: '/project/xttzxfmqak2xfxop5vaeuj8f/environment/y2r2tb7zeqr25bxjkd1g4qll/application/c57phdwv3t9f8b190xed8ywy' }
    ];

    for (const app of apps) {
      console.log(`\n================ INSPECTING ${app.name} (${app.id}) ================`);
      
      // Fetch Config Page to check FQDN/Ports
      const configHtml = await getPage(app.configPath, loginResult.cookies);
      
      const snapshotRegex = /wire:snapshot="([^"]+)"/g;
      let match;
      let fqdn = 'Unknown';
      let portsExposes = 'Unknown';
      let portsMappings = 'Unknown';
      
      while ((match = snapshotRegex.exec(configHtml)) !== null) {
        const decoded = decodeHtmlEntities(match[1]);
        try {
          const snap = JSON.parse(decoded);
          if (snap.data && snap.data.application) {
            const a = snap.data.application;
            if (a.fqdn) fqdn = a.fqdn;
            if (a.ports_exposes) portsExposes = a.ports_exposes;
            if (a.ports_mappings) portsMappings = a.ports_mappings;
          }
        } catch (e) {}
      }
      
      console.log('FQDN (Domain):', fqdn);
      console.log('Exposed Ports:', portsExposes);
      console.log('Mapped Ports:', portsMappings);

      // Fetch Env Page
      console.log('Fetching environment variables...');
      const envHtml = await getPage(app.envPath, loginResult.cookies);
      
      const snapshotRegexEnv = /wire:snapshot="([^"]+)"/g;
      let matchEnv;
      let count = 0;
      while ((matchEnv = snapshotRegexEnv.exec(envHtml)) !== null) {
        const decoded = decodeHtmlEntities(matchEnv[1]);
        try {
          const snap = JSON.parse(decoded);
          if (snap.data && snap.data.key) {
            const key = snap.data.key;
            const value = snap.data.value;
            if (key === 'PORT' || key.includes('PORT') || key.includes('CORS') || key.includes('URL')) {
              console.log(`Env: ${key} = ${value}`);
              count++;
            }
          }
        } catch (e) {}
      }
      if (count === 0) {
        console.log('No interesting env variables found or failed to parse.');
      }
    }
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
