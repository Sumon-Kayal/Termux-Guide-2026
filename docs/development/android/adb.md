# ADB & Android 12+ Phantom Process Fix

## 🆕 Android 12+ Phantom Process Killing Fix

**What is this?**
Android 12 and newer silently kills background processes started by Termux after a while. This means your running servers, Python scripts, and compilation jobs can die without any error message. This is one of the most common reasons things "randomly stop working" in Termux on modern phones.

**How do you know you're affected?**
- You're on Android 12, 12L, 13, 14, 15 or 16
- The terminal shows `[Process completed (signal 9) - press Enter]`
- Running servers (sshd, gitea, nginx) stop on their own
- Long scripts die partway through for no reason
- `termux-wake-lock` doesn't help (it only prevents CPU sleep, not this)


### Quick fix on Android 14 and newer (no ADB)

Android 14 added a Developer Options toggle:

1. Enable Developer Options (Settings → About Phone → tap Build Number 7 times).
2. Open Developer Options and turn on **Disable child process restrictions**.
3. Reboot if the change does not apply.

Keep Developer Options enabled: turning them off re-enables phantom process killing. Some ROMs (for example Wear OS 6.1 on the Pixel Watch 4) do not show this toggle; use the ADB method below there.

### ADB method (Android 12, 12L, 13, or when the toggle is missing)

**The fix — do this once and it survives reboots:**

You don't need a PC. Android 11+ lets you use ADB wirelessly from Termux itself.

> **⚠️ Warning:** This uses a debug command (`set_sync_disabled_for_tests`) that disables Android's configuration sync. If you have issues after a system update or want to restore normal behavior, run:
> `adb shell "/system/bin/device_config set_sync_disabled_for_tests none"`

**Step 1 — Enable Developer Options on your phone:**
1. Open **Settings** → **About Phone**
2. Tap **Build Number** 7 times quickly
3. You'll see "You are now a developer!" — that's the confirmation

**Step 2 — Install ADB in Termux and turn on Wireless debugging:**
```bash
pkg install android-tools
```
In Developer Options, enable **Wireless debugging**. Use split-screen so Termux and the Wireless debugging screen are visible together.

**Step 3 — Pair and connect (the pairing port differs from the connection port):**
```bash
# Pair: use the IP:port and code from "Pair device with pairing code"
adb pair localhost:PAIR_PORT PAIRING_CODE

# Connect: use the IP:port shown on the main Wireless debugging screen
adb connect localhost:CONNECT_PORT
```

**Step 4 — Disable phantom process monitoring:**
```bash
# Android 12L and above
adb shell "settings put global settings_enable_monitor_phantom_procs false"

# Android 12 (and to raise the 32-process limit on any version)
adb shell "/system/bin/device_config set_sync_disabled_for_tests persistent"
adb shell "/system/bin/device_config put activity_manager max_phantom_processes 2147483647"
```
Reboot if it does not take effect. On rooted devices the same commands work with `su -c`.

> **Battery note:** disabling these limits can let stray background processes drain the battery. Re-enable with `adb shell "settings put global settings_enable_monitor_phantom_procs true"`.
