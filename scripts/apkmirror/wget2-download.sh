#!/data/data/com.termux/files/usr/bin/bash
# Usage: ./wget2-download.sh 'APKMirror_DOWNLOAD_URL' [output.apk]

set -euo pipefail

URL="${1:-}"
OUTPUT="${2:-download.apk}"

if [ -z "$URL" ]; then
    echo "Usage: $0 'APKMirror_DOWNLOAD_URL' [output.apk]"
    exit 2
fi

if ! command -v wget2 >/dev/null 2>&1; then
    echo "wget2 is not installed. Install it with: pkg install wget2"
    exit 127
fi

wget2 \
  --user-agent="Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.37 Mobile Safari/537.36" \
  --referer="https://www.apkmirror.com/" \
  -O "$OUTPUT" \
  "$URL"
