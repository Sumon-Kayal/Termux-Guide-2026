# Installation

## 📌 Version & Compatibility Notice (updated September 2026)

### Current Termux Versions
- **Stable:** 0.118.3 (May 2025) - Recommended for most users
- **Beta:** 0.119.0-beta.3 (May-June 2025) - For testing new features
- **Google Play:** googleplay.2026.06.21 (latest at time of writing; earlier 2026.01.07 and 2026.02.11) - **NOT RECOMMENDED** (restricted to comply with Play Store policies); see [Google Play build](#google-play-build-2026-changes) below
- **Pre-release status:** no newer stable than 0.118.3 has been published; 0.119.0-beta.3 is still the newest 0.119 pre-release listed on GitHub

### ⚠️ Important Updates & Changes

**Package Mirrors (2025-2026):**
- Modern default mirrors: Cloudflare and Hetzner (more stable than older mirrors)
- Bootstrap files: Now tagged as `bootstrap-2026.01.11-r1` and newer; newest seen at time of writing is `bootstrap-2026.08.30-r1+apt.android-7`
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
- See both methods in [VNC Server Setup](../advanced-workflows/desktop-gui.md) and [Proot-Distro Ubuntu](../advanced-workflows/proot/ubuntu.md)

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


### Google Play build (2026 changes)

The Play Store build is published separately from the F-Droid/GitHub app, in the [termux-play-store/termux-apps](https://github.com/termux-play-store/termux-apps/releases) repository. Recent releases changed what it can do:

- **Built-in Termux API methods:** many `termux-*` commands work without installing the Termux:API app. Available built-in since earlier builds: `termux-clipboard-*`, `termux-download`, `termux-saf-*`, `termux-share`, `termux-storage-get`, `termux-usb`, `termux-vibrate`, `termux-volume`, and (since 2024.08.29) `termux-audio-info`, `termux-battery-status`, `termux-dialog`, `termux-keystore`, `termux-toast`.
- **Added in googleplay.2026.02.11:** `termux-camera-info`, `termux-job-scheduler`, `termux-media-player`, `termux-microphone-record`, `termux-notification` (plus channel, list, remove), `termux-speech-to-text`, `termux-tts-engines`, `termux-tts-speak`.
- **Termux:Boot and Termux:Widget** are integrated into the main Play Store app (since googleplay.2024.10.24), so they are not separate installs there.
- Bootstrap packages are bumped in each release (latest: googleplay.2026.06.21).

The F-Droid and GitHub builds are still the recommended sources for full functionality. Do not mix installs from different sources; uninstall Termux and all its plugin apps before switching. Termux packages require Android 7.0 or higher (Android 5/6 uses the separate `apt-android-5` build, with no package updates planned).

### Package repositories

- The old `unstable-packages`, `game-packages` and `science-packages` channels have been merged into the main repository, so no extra repo package is needed for them.
- Extra repos that are still separate: `root-repo`, `x11-repo`, and the user-maintained `tur-repo`.
- **glibc packages:** install `glibc-repo`, then `glibc-runner`, to run glibc-linked binaries without proot:

```bash
pkg install glibc-repo
pkg install glibc-runner
```

- Mirrors are listed in the [Termux Mirrors wiki page](https://github.com/termux/termux-packages/wiki/Mirrors); the primary server moved from FossHost to Hetzner in December 2022, and `pkg` picks among mirrors at random unless `termux-change-repo` restricts it to one group.

### Termux:GUI

Termux:GUI lets Termux programs draw native Android UI (dialogs, file pickers, small windows). It does not run X11/Wayland apps; use Termux:X11 for those. The companion `termux-gui-package` provides tools built on it:

```bash
pkg install termux-gui-package
```

It includes `termux-gui-dialog`, `termux-gui-files`, `termux-gui-view`, `termux-gui-pkg` (graphical `pkg` frontend), `termux-gui-proot-distro` and `termux-gui-dmenu`. It needs Python and the Termux:GUI Python bindings.

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

The Play Store version of Termux is **restricted and not recommended**. It is maintained as a separate experimental branch and may have compatibility issues. Use F-Droid or GitHub for stable releases.

---
