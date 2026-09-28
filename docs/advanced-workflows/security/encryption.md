# Encryption & Password Management

## File Encryption

**Encrypt files with GPG:**
```bash
# Install GPG
pkg install gnupg

# Encrypt file
gpg -c secret.txt
# Enter passphrase
# Creates: secret.txt.gpg

# Decrypt file
gpg secret.txt.gpg
# Enter passphrase
# Creates: secret.txt
```

**Encrypt with password:**
```bash
# Install openssl
pkg install openssl

# Encrypt file
openssl enc -aes-256-cbc -salt -in file.txt -out file.txt.enc

# Decrypt file
openssl enc -aes-256-cbc -d -in file.txt.enc -out file.txt
```

## Password Management

**Using pass (Unix password manager):**
```bash
# Install pass
pkg install pass

# Generate GPG key first
gpg --full-generate-key

# Initialize pass
pass init your@email.com

# Store password
pass insert email/gmail
pass insert social/facebook

# Retrieve password
pass email/gmail

# Generate random password
pass generate email/newaccount 20

# List all passwords
pass

# Remove password
pass rm email/oldaccount
```
