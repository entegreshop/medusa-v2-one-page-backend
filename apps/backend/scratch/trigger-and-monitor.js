const http = require('http');
const querystring = require('querystring');

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
        'Accept': 'application/json, text/html, */*'
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
    
    // Check if deployment is already running or start a new one
    console.log('Triggering deployment via API...');
    const xsrfCookie = loginResult.cookies.split('; ').find(row => row.startsWith('XSRF-TOKEN='));
    const xsrfToken = xsrfCookie ? decodeURIComponent(xsrfCookie.split('=')[1]) : '';
    
    const apiPath = `/api/v1/deploy?uuid=fnjekbskvqux7jzy4rjs1yef&force=true`;
    
    const options = {
      hostname: '204.168.136.196',
      port: 8000,
      path: apiPath,
      method: 'GET',
      headers: {
        'Cookie': loginResult.cookies,
        'X-XSRF-TOKEN': xsrfToken,
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        'Accept': 'application/json'
      }
    };
    
    const deployRes = await new Promise((resolve, reject) => {
      const req = http.request(options, (res) => {
        let data = '';
        res.on('data', (chunk) => { data += chunk; });
        res.on('end', () => { resolve({ statusCode: res.statusCode, body: data }); });
      });
      req.on('error', reject);
      req.end();
    });
    
    console.log('Deploy API response status:', deployRes.statusCode);
    console.log('Deploy API response body:', deployRes.body);
    
    let deployId = null;
    try {
      const parsed = JSON.parse(deployRes.body);
      if (parsed.deployment_uuid) {
        deployId = parsed.deployment_uuid;
      }
    } catch (e) {}
    
    if (!deployId) {
      // Try to find the latest deployment ID from the HTML or wait
      console.log('Could not find deployment_uuid in JSON. Fetching deployment list page...');
      const listHtml = await getPage('/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef/deployment', loginResult.cookies);
      const uuidRegex = /deployment\/([a-z0-9]{24})/g;
      let match;
      const ids = [];
      while ((match = uuidRegex.exec(listHtml)) !== null) {
        ids.push(match[1]);
      }
      if (ids.length > 0) {
        deployId = ids[0]; // first one is latest
      }
    }
    
    if (!deployId) {
      console.error('Failed to resolve deployment ID. Exiting.');
      return;
    }
    
    console.log(`Starting monitoring for deployment ID: ${deployId}`);
    const deployPath = `/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef/deployment/${deployId}`;
    
    let printedLines = new Set();
    let completed = false;
    let failCount = 0;
    
    while (!completed) {
      try {
        const html = await getPage(deployPath, loginResult.cookies);
        const logLineRegex = /data-log-content="([^"]+)"/g;
        let match;
        let newLines = [];
        
        while ((match = logLineRegex.exec(html)) !== null) {
          const content = decodeHtmlEntities(match[1]);
          if (!printedLines.has(content)) {
            newLines.push(content);
            printedLines.add(content);
          }
        }
        
        if (newLines.length > 0) {
          newLines.forEach(line => {
            console.log(line);
            if (line.includes('Rolling update completed') || line.includes('Finished') || line.includes('Deployment failed')) {
              completed = true;
            }
          });
        }
        
        if (html.includes('Deployment failed') || html.includes('Cancelled') || html.includes('Failed')) {
          console.log('\n[MONITOR] Deployment status indicates failure or cancellation.');
          completed = true;
        }
        
        failCount = 0;
      } catch (err) {
        console.error('Fetch error:', err.message);
        failCount++;
        if (failCount > 10) {
          console.error('Too many fetch errors. Exiting.');
          break;
        }
      }
      
      if (!completed) {
        await new Promise(r => setTimeout(r, 6000));
      }
    }
    
    console.log('\n[MONITOR] Monitoring finished.');
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
