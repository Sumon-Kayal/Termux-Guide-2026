# 📱 Termux Setup Guide (2025/2026)

<div align="center">

![Termux Setup Guide](https://github.com/Sumon-Kayal/Termux-Guide-2026/blob/8518bcf41ff0afab79115038972d0d642cfd1647/screenshots/1782247350294.jpg)

</div>

> **A comprehensive, safety-focused setup guide for Termux with modern tools and best practices**

<div align="center">

[![Termux](https://img.shields.io/badge/Termux-0.118.3%20stable%20%2F%200.119.0-beta.3-000000?style=for-the-badge&logo=android&logoColor=white)](https://termux.dev)
[![Android](https://img.shields.io/badge/Android-7.0+-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://www.android.com)
[![License](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg?style=for-the-badge)](LICENSE.md)
[![Last Updated](https://img.shields.io/badge/Updated-Jun_2026-green?style=for-the-badge)](.)

**📥 Download:** [F-Droid](https://f-droid.org/packages/com.termux/) | [GitHub Releases](https://github.com/termux/termux-app/releases)  
**⚠️ Avoid Google Play:** Heavily restricted builds with limited functionality

</div>

---


## ⚠️ CRITICAL SAFETY WARNINGS

**READ BEFORE PROCEEDING:**

- **NEVER** run `rm -rf $PREFIX` or `rm -rf /data/data/com.termux/files/home /data/data/com.termux/files/usr` unless you want to completely destroy your Termux installation (see [Removal Commands](#19-removal-commands-dangerous) for context)
- **ALWAYS** have backups before running removal/cleanup commands
- Test commands individually before combining them into scripts
- The `exit` commands after every operation will close Termux - remove them if you want to continue working
- **Security tools** are for authorized testing ONLY - illegal use carries serious legal consequences

---


## 📌 Version & Compatibility Notice (January 2026)

### Current Termux Versions
- **Stable:** 0.118.3 (May 2025) - Recommended for most users
- **Beta:** 0.119.0-beta.3 (May-June 2025) - For testing new features
- **Google Play:** googleplay.2026.01.07 - **NOT RECOMMENDED** (heavily restricted to comply with Play Store policies)

### ⚠️ Important Updates & Changes

**Package Mirrors (2025-2026):**
- Modern default mirrors: Cloudflare and Hetzner (more stable than older mirrors)
- Bootstrap files: Now tagged as `bootstrap-2026.01.11-r1` and newer
- `termux-change-repo` still works but many users already on best mirrors by default
- **Recommended mirror for India/Asia:** Cloudflare (usually fastest)

**Package Availability Notes:**
- `vlc` - Available but heavy; most users prefer `mpv` + `ffmpeg` combination
- `gdrive-downloader` - May be from `tur-repo`; availability varies by mirror
- `termux-api` - **IMPORTANT:** Install both the F-Droid app AND run `pkg install termux-api`
- `openjdk-17` - Main supported Java version (openjdk-21 exists but less tested)
- `tur-repo` - Can break compatibility; only enable when you need specific packages

**GUI/Desktop Changes:**
- **Modern approach (2026):** Termux:X11 + proot-distro (better performance than VNC)
- **Traditional approach:** TigerVNC + XFCE (still works, but slower)
- See both methods in [VNC Server Setup](#12-vnc-server-setup) and [Proot-Distro Ubuntu](#13-proot-distro-ubuntu)

**Root/Swap File Limitation:**
- Swap file creation requires root access (`swapon` command)
- Non-rooted devices: Swap commands will fail silently
- Android manages memory automatically on non-rooted devices

**Configuration Backup Recommendation:**
- Back up `~/.termux/termux.properties` separately (font & appearance settings)
- Back up `~/.termux/colors.properties` separately (color schemes)
- These survive `pkg upgrade` but not full system restore

**Version Managers (2026 Recommendation):**
- For Python: Use `uv` or `mise`/`asdf` instead of installing multiple versions directly
- For Node.js: Use `nvm` or `mise`/`asdf`
- Cleaner version management and easier switching

---


## Table of Contents

### 🚀 Getting Started
- [What is Termux?](#what-is-termux)
- [Download & Installation](#download--installation)
- [Quick Start (TL;DR)](#quick-start-tldr)
- [1. Initial Setup](#1-initial-setup)

### 📦 Package Installation & Management
- [2. Core Package Installation](#2-core-package-installation)
- [3. Python Tools & Media Utilities](#3-python-tools--media-utilities)
- [4. Optional Packages](#4-optional-packages)
- [10. Package Managers Explained](#10-package-managers-explained)
  - [pkg vs apt](#pkg-vs-apt)
  - [pip](#pip-python-package-manager) · [npm](#npm-nodejs-package-manager)

### 🛠️ Tools & Utilities
- [5. Network Tools](#5-network-tools)
- [6. Termux:API Usage](#6-termuxapi-usage)
- [7. File Management](#7-file-management)

### ⚡ Performance & Optimization
- [8. Performance Optimization](#8-performance-optimization)
  - [Swap Files](#create-swap-file-for-low-ram-devices) · [Wake Lock](#keep-termux-running-in-the-background-wake-lock) · [🆕 Android 12+ Phantom Process Fix](#-android-12-phantom-process-killing-fix)

### 💻 Development & Use Cases
- [9. Common Use Cases](#9-common-use-cases)
  - [Web Development](#web-development)
  - [Python Environment](#python-development-environment)
  - [Git Workflow](#git-workflow)
  - [SSH Server Setup](#ssh-server-setup)
  - [Code Compilation](#code-compilation)
  - [Database Setup](#database-setup)
  - [🆕 tmux — Keep Sessions Alive](#tmux--keep-sessions-alive)

### 🖥️ Environment & GUI Setup
- [11. Termux:Boot Setup](#11-termuxboot-setup)
- [🆕 11.5 termux-services](#115-termux-services--auto-restart-background-services)
- [12. VNC Server Setup](#12-vnc-server-setup)
- [13. Proot-Distro Ubuntu](#13-proot-distro-ubuntu)
  - [Desktop Environment](#desktop-environment-optional) · [QEMU Support](#qemu-support-optional)

### 🔒 Security
- [14. Security Best Practices](#14-security-best-practices)
  - [SSH Keys](#ssh-key-setup) · [File Encryption](#file-encryption) · [Password Management](#password-management) · [Shell History Hygiene](#shell-history-hygiene)
- [🆕 14.5 Customizing Termux](#145-customizing-termux--termuxproperties)
- [15. AVcleaner Tool](#15-avcleaner-tool)
- [16. Security Tools (USE RESPONSIBLY)](#16-security-tools-use-responsibly)

### 💾 Backup, Cleanup & Removal
- [17. Backup & Restore](#17-backup--restore)
- [18. Cleanup & Maintenance](#18-cleanup--maintenance)
- [19. Removal Commands (DANGEROUS)](#19-removal-commands-dangerous)

### 📚 Resources & Reference
- [Resources](#resources)
  - [Official Documentation & Repositories](#official-documentation--repositories)
  - [Download Termux & Add-ons](#download-termux--add-ons)
  - [Awesome Lists & Curated Collections](#awesome-lists--curated-collections)
  - [Tool Installers](#tool-installers)
  - [Popular Tools by Category](#popular-tools-by-category)
  - [Linux Distributions in Termux](#linux-distributions-in-termux)
  - [GitHub Topic Collections](#github-topic-collections)
  - [Learning Resources](#learning-resources)
  - [Community & Support](#community--support)
  - [Contributing Back](#contributing-back)

### 🛟 Help & Troubleshooting
- [Troubleshooting](#troubleshooting)
- [Frequently Asked Questions (FAQ)](#frequently-asked-questions-faq)

### 📋 About This Guide
- [Notes](#notes)
- [Credits & Contributing](#-credits--contributing)
- [License](#license)

---


## What is Termux?

**Termux** is a powerful terminal emulator and Linux environment for Android that works without root. It combines:
- A full Linux command-line interface
- Extensive package collection (via APT/pkg)
- Development tools (Python, Node.js, Ruby, Go, Rust, etc.)
- Network utilities and servers
- Access to Android APIs

**Key Features:**
- ✅ No root required
- ✅ 2000+ packages available
- ✅ Full Python, Node.js, Git support
- ✅ SSH client/server
- ✅ Access Android hardware (camera, GPS, sensors)
- ✅ Run Linux distributions (Ubuntu, Debian, Arch)

---


## Download & Installation

### ⚡ Recommended: F-Droid (Official)

**Download Termux from F-Droid:**
1. Install [F-Droid](https://f-droid.org/) app store
2. Search for "Termux" in F-Droid
3. Install **Termux** (main app)
4. Optionally install add-ons:
   - Termux:API
   - Termux:Boot
   - Termux:Float
   - Termux:Styling
   - Termux:Widget
   - Termux:Tasker

**Direct Download:**
- **F-Droid:** https://f-droid.org/packages/com.termux/
- **GitHub Releases:** https://github.com/termux/termux-app/releases

### ⚠️ DO NOT Use Play Store

The Play Store version of Termux is **outdated and abandoned**. It will not receive updates and may have compatibility issues.

---


## Quick Start (TL;DR)

**Absolute minimum setup for most users:**

```bash
# Enable storage & update system
termux-setup-storage
pkg update && pkg upgrade -y

# Install essential tools
pkg install -y python git neovim ffmpeg proot-distro nodejs wget curl

# Install yt-dlp
pip install -U yt-dlp

# Done! Start using Termux
```

**One-liner for power users:**
```bash
termux-setup-storage && pkg update && pkg upgrade -y && pkg install -y python git neovim ffmpeg mpv yt-dlp proot-distro nodejs openjdk-17 wget curl gh nmap termux-api && pip install -U yt-dlp && pkg autoclean
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
pkg install root-repo x11-repo tur-repo -y
# ⚠️ Note: tur-repo can occasionally break compatibility
# Only keep it enabled if you need specific packages from it

# Full system update
pkg update && pkg upgrade -y

# Initial cleanup
apt clean && pkg clean && pkg autoclean
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


## 2. Core Package Installation

### Essential Tools
```bash
pkg install -y \
  7zip mount-utils exfatprogs e2fsprogs \
  python gnupg python-pip \
  proot-distro proot fakeroot busybox \
  ruby openjdk-17 \
  mpv neovim ffmpeg ytui-music sox vlc \
  git iproute2 android-tools tsu neofetch \
  wget cmake make curl gh parted bash \
  nmap termux-api gdrive-downloader \
  nodejs rust

# Cleanup
apt clean && pkg clean && pkg autoclean && apt autoremove -y
```

**Package Categories:**
- **Compression:** 7zip
- **Filesystem:** mount-utils, exfatprogs, e2fsprogs
- **Languages:** python, ruby, nodejs, rust, openjdk-17
- **Media:** mpv, ffmpeg, ytui-music, sox, vlc
- **Development:** git, neovim, cmake, make, curl, gh
- **System:** proot-distro, tsu, nmap, termux-api

**⚠️ Package Availability Notes (2026):**

- **`vlc`** - Heavy package (~200MB). Most users prefer `mpv` + `ffmpeg` which are lighter and faster
  ```bash
  # Lightweight alternative: Skip VLC, use mpv only
  pkg install mpv ffmpeg -y
  ```

- **`gdrive-downloader`** - May be unavailable on some mirrors; primarily in `tur-repo`
  ```bash
  # If not found, ensure tur-repo is enabled
  pkg install tur-repo
  pkg update
  pkg install gdrive-downloader
  ```

- **`termux-api`** - **CRITICAL:** You need BOTH:
  1. Install Termux:API app from F-Droid: https://f-droid.org/packages/com.termux.api/
  2. Install the package: `pkg install termux-api`
  
  Without the F-Droid app, termux-api commands won't work!

- **`openjdk-17`** - Main supported Java version in Termux
  - `openjdk-21` exists but is less tested
  - Stick with 17 unless you specifically need 21

- **Version Managers (Modern Approach 2026):**
  ```bash
  # Instead of installing multiple Python versions:
  pip install uv  # Modern Python version manager
  
  # Or use mise (universal version manager)
  curl https://mise.run | sh
  mise install python@3.11 python@3.12
  
  # For Node.js version management:
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  ```

---


## 3. Python Tools & Media Utilities

### yt-dlp Installation

**Option 1: Stable Release**
```bash
pip install yt-dlp
```

**Option 2: Latest Pre-release (Recommended)**
```bash
pip install -U --pre "yt-dlp[default]"
```

### Additional Python Tools
```bash
# Install yturl
pip install yturl

# Modern Python package managers
pip install pipx pip-tools
pipx install uv
```

### FFmpeg Quick Reference
```bash
# Convert WebM to MP3
ffmpeg -i input.webm -vn -ar 44100 -ac 2 -b:a 192k output.mp3
```

**Parameters explained:**
- `-vn` - No video
- `-ar 44100` - Audio sample rate
- `-ac 2` - Audio channels (stereo)
- `-b:a 192k` - Audio bitrate

---


## 4. Optional Packages

These packages provide advanced functionality but aren't required for basic use:

```bash
pkg install -y \
  iproute2 bash-completion perl \
  mount-utils autoconf automake \
  bison flex libtool m4 pcre \
  silversearcher-ag apache2 apr apr-util \
  fish libxslt python-lxml python-tkinter

# Cleanup
pkg update -y && pkg upgrade -y
apt clean && pkg clean && pkg autoclean && apt autoremove -y
```

**Use cases:**
- **Development:** autoconf, automake, libtool
- **Shells:** fish (modern shell alternative)
- **Web:** apache2 (web server)
- **Search:** silversearcher-ag (fast code search)

### Self-Hosting & Networking Stack

For running git servers, tunnels, and reverse proxies directly on-device:

```bash
pkg install -y \
  tor which mandoc deno \
  cloudflared nginx caddy \
  tmux dnsutils golang openssl-tool \
  gitea forgejo
```

**What each one is for:**
- **tor** — Tor client; needed for hidden-service-based self-hosting without a public IP
- **which** — locates binaries in `$PATH` (small POSIX utility, often assumed present but isn't by default)
- **mandoc** — man page compiler/viewer; Termux doesn't ship man pages by default, this adds support
- **deno** — secure-by-default JS/TS runtime, alternative to Node.js for scripts and linting
- **cloudflared** — Cloudflare Tunnel client; exposes a local server through a stable URL without port-forwarding
- **nginx / caddy** — reverse proxies / static web servers (Caddy auto-handles TLS; nginx is the lighter-weight classic choice)
- **tmux** — terminal multiplexer; keeps sessions alive across disconnects, panes/windows in one Termux session
- **dnsutils** — `dig`, `nslookup`, and friends for DNS debugging
- **golang** — Go toolchain
- **openssl-tool** — CLI for certs, hashing, and encryption (separate from the `openssl` library package)
- **gitea / forgejo** — lightweight self-hosted Git servers (Forgejo is the community-driven Gitea fork)

> **Security Warning:**
> - **Bind services to 127.0.0.1** unless you intentionally need external access. Services like nginx, caddy, and gitea default to listening on all interfaces, which can expose them to your local network.
> - **Use strong authentication** for Gitea/Forgejo admin accounts. These services are designed for production use and should never have weak or default credentials.
> - **Cloudflare Tunnel exposes your device to the internet.** Only use cloudflared if you understand that it creates a public tunnel through Cloudflare's network to your local service.
> - **Note:** Forgejo may not be available in default Termux repos on all architectures. If `pkg install forgejo` fails, you'll need to build it from source or use Gitea instead.

---


## 5. Network Tools

### Nmap - Network Scanner

**Basic port scanning:**
```bash
# Scan common ports on a host
nmap example.com

# Scan specific ports
nmap -p 80,443,8080 example.com

# Scan port range
nmap -p 1-1000 example.com

# Fast scan (top 100 ports)
nmap -F example.com

# Service version detection
nmap -sV example.com

# OS detection (requires root)
nmap -O example.com
```

### Network Diagnostics

```bash
# Check your IP address
curl ifconfig.me
# or
curl icanhazip.com

# DNS lookup
nslookup example.com

# Trace route to host
traceroute example.com

# Check open ports on your device
netstat -tuln

# Monitor network connections
ss -tuln

# Check network interfaces
ip addr show

# Ping a host
ping -c 4 google.com

# Check WiFi information
termux-wifi-connectioninfo
```

### Network Speed Test

```bash
# Install speedtest-cli
pip install speedtest-cli

# Run speed test
speedtest-cli

# Simple version
speedtest-cli --simple
```

### Download Tools

```bash
# Download file with wget
wget https://example.com/file.zip

# Download with progress bar
wget --progress=bar https://example.com/file.zip

# Resume interrupted download
wget -c https://example.com/file.zip

# Download with curl
curl -O https://example.com/file.zip

# Download and save with different name
curl -o myfile.zip https://example.com/file.zip
```

---


## 6. Termux:API Usage

### ⚠️ IMPORTANT: Dual Installation Required

**You need BOTH components:**
1. **Termux:API app** from F-Droid: https://f-droid.org/packages/com.termux.api/
2. **termux-api package**: `pkg install termux-api`

Without both installed, API commands will fail silently or show "command not found"!

### Verify Installation
```bash
# Check if package is installed
pkg list-installed | grep termux-api

# Test if API app is working
termux-battery-status
# Should return JSON with battery info
```

### Camera

```bash
# Take a photo (saves to ~/storage/dcim/)
termux-camera-photo ~/storage/dcim/photo.jpg

# Take photo with front camera
termux-camera-photo -c 1 ~/storage/dcim/selfie.jpg
```

### Battery Information

```bash
# Get battery status
termux-battery-status

# Pretty print battery info
termux-battery-status | python -m json.tool
```

### Location

```bash
# Get current location (GPS)
termux-location

# Get location with specific provider
termux-location -p gps

# Get location with network provider
termux-location -p network
```

### Notifications

```bash
# Send notification
termux-notification -t "Title" -c "Content message"

# Notification with action
termux-notification -t "Download Complete" -c "File.zip ready" --sound

# Vibrate notification (still works in 2026)
termux-notification -t "Alert" -c "Check this!" --vibrate 200,100,200
```

### SMS (requires permissions)

```bash
# Send SMS
termux-sms-send -n "+1234567890" "Hello from Termux!"

# List SMS messages
termux-sms-list

# List only inbox
termux-sms-list -t inbox -l 10
```

### Clipboard

```bash
# Copy to clipboard
echo "Hello World" | termux-clipboard-set

# Get clipboard content
termux-clipboard-get
```

### Vibration

```bash
# Vibrate for 1 second
termux-vibrate -d 1000

# Vibrate pattern (on,off,on,off in ms)
termux-vibrate -d 500,200,500
```

### Toast Messages (Working in 2026)

```bash
# Show toast message
termux-toast "Hello from Termux!"

# Short duration toast
termux-toast -s "Quick message"

# Long duration toast
termux-toast -l "Longer message display"
```

### Volume Control

```bash
# Get current volume
termux-volume

# Set music volume to 50%
termux-volume music 50

# Set alarm volume to max
termux-volume alarm 15
```

### Flashlight

```bash
# Turn on flashlight
termux-torch on

# Turn off flashlight
termux-torch off
```

### Contact List

```bash
# List all contacts
termux-contact-list

# Get specific contact
termux-contact-list | grep "John"
```

### Call Log

```bash
# Get recent calls
termux-call-log

# Get last 5 calls
termux-call-log -l 5 -o all
```

### Additional Working Features (2026)

```bash
# Screen brightness control
termux-brightness 100  # Max brightness

# Microphone recording
termux-microphone-record -f output.mp3

# TTS (Text-to-Speech)
termux-tts-speak "Hello from Termux"

# Download with notification
termux-download https://example.com/file.zip

# Sensor data
termux-sensor -s light
termux-sensor -s accelerometer

# WiFi information
termux-wifi-connectioninfo
termux-wifi-scaninfo
```

---


## 7. File Management

### Accessing Android Storage

After running `termux-setup-storage`, you'll have these shortcuts:

```bash
# Navigate to common directories
cd ~/storage/shared          # Internal storage
cd ~/storage/downloads       # Downloads folder
cd ~/storage/dcim           # Camera photos
cd ~/storage/pictures       # Pictures folder
cd ~/storage/music          # Music folder
cd ~/storage/movies         # Videos folder
```

### Create Symbolic Links

```bash
# Link Downloads to home directory
ln -s ~/storage/downloads ~/downloads

# Link DCIM for easy photo access
ln -s ~/storage/dcim ~/photos

# Link Music folder
ln -s ~/storage/music ~/music

# Create custom shortcuts
ln -s ~/storage/shared/MyFiles ~/files
```

### File Operations

```bash
# Copy files to Android storage
cp myfile.txt ~/storage/downloads/

# Move files
mv myfile.txt ~/storage/documents/

# Create directory in shared storage
mkdir -p ~/storage/shared/MyProjects

# Archive and move to storage
tar -czf project.tar.gz myproject/
mv project.tar.gz ~/storage/downloads/
```

### File Sharing Between Termux and Android

```bash
# Make a file accessible to Android apps
cp document.pdf ~/storage/downloads/

# Access file shared by Android app
cat ~/storage/downloads/shared-file.txt

# Edit file with Android editor, then process in Termux
vim ~/storage/downloads/document.txt
```

### Useful File Commands

```bash
# Find files by name
find ~/storage/shared -name "*.pdf"

# Find files modified in last 7 days
find ~/storage/downloads -mtime -7

# Search for text in files
grep -r "search term" ~/storage/documents/

# Get file size
du -h filename

# Get directory size
du -sh ~/storage/downloads/

# List files by size
ls -lhS

# List files by modification time
ls -lht
```

---


## 8. Performance Optimization

### Create Swap File (for low RAM devices)

**⚠️ CRITICAL: Requires ROOT access - Will NOT work on non-rooted devices!**

```bash
# ⚠️ This section requires root/tsu access
# On non-rooted devices, these commands will fail silently

# Create 1GB swap file (requires root)
fallocate -l 1G $PREFIX/var/swapfile
chmod 600 $PREFIX/var/swapfile
mkswap $PREFIX/var/swapfile

# Enable swap (requires root - will fail without root)
swapon $PREFIX/var/swapfile

# Check swap status
free -h

# To disable swap
swapoff $PREFIX/var/swapfile
```

**Important Notes:**
- ✅ **With root:** Swap can help on low-RAM devices (but may wear out storage)
- ❌ **Without root:** Android manages memory automatically; swap commands will fail
- 💡 **Alternative:** Close background apps, use lighter packages, disable unused services

**Non-Root Memory Optimization:**
```bash
# Use lighter alternatives
pkg install busybox  # Lighter than full coreutils
pkg install micro    # Lighter than vim if you don't need all features

# Monitor memory without swap
free -h
top

# Kill memory-heavy processes
pkill process-name
```

### Process Management

```bash
# View running processes
top

# View processes (alternative)
htop  # install with: pkg install htop

# Kill process by name
pkill process-name

# Kill process by PID
kill 12345

# Force kill process
kill -9 12345

# View all Termux processes
ps aux | grep termux

# Find resource-heavy processes
ps aux --sort=-%mem | head -10
```

### Battery Optimization Settings

**Disable battery optimization for Termux:**

1. Go to Android Settings
2. Apps → Termux
3. Battery → Battery optimization
4. Select "All apps"
5. Find Termux → Select "Don't optimize"

**For Termux:API, Termux:Boot, Termux:Widget:**
Repeat the same process for each app.

### Keep Termux Running in the Background (Wake Lock)

Even with battery optimization disabled, Android can still suspend Termux's CPU access once the screen is off or the app is backgrounded. `termux-wake-lock` (from the `termux-api` package) requests a partial wake lock so long-running jobs (servers, syncs, backups, `sshd`) keep executing:

```bash
# Acquire wake lock - keep CPU active while Termux is backgrounded
termux-wake-lock

# Release wake lock when done
termux-wake-unlock
```

This is why boot scripts and background services elsewhere in this guide call `termux-wake-lock` before starting a server.

### Memory Management

```bash
# Check memory usage
free -h

# Clear system cache (limited effect)
sync
echo 3 > /proc/sys/vm/drop_caches  # requires root

# View memory info
cat /proc/meminfo

# Monitor memory in real-time
watch -n 1 free -h
```

### Speed Up Package Installation

```bash
# Use faster mirror
termux-change-repo
# Select mirror closest to your location

# Parallel downloads (experimental)
echo "Acquire::Queue-Mode \"access\";" >> $PREFIX/etc/apt/apt.conf.d/99custom
```

### 🆕 Android 12+ Phantom Process Killing Fix

**What is this?**
Android 12 and newer silently kills background processes started by Termux after a while. This means your running servers, Python scripts, and compilation jobs can die without any error message. This is one of the most common reasons things "randomly stop working" in Termux on modern phones.

**How do you know you're affected?**
- You're on Android 12, 13, 14, or 15
- Running servers (sshd, gitea, nginx) stop on their own
- Long scripts die partway through for no reason
- `termux-wake-lock` doesn't help (it only prevents CPU sleep, not this)

**The fix — do this once and it survives reboots:**

You don't need a PC. Android 11+ lets you use ADB wirelessly from Termux itself.

> **⚠️ Warning:** This uses a debug command (`set_sync_disabled_for_tests`) that disables Android's configuration sync. If you have issues after a system update or want to restore normal behavior, run:
> `adb shell "/system/bin/device_config set_sync_disabled_for_tests none"`

**Step 1 — Enable Developer Options on your phone:**
1. Open **Settings** → **About Phone**
2. Tap **Build Number** 7 times quickly
3. You'll see "You are now a developer!" — that's the confirmation
## 9. Common Use Cases

### Web Development

**Node.js Server:**
```bash
# Install Node.js
pkg install nodejs

# Create simple server
cat > server.js << 'EOF'
const http = require('http');
const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('<h1>Hello from Termux!</h1>');
});
server.listen(8080, () => {
  console.log('Server running at http://localhost:8080/');
});
EOF

# Run server
node server.js

# Access from Android browser: http://localhost:8080
```

**Python Web Server:**
```bash
# Simple HTTP server (Python 3)
python -m http.server 8000

# Access at: http://localhost:8000
```

### Python Development Environment

```bash
# Install Python tools
pkg install python python-pip

# Create virtual environment
pip install virtualenv
virtualenv myenv
source myenv/bin/activate

# Install common packages
pip install numpy pandas matplotlib requests flask

# Create requirements file
pip freeze > requirements.txt

# Deactivate environment
deactivate
```

### Git Workflow

**Initial Setup:**
```bash
# Configure Git
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Set default editor
git config --global core.editor "vim"

# Cache credentials (1 hour)
git config --global credential.helper 'cache --timeout=3600'
```

**Common Commands:**
```bash
# Clone repository
git clone https://github.com/user/repo.git

# Check status
git status

# Add and commit
git add .
git commit -m "Update message"

# Push changes
git push origin main

# Pull latest changes
git pull

# Create new branch
git checkout -b feature-branch

# View commit history
git log --oneline --graph
```

**GitHub CLI:**
```bash
# Install GitHub CLI
pkg install gh

# Authenticate
gh auth login

# Create repository
gh repo create my-project --public

# Clone your repos
gh repo clone username/repository

# Create issue
gh issue create

# View pull requests
gh pr list
```

### SSH Server Setup

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

**SSH Client (Connect to other servers):**
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

### Code Compilation

**C/C++ Development:**
```bash
# Install compiler
pkg install clang

# Compile C program
clang program.c -o program

# Compile C++ program
clang++ program.cpp -o program

# Run
./program
```

**Rust Development:**
```bash
# Install Rust
pkg install rust

# Create new project
cargo new myproject
cd myproject

# Build project
cargo build

# Run project
cargo run
```

### Database Setup

**SQLite:**
```bash
# Install SQLite
pkg install sqlite

# Create database
sqlite3 mydb.db

# In SQLite prompt:
CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT);
INSERT INTO users VALUES (1, 'John');
SELECT * FROM users;
.quit
```

**PostgreSQL:**
```bash
# Install PostgreSQL
pkg install postgresql

# Initialize database
mkdir -p $PREFIX/var/lib/postgresql
initdb $PREFIX/var/lib/postgresql

# Start server
pg_ctl -D $PREFIX/var/lib/postgresql start

# Create database
createdb mydb

# Connect
psql mydb
```

### tmux — Keep Sessions Alive

**What is tmux and why do you need it?**

When you close the Termux app or your phone locks the screen, everything you were running stops. tmux is a "terminal multiplexer" — it keeps your work running in the background even when the app isn't visible. Think of it like minimizing a window instead of closing it.

With tmux you can also split your terminal into multiple panes (side by side), which is useful when you want to run a server in one pane and write code in another.

**Step 1 — Install:**
```bash
pkg install tmux
```

**Step 2 — Start a named session:**
```bash
tmux new -s main
# "main" is just a name — you can call it anything
```
You're now inside a tmux session. Everything you run here will keep going even if you close Termux.

**Step 3 — The key you need to know:**
All tmux commands start with **Ctrl+B** (press Ctrl and B together, then release, then press the next key).

**Most important commands:**

| What you want to do | Keys |
|---|---|
| Detach (leave session running) | `Ctrl+B` then `D` |
| List your sessions | (outside tmux) `tmux ls` |
| Come back to a session | (outside tmux) `tmux attach -t main` |
| New window (like a new tab) | `Ctrl+B` then `C` |
| Switch between windows | `Ctrl+B` then `N` (next) or `P` (previous) |
| Split screen left/right | `Ctrl+B` then `%` |
| Split screen top/bottom | `Ctrl+B` then `"` |
| Move between split panes | `Ctrl+B` then an arrow key |
| Scroll up through output | `Ctrl+B` then `[` — then arrow keys (press `Q` to exit scroll) |
| Kill current session | `Ctrl+B` then `X` → confirm with `Y` |

**Step 4 — Optional: Make tmux more comfortable**

Create a config file to enable mouse scrolling and other improvements:
```bash
cat > ~/.tmux.conf << 'EOF'
# Enable mouse support (lets you click to switch panes and scroll)
set -g mouse on

# Keep more scroll history
set -g history-limit 10000

# Start window numbers at 1 instead of 0 (easier to reach on keyboard)
set -g base-index 1

# Reload config without restarting tmux
bind r source-file ~/.tmux.conf \; display "Config reloaded!"
EOF
```
Apply it immediately: `tmux source-file ~/.tmux.conf` (or just close and reopen tmux).

**Step 5 — Start tmux automatically on boot (optional)**

Combined with Termux:Boot (see §11), tmux can start a persistent session every time your phone turns on:
```bash
cat > ~/.termux/boot/start-tmux << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
# Attach to existing session or create new one
tmux attach -t main || tmux new-session -d -s main
EOF

chmod +x ~/.termux/boot/start-tmux
```

> **Tip:** Run `tmux attach -t main` whenever you open Termux and your session will always be there.

---


## 10. Package Managers Explained

### pkg vs apt

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

### pip (Python Package Manager)

```bash
# Install Python package
pip install package-name

# Install specific version
pip install package-name==1.2.3

# Upgrade package
pip install --upgrade package-name

# Uninstall package
pip uninstall package-name

# List installed packages
pip list

# Show package info
pip show package-name

# Search for packages
pip search keyword  # (deprecated, use PyPI website)

# Install from requirements file
pip install -r requirements.txt

# Generate requirements file
pip freeze > requirements.txt
```

### npm (Node.js Package Manager)

```bash
# Install package globally
npm install -g package-name

# Install package locally
npm install package-name

# Install dev dependency
npm install --save-dev package-name

# Uninstall package
npm uninstall package-name

# Update packages
npm update

# List installed packages
npm list

# Check for outdated packages
npm outdated
```

---


## 11. Termux:Boot Setup

Run scripts automatically when your device boots.

### Installation

```bash
# Install from F-Droid: Termux:Boot app

# Create boot scripts directory
mkdir -p ~/.termux/boot
```

### Create Boot Script

```bash
# Example: Start SSH server on boot
cat > ~/.termux/boot/start-sshd << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
sshd
EOF

# Make executable
chmod +x ~/.termux/boot/start-sshd
```

### More Boot Script Examples

**Start Syncthing on boot:**
```bash
cat > ~/.termux/boot/start-syncthing << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
syncthing -no-browser &
EOF

chmod +x ~/.termux/boot/start-syncthing
```

**Run backup script on boot:**
```bash
cat > ~/.termux/boot/backup << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
sleep 60  # Wait for system to fully boot
tar -czf ~/storage/downloads/auto-backup-$(date +%Y%m%d).tar.gz ~/important-files/
EOF

chmod +x ~/.termux/boot/backup
```

**Test boot scripts:**
```bash
# Run manually to test
~/.termux/boot/start-sshd
```

---


## 11.5 termux-services — Auto-Restart Background Services

**What problem does this solve?**

Boot scripts from §11 work, but if a service crashes it stays dead until you restart it manually. `termux-services` uses a supervisor called **runit** that watches your services and automatically restarts them if they crash. It also gives you clean commands to start, stop, and check services — instead of hunting down process IDs with `pkill`.

**When to use which:**
| Situation | Use |
|---|---|
| One-time setup tasks on boot (wake lock, tmux init) | Boot scripts (§11) |
| Long-running servers that must stay up (sshd, gitea) | termux-services |

### Step 1 — Install

```bash
pkg install termux-services
```

Then **fully close and reopen Termux** — runit needs to initialize when Termux starts fresh.

### Step 2 — See what services are available

```bash
ls $PREFIX/etc/sv/
# This lists built-in service configs ready to enable
# Common ones: sshd, ftpd, crond
```

### Step 3 — Enable a service

```bash
# Enable sshd so it starts automatically and restarts if it crashes
sv-enable sshd

# You should see the service start immediately
```

### Step 4 — Manage services

```bash
# Check if a service is running
sv status sshd
# Output example: run: sshd: (pid 1234) 42s; run: log: (pid 1235) 42s

# Stop a service
sv down sshd

# Start it again
sv up sshd

# Restart it
sv restart sshd

# Disable permanently (won't start on boot anymore)
sv-disable sshd
```

### Step 5 — Create your own supervised service

This example keeps a Python HTTP server running and restarts it automatically if it dies:

```bash
# 1. Create a folder for your service
mkdir -p $PREFIX/var/service/myserver

# 2. Write the run script (this is what runit executes)
cat > $PREFIX/var/service/myserver/run << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
# Start your server here — runit will restart this if it exits
# Bind to localhost only for local testing
exec python -m http.server 8080 --bind 127.0.0.1
EOF

# 3. Make it executable
chmod +x $PREFIX/var/service/myserver/run

# 4. Enable it
sv-enable myserver

# 5. Check it's running
sv status myserver
```

> **Important:** Use `exec` (not just the command) in your run script. This makes runit properly track the process so it can restart it cleanly.
>
> **Note:** This example binds to localhost (127.0.0.1) only, making it accessible only from your device. This is appropriate for local testing and development.

---


## 12. VNC Server Setup

### 🆕 Modern Approach (2026): Termux:X11 (Recommended)

**Termux:X11** provides better performance than VNC for GUI applications.

**Installation:**
```bash
# Install Termux:X11 app from GitHub
# Download: https://github.com/termux/termux-x11/releases
# Install the APK manually

# Install required packages in Termux
pkg install x11-repo
pkg install termux-x11-nightly
pkg install pulseaudio
```

**Using with Proot-Distro:**
```bash
# Install a Linux distribution
proot-distro install ubuntu

# Install desktop environment in proot
proot-distro login ubuntu

# Inside Ubuntu:
apt update
apt install xfce4 xfce4-goodies dbus-x11 -y
exit

# Start Termux:X11 and desktop
termux-x11 :0 &
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

proot-distro login ubuntu --shared-tmp -- bash -c "export DISPLAY=:0 PULSE_SERVER=127.0.0.1; dbus-launch --exit-with-session startxfce4"
```

**Advantages of Termux:X11:**
- ✅ Better performance than VNC
- ✅ Hardware acceleration support
- ✅ Lower latency
- ✅ Direct window integration

---

### Traditional Approach: VNC Server

VNC is still useful for remote access or if Termux:X11 doesn't work on your device.

#### Install VNC Server

```bash
# Install TigerVNC
pkg install tigervnc

# Install desktop environment (choose one)
pkg install xfce4  # Recommended - lightweight

# or
pkg install lxde  # Very lightweight

# or
pkg install openbox  # Minimal
```

#### Configure VNC

```bash
# Set VNC password
vncserver

# This creates ~/.vnc directory and asks for password
# Enter a password (6-8 characters)
```

#### Start VNC Server

```bash
# Start VNC server
vncserver -localhost

# Note the display number, usually :1
```

#### Connect from Android

**Install VNC Viewer on Android:**
1. Install "VNC Viewer" from Play Store
2. Create new connection:
   - Address: `localhost:5901` (5900 + display number)
   - Name: Termux VNC

#### Create Start/Stop Scripts

**Start VNC:**
```bash
cat > ~/start-vnc << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
vncserver -localhost -geometry 1920x1080 -depth 24
EOF

chmod +x ~/start-vnc
```

**Stop VNC:**
```bash
cat > ~/stop-vnc << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
vncserver -kill :1
EOF

chmod +x ~/stop-vnc
```

#### Usage

```bash
# Start VNC server
~/start-vnc

# Open VNC Viewer app on Android
# Connect to localhost:5901

# Stop VNC server when done
~/stop-vnc
```

#### VNC with XFCE Desktop

```bash
# Configure XFCE to start with VNC
cat > ~/.vnc/xstartup << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
export PULSE_SERVER=127.0.0.1
startxfce4 &
EOF

chmod +x ~/.vnc/xstartup

# Restart VNC server
vncserver -kill :1
vncserver -localhost -geometry 1920x1080
```

#### Troubleshooting VNC

```bash
# Check if VNC is running
ps aux | grep vnc

# View VNC log
cat ~/.vnc/*.log

# Kill all VNC sessions
vncserver -kill :*

# Change VNC resolution
vncserver -kill :1
vncserver -localhost -geometry 1280x720
```

---

### Performance Comparison (2026)

| Method | Performance | Remote Access | Setup Difficulty |
|--------|-------------|---------------|------------------|
| **Termux:X11** | ⚡⚡⚡ Excellent | ❌ Local only | 🔧 Medium |
| **VNC** | ⚡⚡ Good | ✅ Yes | 🔧 Easy |
| **No GUI** | ⚡⚡⚡⚡ Best | ✅ SSH | 🔧 Easy |

**Recommendation:** Use Termux:X11 for local GUI apps, VNC for remote access, or command-line for best performance.

---


## 13. Proot-Distro Ubuntu

Run a full Ubuntu environment inside Termux (no root required).

### Install Ubuntu
```bash
proot-distro install ubuntu
```

**Installation location:**
```
/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/
```

### Login to Ubuntu
```bash
proot-distro login ubuntu
```

### Ubuntu Initial Setup
```bash
# Update Ubuntu packages
apt-get update -y && apt-get dist-upgrade -y

# Add universe repository
apt-get install software-properties-common -y
add-apt-repository universe
apt update && apt upgrade -y

# Install essential packages
apt-get install -y \
  apt-utils cmake make libreadline-dev sudo 7zip \
  mpv apt parted bash ca-certificates command-not-found \
  coreutils curl debianutils dpkg gpgv less nano \
  patch zstd sox git iproute2 bash-completion \
  wget perl neofetch pkg-config python3

# Cleanup
apt upgrade -y
apt clean && apt autoremove -y
```

### Desktop Environment (Optional)

**⚠️ WARNING:** Desktop environments are VERY resource-intensive on mobile devices. Consider XFCE instead of Cinnamon.

```bash
# Install Cinnamon (Heavy - 2GB+ RAM recommended)
sudo apt install cinnamon-desktop-environment -y

# Install multimedia codecs
sudo apt install libavcodec-extra ubuntu-restricted-extras -y

# Install GUI-only applications
sudo apt install vlc synaptic -y

# Alternative: XFCE (Lighter)
# sudo apt install xfce4 xfce4-goodies -y
```

**Requirements for GUI:**
- Install Termux:X11 app (from GitHub, not Play Store)
- Or use VNC server (easier for beginners)

### QEMU Support (Optional)
```bash
apt-get install qemu-system-aarch64 -y
pkg install qemu-utils -y
```

### Exit Ubuntu
```bash
cat /dev/null > ~/.bash_history && history -c
exit
```

---


## 14. Security Best Practices

### SSH Key Setup

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

### Secure Termux Installation

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

### File Encryption

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

### Password Management

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

### Network Security

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

### Secure File Permissions

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

### Regular Security Maintenance

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

### Backup Encryption

```bash
# Create encrypted backup
tar -czf - ~/important-files/ | \
  gpg -c > ~/storage/downloads/backup-$(date +%Y%m%d).tar.gz.gpg

# Restore encrypted backup
gpg -d ~/storage/downloads/backup-20260129.tar.gz.gpg | \
  tar -xzf - -C ~/
```

### Shell History Hygiene

Clearing history after sensitive commands (passwords, tokens, decryption commands) is good practice:

```bash
# Clear the history file AND the in-memory history of the current shell
cat /dev/null > ~/.bash_history && history -c
```

Both halves matter: `cat /dev/null > ~/.bash_history` empties the file on disk, but bash still holds the session's history in memory and will happily rewrite it to disk on exit — `history -c` clears that in-memory copy too.

**The problem:** even after both commands, bash's normal exit path still re-saves whatever history accumulates *after* you ran them — including the clearing commands themselves.

**hnuke.sh — a script to actually solve this:**

```bash
cat > hnuke.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# Safety check: only run when executed directly (not sourced)
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
  echo "ERROR: This script must be executed, not sourced." >&2
  return 1
fi

# Safety check: verify we're in an interactive shell
if [[ ! -t 0 ]] || [[ -z "$PS1" && -z "$PROMPT" ]]; then
  echo "ERROR: This script must run from an interactive shell." >&2
  exit 1
fi

# Wipe history file
cat /dev/null > ~/.bash_history

# Kill parent shell with SIGKILL (uncatchable)
# SIGKILL bypasses bash's EXIT trap, so history never gets rewritten
kill -9 $PPID
EOF

chmod +x hnuke.sh
```

Run it (`./hnuke.sh`) when you want the session to end with a guaranteed-clean history — `kill -9` terminates the parent shell before it gets a chance to flush its in-memory history back to `~/.bash_history`.

> **⚠️ Storage security note:** Keeping a copy in `~/storage/shared/download/` makes it easy to re-fetch if you ever wipe `$HOME`, but be aware that any app with storage access can modify files in that shared directory. Only store scripts there if you understand this exposure risk.

---


## 14.5 Customizing Termux — termux.properties

**What is this file?**

`~/.termux/termux.properties` is Termux's personal config file. It controls how the terminal looks and behaves — things like font size, what the extra keys row shows, whether the volume button acts as a shortcut key, and more.

Most users never touch it, but even a few small changes make Termux much more comfortable to use daily.

**Step 1 — Open or create the file:**
```bash
# Create the config directory if it doesn't exist yet
mkdir -p ~/.termux

# Open the file in a text editor
nano ~/.termux/termux.properties
```

**Step 2 — Apply changes:**

After saving the file, changes don't apply instantly. Either:
```bash
# Option A: Kill and restart Termux from the recents screen
# Option B: Run this to reload without closing
termux-reload-settings
```

---

### Font & Display

```properties
# Font size (default is 12, range is about 6–36)
terminal-font-size = 14

# Scrollback lines — how far you can scroll up (default 2000)
terminal-transcript-rows = 5000

# Cursor style: block | underline | bar
terminal-cursor-style = bar

# Cursor blink speed in ms (0 = no blink)
terminal-cursor-blink-rate = 600

# Force full-screen terminal (hides Android status bar)
fullscreen = true
```

---

### Keyboard & Button Behaviour

```properties
# What the back button does:
# "back"   = normal Android back navigation (default)
# "escape" = sends Escape key (useful for vim/neovim users)
back-key = escape

# What the volume keys do:
# "volume"       = normal volume control (default)
# "virtual-keys" = shows on-screen keyboard shortcuts
volume-keys = virtual-keys

# Use this if your keyboard input feels laggy or doubled
enforce-char-based-input = true

# Hide the soft keyboard when you scroll (reduces accidental input)
hide-soft-keyboard-on-scroll = true
```

---

### Extra Keys Row

The extra keys row is the strip of special keys above the keyboard (Ctrl, Alt, Tab, arrows, etc.). This is the most useful thing to customise.

```properties
# Format: rows separated by \n, keys inside [] separated by |
# Each key can be a label string or a special key name

# Simple row (one row of common keys):
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]

# Two rows:
extra-keys = [['ESC','TAB','CTRL','ALT','DEL','BKSP'],['UP','DOWN','LEFT','RIGHT','HOME','END']]

# Row with custom labels and special characters:
extra-keys = [['ESC','|','/','\\','~','[',']'],['CTRL','ALT','TAB','LEFT','DOWN','UP','RIGHT']]
```

**Available key names:**
`CTRL`, `ALT`, `SHIFT`, `FN`, `ESC`, `TAB`, `HOME`, `END`, `PGUP`, `PGDN`, `UP`, `DOWN`, `LEFT`, `RIGHT`, `DEL`, `BKSP`, `ENTER`, `BACKSLASH`, `SPACE`

---

### Shell Customisation — Switch to zsh

Termux uses bash by default. zsh (with oh-my-zsh) gives you better autocomplete, history search, and a more informative prompt.

**Step 1 — Install zsh:**
```bash
pkg install zsh
```

**Step 2 — Install oh-my-zsh (adds themes and plugins):**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
When it asks if you want to change your default shell, say **yes**.

**Step 3 — Verify zsh is your default:**
```bash
echo $SHELL
# Should show: /data/data/com.termux/files/usr/bin/zsh
```

**Step 4 — Switch manually any time:**
```bash
# Switch back to bash
bash

# Switch to zsh
zsh
```

**Useful zsh shortcuts once installed:**
- Type the start of a previous command → press **↑** to autocomplete from history
- Press **Tab** twice to see all options for any command
- `cd -` to jump to the previous directory

**Optional — Starship prompt (fast cross-shell prompt):**
```bash
# Install via cargo (requires rust to be installed)
cargo install starship

# Or via the install script
curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir $PREFIX/bin

# Add to ~/.zshrc or ~/.bashrc:
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```

---


## 15. AVcleaner Tool

**⚠️ ADVANCED/NICHE TOOL - Most users don't need this!**

### What is AVcleaner?

AVcleaner is a utility for removing/obfuscating antivirus signatures from APK files. 

**Use Cases:**
- Testing AV detection capabilities (security research)
- Legitimate app development testing
- Bypassing false positives (rare cases)

**⚠️ Warning:**
- This is a **controversial tool** with potential for misuse
- Using it to distribute malware is **illegal**
- Only use for **authorized security research** or **legitimate testing**
- Most users will never need this tool

### Installation (Optional)

```bash
# Clone repository
git clone https://github.com/RedQueen979/AVcleaner
cd AVcleaner

# Make executable
chmod +x AVcleaner.sh

# Create system-wide command (optional)
ln -s ~/AVcleaner/AVcleaner.sh $PREFIX/bin/clean

# Return to home
cd ~
```

### Usage

```bash
clean  # if you created the symlink
# or
~/AVcleaner/AVcleaner.sh
```

### When NOT to Use

❌ Don't use if you're just learning Termux  
❌ Don't use for distributing any applications  
❌ Don't use unless you understand APK structure and AV detection  
❌ Don't use without legitimate security research purpose  

**Alternative:** If you're getting false positives on your legitimate app, contact the AV vendor directly rather than obfuscating signatures.

---


## 16. Security Tools (USE RESPONSIBLY)

<details>
<summary><strong>⚠️ CLICK TO EXPAND - AUTHORIZED SECURITY TESTING ONLY ⚠️</strong></summary>

### 🚨 CRITICAL LEGAL AND ETHICAL WARNINGS 🚨

**READ THIS ENTIRE SECTION BEFORE PROCEEDING:**

This section documents security testing tools that are **ONLY** for:
- ✅ Authorized penetration testing with **written permission**
- ✅ Educational purposes in **controlled lab environments**
- ✅ Testing **your own systems** that you own
- ✅ Certified security professional training

**ILLEGAL USES - DO NOT:**
- ❌ Test any system without explicit written authorization
- ❌ Use phishing tools against real people
- ❌ Conduct unauthorized network scanning
- ❌ Attempt to access systems you don't own
- ❌ Distribute or use maliciously in any way

**CONSEQUENCES OF MISUSE:**
- Criminal charges under Computer Fraud and Abuse Act (CFAA)
- International cybercrime laws (equivalent in most countries)
- Civil lawsuits for damages
- Permanent criminal record
- Prison sentences (varies by jurisdiction)

**2026 COMMUNITY STANDARDS:**
Many security communities now discourage publicly listing certain tools (especially phishing frameworks) in beginner guides due to widespread misuse. This section is included for completeness but with extreme warnings.

---

### Phishing-Simulation Frameworks

**⚠️ MAXIMUM RISK CATEGORY - PHISHING AGAINST REAL PEOPLE IS A FEDERAL CRIME**

Phishing-simulation tools (credential-harvesting page generators) exist in the wild and show up on most "Termux tools" lists. This guide intentionally does **not** include install/run instructions for them — deploying one against anyone without a signed, scoped authorization is illegal, and even "just testing" against a real login page crosses that line instantly.

If you have a genuine, written, red-team engagement that calls for this category of tool, your engagement documentation or employer's toolkit is the appropriate source — not a general setup guide.

**Safer alternatives for learning phishing/social-engineering defense:**
- Use dedicated cybersecurity training platforms (TryHackMe, HackTheBox)
- Enroll in authorized security certification courses (CEH, OSCP)
- Practice in isolated virtual lab environments only
- Never test on production systems or real users

---

### Responsible Security Testing Guidelines

**Before using ANY security tool:**

1. **Get Written Permission**
   - From system owner
   - Specifying scope of testing
   - Defining allowed techniques
   - With clear time boundaries

2. **Use Proper Environment**
   - Isolated lab networks
   - Virtual machines
   - Test servers you own
   - Never on public/production systems

3. **Document Everything**
   - What tools you used
   - When and where you tested
   - Findings and recommendations
   - Maintain audit trail

4. **Report Responsibly**
   - Follow responsible disclosure practices
   - Give vendors time to patch vulnerabilities
   - Don't publish exploits publicly
   - Work through proper channels

---

### Alternative: Legitimate Security Learning

**Instead of using tools on real systems, consider:**

**Free Learning Platforms:**
- [TryHackMe](https://tryhackme.com) - Beginner-friendly labs
- [HackTheBox](https://hackthebox.com) - Advanced challenges
- [PentesterLab](https://pentesterlab.com) - Web app security
- [OverTheWire](https://overthewire.org) - CTF challenges

**Certifications:**
- CompTIA Security+
- Certified Ethical Hacker (CEH)
- Offensive Security Certified Professional (OSCP)
- GIAC Security Essentials (GSEC)

**Bug Bounty Programs (Legal):**
- [HackerOne](https://hackerone.com)
- [Bugcrowd](https://bugcrowd.com)
- [Synack](https://synack.com)
- Company-specific programs (Google, Facebook, etc.)

These provide **legal** ways to practice security skills with **permission** and potentially earn rewards.

</details>

---


## 17. Backup & Restore

### Create Backup Directory

```bash
# Create directory for backups in shared storage
mkdir -p ~/storage/shared/termux-backup
```

### Create Full Backup
```bash
# Backup both home and usr directories
tar -zcf ~/storage/shared/termux-backup/termux-backup-$(date +%Y%m%d_%H%M%S).tar.gz \
  -C /data/data/com.termux/files ./home ./usr
```

**Backup includes:**
- All installed packages (`./usr`)
- Your home directory files (`./home`)
- Configuration files

### 🆕 Backup Configuration Files Separately (Recommended 2026)

These files survive `pkg upgrade` but NOT full restores, so back them up separately:

```bash
# Backup appearance settings
cp ~/.termux/termux.properties ~/storage/shared/termux-backup/termux.properties.backup
cp ~/.termux/colors.properties ~/storage/shared/termux-backup/colors.properties.backup

# Backup font (if custom)
cp ~/.termux/font.ttf ~/storage/shared/termux-backup/font.ttf.backup 2>/dev/null

# Backup shell configuration
cp ~/.bashrc ~/storage/shared/termux-backup/bashrc.backup
cp ~/.bash_profile ~/storage/shared/termux-backup/bash_profile.backup 2>/dev/null

# Backup important scripts
tar -czf ~/storage/shared/termux-backup/scripts-$(date +%Y%m%d).tar.gz \
  ~/.termux/boot/ ~/.shortcuts/ 2>/dev/null
```

### Comprehensive Backup Script

```bash
# Save this as ~/backup-all.sh
cat > ~/backup-all.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
set -e

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR=~/storage/shared/termux-backup

mkdir -p "$BACKUP_DIR"

echo "Creating full system backup..."
tar -zcf "$BACKUP_DIR/termux-full-$DATE.tar.gz" \
  -C /data/data/com.termux/files ./home ./usr

echo "Backing up configuration files..."
mkdir -p "$BACKUP_DIR/config-$DATE"
[ -d ~/.termux ] && cp ~/.termux/*.properties "$BACKUP_DIR/config-$DATE/" 2>/dev/null
[ -d ~/.termux ] && cp ~/.termux/*.ttf "$BACKUP_DIR/config-$DATE/" 2>/dev/null
[ -f ~/.bashrc ] && cp ~/.bashrc "$BACKUP_DIR/config-$DATE/"
[ -f ~/.bash_profile ] && cp ~/.bash_profile "$BACKUP_DIR/config-$DATE/" 2>/dev/null

echo "Backing up boot scripts and shortcuts..."
scripts=()
[ -d ~/.termux/boot ] && scripts+=(~/.termux/boot)
[ -d ~/.shortcuts ] && scripts+=(~/.shortcuts)
if ((${#scripts[@]})); then
  tar -czf "$BACKUP_DIR/scripts-$DATE.tar.gz" "${scripts[@]}"
fi

echo "Backup completed: $BACKUP_DIR"
ls -lh "$BACKUP_DIR"/*"$DATE"*
EOF

chmod +x ~/backup-all.sh

# Run backup
~/backup-all.sh
```

### Restore from Backup

**Full System Restore:**
```bash
# ⚠️ WARNING: This will overwrite your current installation
tar -zxf ~/storage/shared/termux-backup/termux-backup-YYYYMMDD.tar.gz \
  -C /data/data/com.termux/files \
  --recursive-unlink \
  --preserve-permissions

# Clear history after restore
cat /dev/null > ~/.bash_history && history -c
```

**Restore Configuration Only:**
```bash
# Restore appearance settings
cp ~/storage/shared/termux-backup/termux.properties.backup ~/.termux/termux.properties
cp ~/storage/shared/termux-backup/colors.properties.backup ~/.termux/colors.properties

# Restart Termux to apply changes
exit
# Then reopen Termux
```

### Automated Backup (Optional)

**Create daily backup with Termux:Boot:**
```bash
mkdir -p ~/.termux/boot

cat > ~/.termux/boot/backup-daily << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
# Wait for system to settle
sleep 300  # 5 minutes

# Run backup
~/backup-all.sh

# Keep only last 7 days of backups
find ~/storage/shared/termux-backup/ -name "termux-full-*.tar.gz" -mtime +7 -delete
EOF

chmod +x ~/.termux/boot/backup-daily
```

---


## 18. Cleanup & Maintenance

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


## 19. Removal Commands (DANGEROUS)

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


## Resources

Everything below was scattered across six separate, heavily-overlapping "resources" sections in the original document (Official Resources, GitHub Repositories & Collections, Community & Support, Related Termux Apps, Learning Resources, GitHub Repositories & Resources, Additional Resources, Quick Links Reference). They're merged here into one place with duplicates removed.

### Official Documentation & Repositories

| Resource | Link | Purpose |
|----------|------|---------|
| Termux Wiki | https://wiki.termux.com | Official documentation |
| Termux.dev (official site) | https://termux.dev | Main website |
| GitHub Organization | https://github.com/termux | All official repos |
| Package Search | https://packages.termux.dev | Search packages |
| Package Registry (JSON/YAML/Markdown) | https://termux-packages.ajam.dev | Package metadata |
| **Main Repositories** | | |
| Termux App (main) | https://github.com/termux/termux-app | Core terminal app |
| Termux Packages | https://github.com/termux/termux-packages | Build scripts & packages |
| proot-distro | https://github.com/termux/proot-distro | Linux distro installer |
| **Add-on Apps** | | |
| Termux API | https://github.com/termux/termux-api | Android API access |
| Termux Boot | https://github.com/termux/termux-boot | Auto-run scripts on boot |
| Termux:Float | https://github.com/termux/termux-float | Floating window mode |
| Termux Styling | https://github.com/termux/termux-styling | Themes & fonts |
| Termux Widget | https://github.com/termux/termux-widget | Home screen shortcuts |
| Termux Tasker | https://github.com/termux/termux-tasker | Tasker integration |
| Termux X11 | https://github.com/termux/termux-x11 | X11 server for GUI |
| **Utilities & Tools** | | |
| Termux Shared | https://github.com/termux/termux-shared | Shared resources |
| Termux apt | https://github.com/termux/termux-apt | Package manager |
| Termux Services (runit supervisor) | https://github.com/termux/termux-services | Background service management |
| **Community & Documentation** | | |
| Termux Bootstrap | https://github.com/termux/termux-bootstrap | Bootstrap system files |
| Termux Package Management | https://github.com/termux/apt | APT package manager |

### Download Termux & Add-ons

**Main app:** [F-Droid](https://f-droid.org/packages/com.termux/) (recommended) or [GitHub Releases](https://github.com/termux/termux-app/releases). Avoid the Play Store build — see [Download & Installation](#download--installation).

| Add-on | Purpose | Source |
|--------|---------|--------|
| Termux:API | Access Android system features | [F-Droid](https://f-droid.org/packages/com.termux.api/) |
| Termux:Boot | Run scripts on device boot | [F-Droid](https://f-droid.org/packages/com.termux.boot/) |
| Termux:Float | Floating terminal window | [F-Droid](https://f-droid.org/packages/com.termux.window/) |
| Termux:Styling | Color schemes and fonts | [F-Droid](https://f-droid.org/packages/com.termux.styling/) |
| Termux:Widget | Home screen shortcuts | [F-Droid](https://f-droid.org/packages/com.termux.widget/) |
| Termux:Tasker | Tasker integration plugin | [F-Droid](https://f-droid.org/packages/com.termux.tasker/) |
| Termux:X11 | X11 server for GUI apps | [GitHub](https://github.com/termux/termux-x11/releases) (not on F-Droid) |

### Awesome Lists & Curated Collections

| Repository | Description |
|------------|-------------|
| [Awesome Termux](https://github.com/agnostic-apollo/Awesome-Termux) | Most comprehensive curated list of resources |
| [Awesome-Termux (T4P4N)](https://github.com/T4P4N/Awesome-Termux) | Bash scripts, wiki, articles, shells |
| [Awesome Termux (adrianogil)](https://github.com/adrianogil/awesome-termux) | General awesome list |
| [Awesome Termux Hacking](https://github.com/may215/awesome-termux-hacking) | Security tools collection |
| [All-in-one Termux Tools](https://github.com/DamnYatin/All-in-one-termux-tools) | Hacking tools compilation |
| [Termux Command Handbook](https://github.com/BlackTechX011/Termux-Command-Handbook) | Detailed command reference |

### Community-Maintained Termux Projects

| Project | Purpose | Repository |
|---------|---------|------------|
| oh-my-termux | Shell customization suite | https://github.com/4679/oh-my-termux |
| Termux-Monet | Material You color themes | https://github.com/HardcodedCat/termux-monet |
| Termux Style | Theme & font installer | https://github.com/adi1090x/termux-style |
| Termux Customization Scripts | Rapid setup scripts | https://github.com/remo-it/termux-customization |
| Termux Bare Setup | Minimal Termux config | https://github.com/andrinkov/termux-bare-setup |
| termux-ubuntu | Ubuntu desktop installer | https://github.com/MFDGaming/termux-ubuntu |
| Andronix | Multi-distro installer GUI | https://github.com/AndronixApp/AndronixOrigin |
| TermuxAlpine | Alpine Linux for Termux | https://github.com/TermuxAlpine/TermuxAlpine |
| Termux Fish Shell | Fish shell setup | https://github.com/fish-shell/fish-shell |
| agnostic-apollo tools | sudo/tudo/termux fixes | https://github.com/agnostic-apollo |
| TSU (Termux SuperUser) | Privilege escalation | https://github.com/cswl/tsu |

### Tool Installers

| Tool | Description |
|------|-------------|
| [AllHackingTools](https://github.com/mishakorzik/AllHackingTools) | All-in-one installer for 200+ tools |
| [Tool-X](https://github.com/rajkumardusad/Tool-X) | Installer for 370+ tools |
| [Lazymux](https://github.com/Gameye98/Lazymux) | Termux tool installer |

### Popular Tools by Category

**Security & Penetration Testing** *(industry-standard tools — see [Security Tools](#16-security-tools-use-responsibly) for legal/ethical context before using any of these)*:
[Metasploit](https://github.com/rapid7/metasploit-framework) · [Nmap](https://github.com/nmap/nmap) · [SQLMap](https://github.com/sqlmapproject/sqlmap) · [Social-Engineer Toolkit](https://github.com/trustedsec/social-engineer-toolkit) · [Ngrok](https://ngrok.com/) · [TBomb](https://github.com/TheSpeedX/TBomb) · [Seeker](https://github.com/thewhiteh4t/seeker) · [Zphisher](https://github.com/htr-tech/zphisher) (authorized use only)

**System & Root Tools:** [agnostic-apollo/sudo](https://github.com/agnostic-apollo/sudo) · [agnostic-apollo/tudo](https://github.com/agnostic-apollo/tudo) · [TSU](https://github.com/cswl/tsu)

**Development Tools:** [Code-Server](https://github.com/coder/code-server) (VS Code in browser) · [Jupyter Notebook](https://github.com/jupyter/notebook) · [Node.js](https://nodejs.org/)

**Customization:** [Termux-Monet](https://github.com/HardcodedCat/termux-monet) (Material You themes) · [Oh My Termux](https://github.com/4679/oh-my-termux) · [Termux-Style](https://github.com/adi1090x/termux-style)

**Media & Entertainment:** [yt-dlp](https://github.com/yt-dlp/yt-dlp) · [mpv](https://mpv.io/) · [ffmpeg](https://ffmpeg.org/) · [spotdl](https://github.com/spotDL/spotify-downloader)

### Linux Distributions in Termux

| Distribution | Source | Notes |
|---------------|--------|-------|
| Ubuntu | Built-in | `proot-distro install ubuntu` — see [Proot-Distro Ubuntu](#13-proot-distro-ubuntu) |
| Debian | Built-in | `proot-distro install debian` |
| Fedora | Built-in | `proot-distro install fedora` |
| Arch Linux | Built-in | `proot-distro install archlinux` |
| Andronix | [AndronixApp/AndronixOrigin](https://github.com/AndronixApp/AndronixOrigin) | Installer for multiple distros |
| TermuxAlpine | [TermuxAlpine/TermuxAlpine](https://github.com/TermuxAlpine/TermuxAlpine) | Alpine Linux installer |
| TermuxArch | [TermuxArch/TermuxArch](https://github.com/TermuxArch/TermuxArch) | Arch Linux installer |
| NetHunter | [Hax4us/Nethunter-In-Termux](https://github.com/Hax4us/Nethunter-In-Termux) | Kali NetHunter installer |

### GitHub Topic Collections

| Topic | Link |
|-------|------|
| termux | https://github.com/topics/termux |
| termux-guide | https://github.com/topics/termux-guide |
| termux-tools (by stars) | https://github.com/topics/termux-tools?o=desc&s=stars |
| termux-tool | https://github.com/topics/termux-tool |
| termux-commands | https://github.com/topics/termux-commands |
| termux-environment (by stars) | https://github.com/topics/termux-environment?o=desc&s=stars |
| termux-proot | https://github.com/topics/termux-proot |
| termux-style | https://github.com/topics/termux-style |
| termux-book | https://github.com/topics/termux-book |
| termux-hacking | https://github.com/topics/termux-hacking |
| termux-recommended-for-android | https://github.com/topics/termux-recommended-for-android |
| awesome-termux | https://github.com/topics/awesome-termux |

### Learning Resources

**Documentation & guides:**
- [Termux Cheat Sheet](https://wiki.termux.com/wiki/Termux-cheat-sheet) — quick reference
- [Package Management Wiki](https://wiki.termux.com/wiki/Package_Management) — package management guide
- [Termux Packages Wiki](https://github.com/termux/termux-packages/wiki) — for developers/packagers
- Browse the [termux-book topic](https://github.com/topics/termux-book) for longer-form learning material

**Blogs & articles:**
- [Termux.dev Blog](https://termux.dev/blog/) — official blog
- [Linux On Android](https://linuxonandroid.com)
- [Android Central — Termux](https://www.androidcentral.com/termux)
- [Medium — Termux tag](https://medium.com/tag/termux)

**Video:** the original guide listed "Hacker's Hub," "Termux Lab," and "Dev Empty" as YouTube channels with no links — they couldn't be verified, so they've been dropped rather than carried forward as unverified recommendations. [Tech Raj](https://www.youtube.com/channel/UCY7t-zBYtdj6ZgiRpi3WIYg) is confirmed active and covers Termux/Android. Worth just searching YouTube directly for current creators, since this space turns over quickly.

### Community & Support

**Discussion:** [Reddit r/termux](https://reddit.com/r/termux) · [GitHub Discussions](https://github.com/termux/termux-app/discussions) · [Gitter Chat](https://gitter.im/termux/termux) · [Discord](https://discord.gg/termux) · [Telegram](https://t.me/termux) · [XDA Forums](https://forum.xda-developers.com/search/?q=termux)

**Report issues:** [Termux App issues](https://github.com/termux/termux-app/issues) · [Termux Packages issues](https://github.com/termux/termux-packages/issues)

### Contributing Back

If you build a useful Termux tool or guide of your own:
```bash
# Explore what's out there
git clone https://github.com/username/repo-name
gh repo view owner/repo --web
```
- Tag your repo with `termux`, `termux-tool`, `termux-guide`, etc. so it surfaces in the topic collections above
- Write clear documentation and consider sharing it on r/termux

---


## Troubleshooting

### Packages Won't Install
```bash
# Reset repository mirrors
termux-change-repo

# Force update
pkg update --force

# Fix broken packages
pkg upgrade -y
dpkg --configure -a
```

### Storage Permission Issues
```bash
# Re-run storage setup
termux-setup-storage

# Check permissions in Android Settings:
# Settings → Apps → Termux → Permissions → Storage
```

### "Command not found" Errors
```bash
# Reload environment
source ~/.bashrc

# Or create new shell session
exit
# Then reopen Termux
```

### Environment Is Badly Broken (Reset Without Reinstalling)
```bash
# Restore Termux's default shell profile and environment files
# without wiping your packages or home directory
termux-reset
```
**Note:** `termux-reset` rewrites configuration files under `$PREFIX/etc` and your shell startup files back to defaults. Back up any customized dotfiles (`.bashrc`, `.vimrc`, etc.) first — see [Backup & Restore](#17-backup--restore).

---


## Frequently Asked Questions (FAQ)

### General Questions

**Q: Do I need root access to use Termux?**  
A: No, Termux works perfectly without root. However, some advanced features (like low-level system access) require root.

**Q: Can I run Linux GUI applications?**  
A: Yes, using VNC or Termux:X11. However, GUI apps can be slow on mobile devices.

**Q: Is Termux legal to use?**  
A: Yes, Termux itself is completely legal. However, using certain tools (like hacking tools) without authorization is illegal.

**Q: Why should I avoid the Play Store version?**  
A: The Play Store version is outdated and no longer maintained. Always use F-Droid or GitHub releases.

**Q: How much storage does Termux need?**  
A: Basic installation: ~50MB. With common packages: 200-500MB. Full desktop environment: 2-4GB+.

### Installation & Setup

**Q: How do I grant storage permission?**  
A: Run `termux-setup-storage` and allow the permission prompt.

**Q: Can I access my phone's files from Termux?**  
A: Yes, after running `termux-setup-storage`, use `~/storage/shared` to access internal storage.

**Q: How do I update all packages?**  
A: Run `pkg update && pkg upgrade -y`

**Q: What's the difference between pkg and apt?**  
A: `pkg` is a wrapper around `apt` with better defaults. Both work, but `pkg` is recommended.

### Troubleshooting

**Q: Package installation fails with "Unable to locate package"**  
A: Run `pkg update` first to refresh the package list.

**Q: Command not found after installing a package**  
A: Restart Termux or run `source ~/.bashrc`

**Q: Termux keeps getting killed in the background**  
A: Disable battery optimization for Termux in Android Settings → Apps → Termux → Battery.

**Q: How do I fix broken packages?**  
A: Run `dpkg --configure -a` and then `pkg upgrade -y`

**Q: Storage permission denied**  
A: Re-run `termux-setup-storage` and check Android Settings → Apps → Termux → Permissions.

### Advanced Usage

**Q: Can I run Docker in Termux?**  
A: Not directly. Docker requires kernel-level features. Use proot-distro instead for containers.

**Q: How do I get a desktop environment?**  
A: Install VNC server and a lightweight desktop (XFCE recommended). See [VNC Server Setup](#12-vnc-server-setup).

**Q: Can I use Termux as an SSH server?**  
A: Yes! Install openssh with `pkg install openssh` and run `sshd`.

**Q: How do I backup Termux?**  
A: See the [Backup & Restore](#17-backup--restore) section for detailed instructions.

**Q: Can I run Windows programs?**  
A: Not directly. You can try Wine, but compatibility is limited on ARM devices.

### Development

**Q: Can I do Python development in Termux?**  
A: Absolutely! Termux fully supports Python, pip, and virtual environments.

**Q: Does Node.js work in Termux?**  
A: Yes, Node.js works perfectly. Install with `pkg install nodejs`.

**Q: Can I compile C/C++ code?**  
A: Yes, install clang with `pkg install clang` and compile normally.

**Q: Is there an IDE for Termux?**  
A: Use vim, neovim, nano, or install code-server for VS Code in your browser.

### Security & Privacy

**Q: Is it safe to install hacking tools?**  
A: The tools themselves are legal for educational and authorized testing. Using them maliciously is illegal.

**Q: Can others access my Termux if I run an SSH server?**  
A: Only if you expose it to the network. By default, SSH runs on localhost only. Always use strong passwords and SSH keys.

**Q: How do I secure my Termux installation?**  
A: See [Security Best Practices](#14-security-best-practices) section.

### Performance

**Q: Why is Termux slow?**  
A: Could be due to: old device, low RAM, battery optimization, or heavy packages. Try lighter alternatives.

**Q: Can I increase Termux performance?**  
A: Yes, see [Performance Optimization](#8-performance-optimization) for tips including swap files and process management.

**Q: Desktop environments are too slow, what should I do?**  
A: Use command-line tools instead, or try a minimal window manager like openbox instead of full desktop environments.

---


## 📝 Notes

- **Exit commands:** The original script used `exit` after every command block. These have been preserved but can be removed for continuous operation.
- **Battery optimization:** Disable battery optimization for Termux in Android settings to prevent background process termination.
- **F-Droid vs Play Store:** Always use Termux from F-Droid or GitHub. The Play Store version is outdated and deprecated.
- **Google Play versions (2026):** Builds like `googleplay.2026.01.07` are heavily restricted to comply with Play Store policies. F-Droid/GitHub versions have full functionality.
- **Root access:** Not required for any of these commands. Use `tsu` for root operations only if you have a rooted device.
- **Version managers:** Modern approach (2026) recommends using `mise`, `asdf`, or `uv` for managing multiple language versions instead of installing them all system-wide.
- **Configuration persistence:** `~/.termux/termux.properties` and `~/.termux/colors.properties` should be backed up separately as they define your appearance settings.

---

**Last Updated:** June 2026  
**Termux Stable Version:** 0.118.3 (May 2025)  
**Termux Beta Version:** 0.119.0-beta.3 (May-June 2025)  
**Bootstrap:** 2026.01.11-r1 and newer  
**Android Compatibility:** 7.0+ (API 24+)  
**Recommended Source:** F-Droid or GitHub Releases

---


## 🙏 Credits & Contributing

**Guide maintained by:** Community contributors  
**Based on:** Official Termux documentation and community best practices  
**Contributions:** Pull requests welcome

**Special thanks to:**
- Termux development team
- agnostic-apollo (Awesome Termux list)
- All tool developers and maintainers
- Termux community on Reddit and GitHub

---


## 📄 License

This guide is provided as-is for educational purposes. Individual tools and packages mentioned have their own licenses.

**Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)** — see [LICENSE.md](LICENSE.md). Feel free to share and adapt with attribution, as long as derivatives are shared under the same license.

---

<div align="center">

**🌟 Found this helpful? Star the repository! 🌟**

[![GitHub](https://img.shields.io/badge/GitHub-Termux-181717?style=for-the-badge&logo=github)](https://github.com/termux)
[![Reddit](https://img.shields.io/badge/Reddit-r%2Ftermux-FF4500?style=for-the-badge&logo=reddit&logoColor=white)](https://reddit.com/r/termux)
[![Wiki](https://img.shields.io/badge/Wiki-Documentation-blue?style=for-the-badge)](https://wiki.termux.com)

</div>
