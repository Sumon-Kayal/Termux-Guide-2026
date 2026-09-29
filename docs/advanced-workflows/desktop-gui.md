# Desktop GUI (Termux:X11 & VNC)

## 🆕 Modern Approach (2026): Termux:X11 (Recommended)

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

## Traditional Approach: VNC Server

VNC is still useful for remote access or if Termux:X11 doesn't work on your device.

### Install VNC Server

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

### Configure VNC

```bash
# Set VNC password
vncserver

# This creates ~/.vnc directory and asks for password
# Enter a password (6-8 characters)
```

### Start VNC Server

```bash
# Start VNC server
vncserver -localhost

# Note the display number, usually :1
```

### Connect from Android

**Install VNC Viewer on Android:**
1. Install "VNC Viewer" from Play Store
2. Create new connection:
   - Address: `localhost:5901` (5900 + display number)
   - Name: Termux VNC

### Create Start/Stop Scripts

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

### Usage

```bash
# Start VNC server
~/start-vnc

# Open VNC Viewer app on Android
# Connect to localhost:5901

# Stop VNC server when done
~/stop-vnc
```

### VNC with XFCE Desktop

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

### Troubleshooting VNC

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

## Performance Comparison (2026)

| Method | Performance | Remote Access | Setup Difficulty |
|--------|-------------|---------------|------------------|
| **Termux:X11** | ⚡⚡⚡ Excellent | ❌ Local only | 🔧 Medium |
| **VNC** | ⚡⚡ Good | ✅ Yes | 🔧 Easy |
| **No GUI** | ⚡⚡⚡⚡ Best | ✅ SSH | 🔧 Easy |

**Recommendation:** Use Termux:X11 for local GUI apps, VNC for remote access, or command-line for best performance.

---
