# SSH Client

```bash
# Connect to remote server
ssh user@hostname

# Connect with specific key
ssh -i ~/.ssh/id_rsa user@hostname

# Copy files to remote server
scp file.txt user@hostname:/path/to/destination/

# Copy files from remote server
scp user@hostname:/path/to/file.txt ./
```
