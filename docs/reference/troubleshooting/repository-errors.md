# Repository Errors

## Packages Won't Install
```bash
# Reset repository mirrors
termux-change-repo

# Force update
pkg update --force

# Fix broken packages
pkg upgrade -y
dpkg --configure -a
```
