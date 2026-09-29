# Permissions & Network Security

## Network Security

**Check open ports:**
```bash
# List all open ports
netstat -tuln

# Or with ss
ss -tuln

# Check specific port
netstat -tuln | grep :8080
```

**Firewall (requires root):**
```bash
# Note: Most users don't need this without root
# Android manages network permissions

# With root, you can use iptables
iptables -L
```

## Secure File Permissions

```bash
# Make file readable only by you
chmod 600 sensitive-file.txt

# Make directory private
chmod 700 ~/private-directory/

# Check file permissions
ls -la filename

# Remove execute permission
chmod -x script.sh

# Add execute permission
chmod +x script.sh
```

## Regular Security Maintenance

```bash
# Update all packages (security patches)
pkg update && pkg upgrade -y

# Remove old/unused packages
pkg autoremove -y

# Check for suspicious processes
ps aux

# View login attempts (if SSH server running)
cat $PREFIX/var/log/auth.log

# Check Termux app permissions in Android settings
# Remove unnecessary permissions
```
