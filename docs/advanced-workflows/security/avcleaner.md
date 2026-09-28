# AVcleaner Tool

**⚠️ ADVANCED/NICHE TOOL - Most users don't need this!**

## What is AVcleaner?

AVcleaner is a utility for removing/obfuscating antivirus signatures from APK files. 

**Use Cases:**
- Testing AV detection capabilities (security research)
- Legitimate app development testing
- Bypassing false positives (rare cases)

**⚠️ Warning:**
- This is a **controversial tool** with potential for misuse
- Using it to distribute malware is **illegal**
- Only use for **authorized security research** or **legitimate testing**
- Most users will never need this tool

## Installation (Optional)

```bash
# Clone repository
git clone https://github.com/RedQueen979/AVcleaner
cd AVcleaner

# Make executable
chmod +x AVcleaner.sh

# Create system-wide command (optional)
ln -s ~/AVcleaner/AVcleaner.sh $PREFIX/bin/clean

# Return to home
cd ~
```

## Usage

```bash
clean  # if you created the symlink
# or
~/AVcleaner/AVcleaner.sh
```

## When NOT to Use

❌ Don't use if you're just learning Termux  
❌ Don't use for distributing any applications  
❌ Don't use unless you understand APK structure and AV detection  
❌ Don't use without legitimate security research purpose  

**Alternative:** If you're getting false positives on your legitimate app, contact the AV vendor directly rather than obfuscating signatures.

---
