# Networking Packages & Tools

## Nmap - Network Scanner

**Basic port scanning:**
```bash
# Scan common ports on a host
nmap example.com

# Scan specific ports
nmap -p 80,443,8080 example.com

# Scan port range
nmap -p 1-1000 example.com

# Fast scan (top 100 ports)
nmap -F example.com

# Service version detection
nmap -sV example.com

# OS detection (requires root)
nmap -O example.com
```

## Network Diagnostics

```bash
# Check your IP address
curl ifconfig.me
# or
curl icanhazip.com

# DNS lookup
nslookup example.com

# Trace route to host
traceroute example.com

# Check open ports on your device
netstat -tuln

# Monitor network connections
ss -tuln

# Check network interfaces
ip addr show

# Ping a host
ping -c 4 google.com

# Check WiFi information
termux-wifi-connectioninfo
```

## Network Speed Test

```bash
# Install speedtest-cli
pip install speedtest-cli

# Run speed test
speedtest-cli

# Simple version
speedtest-cli --simple
```

## Download Tools

```bash
# Download file with wget
wget https://example.com/file.zip

# Download with progress bar
wget --progress=bar https://example.com/file.zip

# Resume interrupted download
wget -c https://example.com/file.zip

# Download with curl
curl -O https://example.com/file.zip

# Download and save with different name
curl -o myfile.zip https://example.com/file.zip
```

---
