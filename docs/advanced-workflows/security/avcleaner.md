# AVcleaner Tool

**⚠️ ADVANCED/NICHE TOOL - Most users don't need this!**

## What is AVcleaner?

[AVcleaner](https://github.com/RedQueen979/AVcleaner) is an interactive Termux cleanup script. Its [source](https://github.com/RedQueen979/AVcleaner/blob/main/AVcleaner.sh) offers to:

- Clear downloaded package caches with `apt-get clean`.
- Delete files recursively under `/data/data/com.termux/files/home/tmp/`.
- Delete all files matching `*.log` recursively under Termux home.

**⚠️ Deletion risk:** The selected files are permanently deleted, including logs or temporary files you may still need. Review the script and back up important files before answering its prompts. It does not check whether files are in use.

## Installation (Optional)

```bash
# Clone repository in your chosen working directory
git clone https://github.com/RedQueen979/AVcleaner
cd "AVcleaner"

# Make executable
chmod +x "AVcleaner.sh"

# Create command using this clone's absolute path (optional)
ln -s "$PWD/AVcleaner.sh" "$PREFIX/bin/clean"
```

## Usage

```bash
clean  # if you created the symlink
# Or, from the cloned repository directory:
./AVcleaner.sh
```

Keep the clone in place while using the symlink; moving or deleting it breaks the command.

## When NOT to Use

- Don't run it unless you understand which files it deletes.
- Don't select temporary-file or log cleanup while those files are needed by running jobs.
- Don't run it without backups of files you want to keep.

For package-cache cleanup alone, use `pkg clean`.

---
