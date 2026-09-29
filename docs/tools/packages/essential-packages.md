# Essential Packages

## Essential Tools
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

- **`termux-api`** - Follow the [build-specific Termux:API setup](../termux-api.md) for companion-app requirements, matching signing-key sources, and Google Play’s built-in methods.

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
