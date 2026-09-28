# Python Tools & Media Utilities

## yt-dlp Installation

**Option 1: Stable Release**
```bash
pip install yt-dlp
```

**Option 2: Latest Pre-release (Recommended)**
```bash
pip install -U --pre "yt-dlp[default]"
```

## Additional Python Tools
```bash
# Install yturl
pip install yturl

# Modern Python package managers
pip install pipx pip-tools
pipx install uv
```

## FFmpeg Quick Reference
```bash
# Convert WebM to MP3
ffmpeg -i input.webm -vn -ar 44100 -ac 2 -b:a 192k output.mp3
```

**Parameters explained:**
- `-vn` - No video
- `-ar 44100` - Audio sample rate
- `-ac 2` - Audio channels (stereo)
- `-b:a 192k` - Audio bitrate

---
