# Backup & Restore

## Create Backup Directory

```bash
# Create directory for backups in shared storage
mkdir -p ~/storage/shared/termux-backup
```

## Create Full Backup
```bash
# Backup both home and usr directories
tar -zcf ~/storage/shared/termux-backup/termux-backup-$(date +%Y%m%d_%H%M%S).tar.gz \
  -C /data/data/com.termux/files ./home ./usr
```

**Backup includes:**
- All installed packages (`./usr`)
- Your home directory files (`./home`)
- Configuration files

## 🆕 Backup Configuration Files Separately (Recommended 2026)

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

## Comprehensive Backup Script

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

## Restore from Backup

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

## Automated Backup (Optional)

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

## Backup Encryption

```bash
# Create encrypted backup
tar -czf - ~/important-files/ | \
  gpg -c > ~/storage/downloads/backup-$(date +%Y%m%d).tar.gz.gpg

# Restore encrypted backup
gpg -d ~/storage/downloads/backup-20260129.tar.gz.gpg | \
  tar -xzf - -C ~/
```

## Shell History Hygiene

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
