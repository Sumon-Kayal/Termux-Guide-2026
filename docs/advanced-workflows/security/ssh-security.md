# SSH Keys & Secure Installation

## SSH Key Setup

**Generate SSH Key:**
```bash
# Generate new SSH key
ssh-keygen -t ed25519 -C "your@email.com"

# Or RSA (for compatibility)
ssh-keygen -t rsa -b 4096 -C "your@email.com"

# Save to: ~/.ssh/id_ed25519
# Set a strong passphrase
```

**Copy public key to server:**
```bash
# View your public key
cat ~/.ssh/id_ed25519.pub

# Copy to remote server
ssh-copy-id -p 22 user@remote-server

# Or manually
cat ~/.ssh/id_ed25519.pub | ssh user@remote-server "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

**Configure SSH client:**
```bash
# Create SSH config
cat > ~/.ssh/config << 'EOF'
Host myserver
    HostName example.com
    User username
    Port 22
    IdentityFile ~/.ssh/id_ed25519

Host github
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
EOF

chmod 600 ~/.ssh/config

# Now you can connect with:
ssh myserver
```

## Secure Termux Installation

**Set Termux password:**
```bash
# Set password (for SSH access)
passwd

# Use strong password with:
# - Minimum 12 characters
# - Mix of uppercase, lowercase, numbers, symbols
```

**Disable password login (SSH keys only):**
```bash
# Edit sshd config
nano $PREFIX/etc/ssh/sshd_config

# Find and change:
PasswordAuthentication no
PermitRootLogin no
PubkeyAuthentication yes

# Restart SSH server
pkill sshd
sshd
```
