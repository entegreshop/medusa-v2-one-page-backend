const http = require('http');

const domain = 'fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io';

// Step 1: POST /auth/user/emailpass
function postLogin() {
  return new Promise((resolve, reject) => {
    const postData = JSON.stringify({
      email: 'admin@medusa.com',
      password: 'ModaskopMedusa2026!'
    });

    const req = http.request({
      hostname: domain,
      path: '/auth/user/emailpass',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(postData),
        'Origin': 'http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io'
      }
    }, (res) => {
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => {
        try {
          const parsed = JSON.parse(data);
          resolve(parsed.token);
        } catch (e) {
          reject(new Error('Failed to parse login response: ' + data));
        }
      });
    });

    req.on('error', reject);
    req.write(postData);
    req.end();
  });
}

// Step 2: POST /auth/session
function postSession(token) {
  return new Promise((resolve, reject) => {
    const req = http.request({
      hostname: domain,
      path: '/auth/session',
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${token}`,
        'Origin': 'http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io'
      }
    }, (res) => {
      console.log('--- SESSION RESPONSE ---');
      console.log('STATUS:', res.statusCode);
      console.log('HEADERS:', JSON.stringify(res.headers, null, 2));
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => {
        resolve({
          headers: res.headers,
          body: data
        });
      });
    });

    req.on('error', reject);
    req.end();
  });
}

// Step 3: GET /admin/users/me using the cookie
function getUsersMe(cookie) {
  return new Promise((resolve, reject) => {
    const req = http.request({
      hostname: domain,
      path: '/admin/users/me',
      method: 'GET',
      headers: {
        'Cookie': cookie,
        'Origin': 'http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io'
      }
    }, (res) => {
      console.log('--- USERS ME RESPONSE ---');
      console.log('STATUS:', res.statusCode);
      console.log('HEADERS:', JSON.stringify(res.headers, null, 2));
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => {
        console.log('BODY:', data);
        resolve();
      });
    });

    req.on('error', reject);
    req.end();
  });
}

async function run() {
  try {
    console.log('1. POSTing to /auth/user/emailpass...');
    const token = await postLogin();
    console.log('Received JWT token:', token.substring(0, 30) + '...');

    console.log('\n2. POSTing to /auth/session...');
    const sessionRes = await postSession(token);
    const cookies = sessionRes.headers['set-cookie'] || [];
    console.log('Cookies received:', cookies);

    if (cookies.length > 0) {
      const cookieStr = cookies.map(c => c.split(';')[0]).join('; ');
      console.log('\n3. GETting /admin/users/me with cookie:', cookieStr);
      await getUsersMe(cookieStr);
    } else {
      console.log('\nNo cookies returned from /auth/session!');
    }
  } catch (err) {
    console.error('Error:', err.message);
  }
}

run();
