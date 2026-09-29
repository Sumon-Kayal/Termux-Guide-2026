# SSH Server

## SSH Server Setup

**Run SSH server in Termux:**
```bash
# Install OpenSSH
pkg install openssh

# Set password for Termux
passwd

# Start SSH server
sshd

# Find your IP address
ip addr show wlan0 | grep inet

# Default port: 8022
# Connect from PC: ssh -p 8022 username@phone-ip
```
