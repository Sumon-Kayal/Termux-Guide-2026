# Proot-Distro Ubuntu

Run a full Ubuntu environment inside Termux (no root required).

## Install Ubuntu
```bash
proot-distro install ubuntu
```

**Installation location:**
```
$PREFIX/var/lib/proot-distro/containers/ubuntu/rootfs/
```

## Login to Ubuntu
```bash
proot-distro login ubuntu
```

## Ubuntu Initial Setup
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

## Desktop Environment (Optional)

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

## QEMU Support (Optional)
```bash
apt-get install qemu-system-aarch64 -y
```

## Exit Ubuntu
```bash
cat /dev/null > ~/.bash_history && history -c
unset HISTFILE
exit
```

Back in Termux, optionally install QEMU utilities:

```bash
pkg install qemu-utils -y
```

---
