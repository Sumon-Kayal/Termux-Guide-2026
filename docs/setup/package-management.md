# Package Management

## pkg vs apt

Both `pkg` and `apt` work in Termux, but `pkg` is recommended:

**pkg (Recommended):**
```bash
pkg install package-name    # Install package
pkg update                  # Update package lists
pkg upgrade                 # Upgrade packages
pkg search keyword          # Search for packages
pkg show package-name       # Show package info
pkg list-installed          # List installed packages
pkg uninstall package-name  # Remove package
pkg files package-name      # List files in package
```

**apt (Advanced):**
```bash
apt update                  # Update package lists
apt upgrade                 # Upgrade packages
apt install package-name    # Install package
apt remove package-name     # Remove package
apt autoremove              # Remove unused dependencies
apt clean                   # Clear cache
apt search keyword          # Search packages
apt show package-name       # Package details
```

**Key Differences:**
- `pkg` is a wrapper around `apt` with better defaults
- `pkg` automatically runs `apt update` when needed
- `pkg` has shorter, more intuitive commands
- Both can be used interchangeably for most operations
