# Storage & File Management

## Accessing Android Storage

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

## Create Symbolic Links

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

## File Operations

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

## File Sharing Between Termux and Android

```bash
# Make a file accessible to Android apps
cp document.pdf ~/storage/downloads/

# Access file shared by Android app
cat ~/storage/downloads/shared-file.txt

# Edit file with Android editor, then process in Termux
vim ~/storage/downloads/document.txt
```

## Useful File Commands

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
