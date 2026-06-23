const http = require('http');
const querystring = require('querystring');

const deployId = process.argv[2] || 'yln4l38awqpesy6j09t0lyfz';

// GET /login
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

// POST /login
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

// GET page
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
    console.log('Fetching login details...');
    const details = await getLoginDetails();
    console.log('Logging in...');
    const loginResult = await postLogin(details.csrfToken, details.cookies);
    if (loginResult.statusCode !== 302) {
      console.error('Login failed!');
      return;
    }
    
    const deployPath = `/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef/deployment/${deployId}`;
    console.log(`Monitoring deployment: ${deployId}`);
    
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
        
        failCount = 0; // reset fail count on successful request
      } catch (err) {
        console.error('Fetch error:', err.message);
        failCount++;
        if (failCount > 10) {
          console.error('Too many fetch errors. Exiting.');
          break;
        }
      }
      
      if (!completed) {
        await new Promise(r => setTimeout(r, 8000));
      }
    }
    
    console.log('\n[MONITOR] Monitoring finished.');
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
