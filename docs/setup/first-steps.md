# First Steps

## ⚠️ Critical Safety Warnings

**READ BEFORE PROCEEDING:**

- **NEVER** run `rm -rf $PREFIX` or `rm -rf /data/data/com.termux/files/home /data/data/com.termux/files/usr` unless you want to completely destroy your Termux installation (see [Removal Commands](../reference/troubleshooting/cleanup-and-removal.md) for context)
- **ALWAYS** have backups before running removal/cleanup commands
- Test commands individually before combining them into scripts
- The `exit` commands after every operation will close Termux - remove them if you want to continue working
- **Security tools** are for authorized testing ONLY - illegal use carries serious legal consequences

---

## Quick Start (TL;DR)

**Absolute minimum setup for most users:**

```bash
# Enable storage & update system
termux-setup-storage
pkg update && pkg upgrade -y

# Install essential tools
pkg install -y python python-pip git neovim ffmpeg proot-distro nodejs wget curl

# Install yt-dlp with the EJS scripts required for full YouTube support
pip install -U "yt-dlp[default]"

# Done! Start using Termux
```

**One-liner for power users:**
```bash
termux-setup-storage && pkg update && pkg upgrade -y && pkg install -y python python-pip git neovim ffmpeg mpv proot-distro nodejs openjdk-17 wget curl gh nmap termux-api && pip install -U "yt-dlp[default]" && pkg autoclean
```

---

## 1. Initial Setup

### Enable Storage Access
```bash
termux-setup-storage
```
*This grants Termux permission to access your device's shared storage.*

### Update Repositories & Add Extras
```bash
# Change to faster mirror (optional - most users already on good mirrors)
termux-change-repo
# Recommended: Select Cloudflare mirror (fastest in most regions, especially India/Asia)
# Note: Hetzner and default mirrors are also stable in 2026

# Update package lists
pkg update

# Add additional repositories
pkg install root-repo x11-repo -y

# Full system update
pkg update && pkg upgrade -y

# Initial cleanup
apt clean && pkg clean && pkg autoclean
```

**Optional: Termux User Repository** — install only if you need specific packages from it; these user-maintained packages may have compatibility issues.

```bash
pkg install tur-repo -y
```

**Repository Notes (January 2026):**
- **Cloudflare mirror:** Best for India, Asia, and most global locations
- **Hetzner mirror:** Good European alternative
- **tur-repo warning:** User-maintained packages may have compatibility issues. Disable after installing needed packages:
  ```bash
  # To disable tur-repo after use:
  pkg uninstall tur-repo
  ```

**Note:** Remove the `&& exit` from the original if you want to continue without closing Termux.

---
