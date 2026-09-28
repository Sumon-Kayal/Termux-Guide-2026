# Background Processes

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

## Termux:Boot Setup

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
termux-wake-lock
trap 'termux-wake-unlock' EXIT
sleep 60  # Wait for system to fully boot
tar -czf ~/storage/downloads/auto-backup-$(date +%Y%m%d).tar.gz ~/important-files/
EOF

chmod +x ~/.termux/boot/backup
```

The backup acquires a wake lock before waiting and running `tar`, so it can continue while the device sleeps. The exit trap releases it when the job finishes, including if the backup fails.

**Test boot scripts:**
```bash
# Run manually to test
~/.termux/boot/start-sshd
```

---

## termux-services — Auto-Restart Background Services

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
# Keep the CPU awake while the service runs
termux-wake-lock

# Enable sshd so it starts automatically and restarts if it crashes
sv-enable sshd

# You should see the service start immediately
```

### Step 4 — Manage services

```bash
# Check if a service is running
sv status sshd
# Output example: run: sshd: (pid 1234) 42s; run: log: (pid 1235) 42s

# Stop a service and release the wake lock when no other jobs need it
sv down sshd
termux-wake-unlock

# Start it again with a wake lock
termux-wake-lock
sv up sshd

# Restart it
sv restart sshd

# Disable permanently (won't start on boot anymore)
sv-disable sshd
termux-wake-unlock
```

Keep the wake lock while long-running services need to execute during device sleep, and release it after stopping them. The wake lock is shared by Termux jobs: only call `termux-wake-unlock` when no other service or backup needs it. If boot services run alongside the backup example, let the service lifecycle manage the lock and omit the backup’s unlock trap. Reacquire the lock when starting services after a reboot.

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

# 4. Acquire a wake lock and enable it
termux-wake-lock
sv-enable myserver

# 5. Check it's running
sv status myserver
```

> **Important:** Use `exec` (not just the command) in your run script. This makes runit properly track the process so it can restart it cleanly.
>
> **Note:** This example binds to localhost (127.0.0.1) only, making it accessible only from your device. This is appropriate for local testing and development.

---

## tmux — Keep Sessions Alive

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
