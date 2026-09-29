# Python Setup

Install Python and pip:

```bash
# Install Python tools
pkg install python python-pip
```

See [Virtual Environments](virtual-environments.md) for isolated project setups and [Python Packages](packages.md) for pip usage.

Python web server example:

Serve only a dedicated directory containing files safe for other apps to read; do not include sensitive files or symlinks to them. Binding to loopback (`127.0.0.1`) does not prevent other Android apps from accessing this unauthenticated server.

```bash
# Put only files safe to share in this dedicated directory
mkdir -p ~/public-http
python -m http.server 8000 --bind 127.0.0.1 --directory ~/public-http

# Access at: http://localhost:8000
```
