# Web Servers

**Node.js Server:**
```bash
# Install Node.js
pkg install nodejs

# Create simple server
cat > server.js << 'EOF'
const http = require('http');
const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('<h1>Hello from Termux!</h1>');
});
server.listen(8080, () => {
  console.log('Server running at http://localhost:8080/');
});
EOF

# Run server
node server.js

# Access from Android browser: http://localhost:8080
```

**Python Web Server:**

Serve only a dedicated directory containing files safe for other apps to read; do not include sensitive files or symlinks to them. Binding to loopback (`127.0.0.1`) does not prevent other Android apps from accessing this unauthenticated server.

```bash
# Put only files safe to share in this dedicated directory
mkdir -p ~/public-http
python -m http.server 8000 --bind 127.0.0.1 --directory ~/public-http

# Access at: http://localhost:8000
```
