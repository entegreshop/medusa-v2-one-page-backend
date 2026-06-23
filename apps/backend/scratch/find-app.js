const http = require('http');
const querystring = require('querystring');
const fs = require('fs');
const path = require('path');

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

async function run() {
  try {
    const details = await getLoginDetails();
    const loginResult = await postLogin(details.csrfToken, details.cookies);
    if (loginResult.statusCode !== 302) {
      console.error('Login failed!');
      return;
    }
    
    const apps = [
      { id: 'fnjekbskvqux7jzy4rjs1yef', path: '/project/gsj9j6mz2rgs26h109lg7dxg/environment/mibkvgjurgjsm9urusgca6lu/application/fnjekbskvqux7jzy4rjs1yef' },
      { id: 'i12t1gx28id2dgkey31apn77', path: '/project/xttzxfmqak2xfxop5vaeuj8f/environment/y2r2tb7zeqr25bxjkd1g4qll/application/i12t1gx28id2dgkey31apn77' },
      { id: 'c57phdwv3t9f8b190xed8ywy', path: '/project/xttzxfmqak2xfxop5vaeuj8f/environment/y2r2tb7zeqr25bxjkd1g4qll/application/c57phdwv3t9f8b190xed8ywy' }
    ];

    const scratchDir = path.join(__dirname);

    for (let i = 0; i < apps.length; i++) {
      const app = apps[i];
      console.log(`\n================ INSPECTING ${app.id} ================`);
      const html = await getPage(app.path, loginResult.cookies);
      
      const filename = path.join(scratchDir, `app_${app.id}.html`);
      fs.writeFileSync(filename, html);
      console.log(`Saved HTML to ${filename}`);
      
      // Look for any application name or title in the html
      const titleMatch = html.match(/<title>([^<]+)<\/title>/i);
      console.log('Page Title:', titleMatch ? titleMatch[1].trim() : 'No title');

      // Look for custom domain or sslip.io
      const domainMatches = html.match(/[\w-]+\.\d+\.\d+\.\d+\.\d+\.sslip\.io/g) || [];
      console.log('Sslip.io domains in page:', [...new Set(domainMatches)]);
      
      // Look for any input elements value
      const valueMatches = [];
      const valRegex = /value="([^"]+)"/g;
      let valMatch;
      while ((valMatch = valRegex.exec(html)) !== null) {
        const val = valMatch[1];
        if (val.includes('http') || val.includes('git') || val.includes('sslip.io') || val.match(/^\d+$/)) {
          valueMatches.push(val);
        }
      }
      console.log('Interesting input values:', [...new Set(valueMatches)]);

      // Check if git repository matches storefront or backend
      const gitMatch = html.match(/github\.com\/[^\s"']+/gi);
      if (gitMatch) {
        console.log('Git repositories referenced:', [...new Set(gitMatch)]);
      }
    }
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
