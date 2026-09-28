# Resources

## Official Documentation & Repositories

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
| Termux apt | https://github.com/termux/termux-apt-repo | Package manager |
| Termux Services (runit supervisor) | https://github.com/termux/termux-services | Background service management |
| **Community & Documentation** | | |
| Termux Bootstrap | https://github.com/termux/termux-bootstrap | Bootstrap system files |
| Termux Package Management | https://github.com/termux/termux-packages/wiki/Package-Management | APT package manager |

## Download Termux & Add-ons

**Main app:** [F-Droid](https://f-droid.org/packages/com.termux/) (recommended) or [GitHub Releases](https://github.com/termux/termux-app/releases). Avoid the Play Store build — see [Download & Installation](../setup/installation.md#download--installation).

| Add-on | Purpose | Source |
|--------|---------|--------|
| Termux:API | Access Android system features | [F-Droid](https://f-droid.org/packages/com.termux.api/) |
| Termux:Boot | Run scripts on device boot | [F-Droid](https://f-droid.org/packages/com.termux.boot/) |
| Termux:Float | Floating terminal window | [F-Droid](https://f-droid.org/packages/com.termux.window/) |
| Termux:Styling | Color schemes and fonts | [F-Droid](https://f-droid.org/packages/com.termux.styling/) |
| Termux:Widget | Home screen shortcuts | [F-Droid](https://f-droid.org/packages/com.termux.widget/) |
| Termux:Tasker | Tasker integration plugin | [F-Droid](https://f-droid.org/packages/com.termux.tasker/) |
| Termux:X11 | X11 server for GUI apps | [GitHub](https://github.com/termux/termux-x11/releases) (not on F-Droid) |

## Newer Official & Related Projects

| Resource | Link | Purpose |
|----------|------|---------|
| Termux Play Store build | https://github.com/termux-play-store/termux-apps/releases | Separately maintained Google Play build and changelog |
| glibc-packages | https://github.com/termux/glibc-packages | `glibc-repo` / `glibc-runner` for glibc binaries |
| termux-gui-package | https://github.com/tareksander/termux-gui-package | Tools built on Termux:GUI |
| Termux Mirrors wiki | https://github.com/termux/termux-packages/wiki/Mirrors | Known mirrors and how `pkg` selects them |
| Termux bootstrap releases | https://github.com/termux/termux-packages/releases | Bootstrap archives (`apt.android-7`) |
| termux-desktop | https://github.com/sabamdarif/termux-desktop | Desktop environment installer using Termux:X11; includes a phantom-process guide |

## Awesome Lists & Curated Collections

| Repository | Description |
|------------|-------------|
| [Awesome Termux](https://github.com/agnostic-apollo/Awesome-Termux) | Most comprehensive curated list of resources |
| [Awesome-Termux (T4P4N)](https://github.com/T4P4N/Awesome-Termux) | Bash scripts, wiki, articles, shells |
| [Awesome Termux (adrianogil)](https://github.com/adrianogil/awesome-termux) | General awesome list |
| [Awesome Termux Hacking](https://github.com/may215/awesome-termux-hacking) | Security tools collection |
| [All-in-one Termux Tools](https://github.com/DamnYatin/All-in-one-termux-tools) | Hacking tools compilation |
| [Termux Command Handbook](https://github.com/BlackTechX011/Termux-Command-Handbook) | Detailed command reference |

## Community-Maintained Termux Projects

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

## Tool Installers

| Tool | Description |
|------|-------------|
| [AllHackingTools](https://github.com/mishakorzik/AllHackingTools) | All-in-one installer for 200+ tools |
| [Tool-X](https://github.com/rajkumardusad/Tool-X) | Installer for 370+ tools |
| [Lazymux](https://github.com/Gameye98/Lazymux) | Termux tool installer |

## Popular Tools by Category

**Security & Penetration Testing** *(industry-standard tools — see [Security Tools](../advanced-workflows/security/security-tools.md) for legal/ethical context before using any of these)*:
[Metasploit](https://github.com/rapid7/metasploit-framework) · [Nmap](https://github.com/nmap/nmap) · [SQLMap](https://github.com/sqlmapproject/sqlmap) · [Social-Engineer Toolkit](https://github.com/trustedsec/social-engineer-toolkit) · [Ngrok](https://ngrok.com/) · [TBomb](https://github.com/TheSpeedX/TBomb) · [Seeker](https://github.com/thewhiteh4t/seeker) · [Zphisher](https://github.com/htr-tech/zphisher) (authorized use only)

**System & Root Tools:** [agnostic-apollo/sudo](https://github.com/agnostic-apollo/sudo) · [agnostic-apollo/tudo](https://github.com/agnostic-apollo/tudo) · [TSU](https://github.com/cswl/tsu)

**Development Tools:** [Code-Server](https://github.com/coder/code-server) (VS Code in browser) · [Jupyter Notebook](https://github.com/jupyter/notebook) · [Node.js](https://nodejs.org/)

**Customization:** [Termux-Monet](https://github.com/HardcodedCat/termux-monet) (Material You themes) · [Oh My Termux](https://github.com/4679/oh-my-termux) · [Termux-Style](https://github.com/adi1090x/termux-style)

**Media & Entertainment:** [yt-dlp](https://github.com/yt-dlp/yt-dlp) · [mpv](https://mpv.io/) · [ffmpeg](https://ffmpeg.org/) · [spotdl](https://github.com/spotDL/spotify-downloader)

## Linux Distributions in Termux

| Distribution | Source | Notes |
|---------------|--------|-------|
| Ubuntu | Built-in | `proot-distro install ubuntu` — see [Proot-Distro Ubuntu](../advanced-workflows/proot/ubuntu.md) |
| Debian | Built-in | `proot-distro install debian` |
| Fedora | Built-in | `proot-distro install fedora` |
| Arch Linux | Built-in | `proot-distro install archlinux` |
| Andronix | [AndronixApp/AndronixOrigin](https://github.com/AndronixApp/AndronixOrigin) | Installer for multiple distros |
| TermuxAlpine | [TermuxAlpine/TermuxAlpine](https://github.com/TermuxAlpine/TermuxAlpine) | Alpine Linux installer |
| TermuxArch | [TermuxArch/TermuxArch](https://github.com/TermuxArch/TermuxArch) | Arch Linux installer |
| NetHunter | [Hax4us/Nethunter-In-Termux](https://github.com/Hax4us/Nethunter-In-Termux) | Kali NetHunter installer |

## GitHub Topic Collections

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

## Learning Resources

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

**Video:** [Tech Raj](https://www.youtube.com/channel/UCY7t-zBYtdj6ZgiRpi3WIYg) covers Termux and Android. Searching YouTube directly for current creators is worthwhile, since this space turns over quickly.

## Community & Support

**Discussion:** [Reddit r/termux](https://reddit.com/r/termux) · [GitHub Discussions](https://github.com/termux/termux-app/discussions) · [Gitter Chat](https://gitter.im/termux/termux) · [Discord](https://discord.gg/termux) · [Telegram](https://t.me/termux) · [XDA Forums](https://forum.xda-developers.com/search/?q=termux)

**Report issues:** [Termux App issues](https://github.com/termux/termux-app/issues) · [Termux Packages issues](https://github.com/termux/termux-packages/issues)

## Contributing Back

If you build a useful Termux tool or guide of your own:
```bash
# Explore what's out there
git clone https://github.com/username/repo-name
gh repo view owner/repo --web
```
- Tag your repo with `termux`, `termux-tool`, `termux-guide`, etc. so it surfaces in the topic collections above
- Write clear documentation and consider sharing it on r/termux

---
