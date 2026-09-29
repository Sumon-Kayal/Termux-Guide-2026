# Cleanup, Maintenance & Removal

### Regular Maintenance
```bash
# Update all packages
pkg update -y && pkg upgrade -y

# Clean package cache
apt clean && pkg clean

# Remove unused packages
apt autoremove -y && pkg autoclean

# Clear command history (optional)
cat /dev/null > ~/.bash_history && history -c
```

### Quick Cleanup Command
```bash
pkg update -y && pkg upgrade -y && \
apt clean && pkg clean && \
pkg autoclean && apt autoremove -y && \
cat /dev/null > ~/.bash_history && history -c
```

---

## Removal Commands (DANGEROUS)

### ⚠️ EXTREME CAUTION REQUIRED

These commands will **PERMANENTLY DELETE** files and settings. **BACKUP FIRST!**

### Remove AVcleaner & Cache Files
```bash
# Remove AVcleaner symlink and directory
rm -rf $PREFIX/bin/clean
rm -rf ~/AVcleaner

# Remove cache and config directories
rm -rf ~/.cache
rm -rf ~/.termux
rm -rf ~/.ssh
rm -rf ~/.config/mpv
```

### Nuclear Option - Complete Termux Removal
```bash
# ☢️ THIS DESTROYS YOUR ENTIRE TERMUX INSTALLATION ☢️
# Only use if you want to start completely fresh

rm -rf $PREFIX
# or
rm -rf /data/data/com.termux/files/home
rm -rf /data/data/com.termux/files/usr
```

**After running this, you must:**
1. Close Termux completely
2. Clear app data from Android settings
3. Reinstall Termux from F-Droid

---
