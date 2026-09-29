# Frequently Asked Questions (FAQ)

## General Questions

**Q: Do I need root access to use Termux?**  
A: No, Termux works perfectly without root. However, some advanced features (like low-level system access) require root.

**Q: Can I run Linux GUI applications?**  
A: Yes, using VNC or Termux:X11. However, GUI apps can be slow on mobile devices.

**Q: Is Termux legal to use?**  
A: Yes, Termux itself is completely legal. However, using certain tools (like hacking tools) without authorization is illegal.

**Q: Why should I avoid the Play Store version?**  
A: Use F-Droid or GitHub for stable releases. The Play Store build is a separate experimental branch with restrictions and missing functionality.

**Q: How much storage does Termux need?**  
A: Basic installation: ~50MB. With common packages: 200-500MB. Full desktop environment: 2-4GB+.

## Installation & Setup

**Q: How do I grant storage permission?**  
A: Run `termux-setup-storage` and allow the permission prompt.

**Q: Can I access my phone's files from Termux?**  
A: Yes, after running `termux-setup-storage`, use `~/storage/shared` to access internal storage.

**Q: How do I update all packages?**  
A: Run `pkg update && pkg upgrade -y`

**Q: What's the difference between pkg and apt?**  
A: `pkg` is a wrapper around `apt` with better defaults. Both work, but `pkg` is recommended.

## Troubleshooting

**Q: Package installation fails with "Unable to locate package"**  
A: Run `pkg update` first to refresh the package list.

**Q: Command not found after installing a package**  
A: Restart Termux or run `source ~/.bashrc`

**Q: Termux keeps getting killed in the background**  
A: Disable battery optimization for Termux in Android Settings → Apps → Termux → Battery. If child processes are killed by the phantom-process limit, also see the [Android 14+ phantom-process guidance](../development/android/adb.md#quick-fix-on-android-14-and-newer-no-adb).

**Q: How do I fix broken packages?**  
A: Run `dpkg --configure -a` and then `pkg upgrade -y`

**Q: Storage permission denied**  
A: Re-run `termux-setup-storage` and check Android Settings → Apps → Termux → Permissions.

## Advanced Usage

**Q: Can I run Docker in Termux?**  
A: Not directly. Docker requires kernel-level features. Use proot-distro instead for containers.

**Q: How do I get a desktop environment?**  
A: Install VNC server and a lightweight desktop (XFCE recommended). See [VNC Server Setup](../advanced-workflows/desktop-gui.md).

**Q: Can I use Termux as an SSH server?**  
A: Yes! Install openssh with `pkg install openssh` and run `sshd`.

**Q: How do I backup Termux?**  
A: See the [Backup & Restore](../advanced-workflows/security/backups.md) section for detailed instructions.

**Q: Can I run Windows programs?**  
A: Not directly. You can try Wine, but compatibility is limited on ARM devices.

## Development

**Q: Can I do Python development in Termux?**  
A: Absolutely! Termux fully supports Python, pip, and virtual environments.

**Q: Does Node.js work in Termux?**  
A: Yes, Node.js works perfectly. Install with `pkg install nodejs`.

**Q: Can I compile C/C++ code?**  
A: Yes, install clang with `pkg install clang` and compile normally.

**Q: Is there an IDE for Termux?**  
A: Use vim, neovim, nano, or install code-server for VS Code in your browser.

## Security & Privacy

**Q: Is it safe to install hacking tools?**  
A: The tools themselves are legal for educational and authorized testing. Using them maliciously is illegal.

**Q: Can others access my Termux if I run an SSH server?**  
A: SSH may be reachable on network interfaces unless you explicitly restrict it. For local-only access, configure `ListenAddress 127.0.0.1` (and optionally `ListenAddress ::1` for IPv6 loopback) in `$PREFIX/etc/ssh/sshd_config`, remove any non-loopback `ListenAddress` entries, and restart `sshd`. Always use strong passwords and SSH keys.

**Q: How do I secure my Termux installation?**  
A: See [Security Best Practices](../advanced-workflows/security/ssh-security.md) section.

## Performance

**Q: Why is Termux slow?**  
A: Could be due to: old device, low RAM, battery optimization, or heavy packages. Try lighter alternatives.

**Q: Can I increase Termux performance?**  
A: Yes, see [Performance Optimization](../advanced-workflows/background-processes.md) for tips including swap files and process management.

**Q: Desktop environments are too slow, what should I do?**  
A: Use command-line tools instead, or try a minimal window manager like openbox instead of full desktop environments.

---
