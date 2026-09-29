# Node.js Setup

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

## npm (Node.js Package Manager)

```bash
# Install package globally
npm install -g package-name

# Install package locally
npm install package-name

# Install dev dependency
npm install --save-dev package-name

# Uninstall package
npm uninstall package-name

# Update packages
npm update

# List installed packages
npm list

# Check for outdated packages
npm outdated
```

---
