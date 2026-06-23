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
    
    // Save application page html to app-page.html in scratch
    fs.writeFileSync('app-page-fresh.html', html);
    
    // Search for domains or fqdn inside input fields or texts
    console.log('Searching for domains/ports...');
    
    // Find all wire:model or input value matching domains
    const fqdnMatch = html.match(/wire:model="application.fqdn"[^>]*value="([^"]+)"/) || 
                      html.match(/id="application.fqdn"[^>]*value="([^"]+)"/) ||
                      html.match(/value="([^"]+sslip\.io[^"]*)"/) ||
                      html.match(/value="(https?:\/\/[^"]+)"/);
                      
    if (fqdnMatch) {
      console.log('Found FQDN/Domain Match:', fqdnMatch[0]);
      console.log('Domain:', fqdnMatch[1]);
    } else {
      console.log('No direct FQDN input found by regex.');
    }
    
    // Look for sslip.io or any http/https links
    const links = [];
    const urlRegex = /(https?:\/\/[^\s"'<>]+)/g;
    let linkMatch;
    while ((linkMatch = urlRegex.exec(html)) !== null) {
      links.push(linkMatch[1]);
    }
    
    const uniqueLinks = [...new Set(links)];
    console.log('\n--- UNIQUE URLS FOUND IN PAGE ---');
    uniqueLinks.forEach(link => {
      if (link.includes('sslip.io') || link.includes('204.168.136.196') || link.includes('entegreshop')) {
        console.log(link);
      }
    });

  } catch (err) {
    console.error('Error:', err);
  }
}

run();
