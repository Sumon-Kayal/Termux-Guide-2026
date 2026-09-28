# Repository Errors

## Packages Won't Install
```bash
# Reset repository mirrors
termux-change-repo

# Force a mirror availability check, then update
pkg --check-mirror update

# Fix broken packages
pkg upgrade -y
dpkg --configure -a
```
