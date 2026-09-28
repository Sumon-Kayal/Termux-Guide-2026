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
```bash
# Simple HTTP server (Python 3)
python -m http.server 8000

# Access at: http://localhost:8000
```
