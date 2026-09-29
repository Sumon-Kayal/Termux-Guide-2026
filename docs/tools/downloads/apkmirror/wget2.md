# APKMirror with wget2

## Install wget2

```bash
pkg update
pkg install wget2
```

Verify the installation:

```bash
wget2 --version
```

## Get the APKMirror download URL

Open the APK/version page on [APKMirror](https://www.apkmirror.com/), start the APK download, and obtain the generated `download.php?...` URL. The URL normally contains query parameters such as `id` and `key`.

> **Do not publish a live `download.php` URL in scripts or documentation.** APKMirror download URLs can contain temporary signed parameters and may expire.

## Download with wget2

Use a Chrome-compatible Android User-Agent and an APKMirror Referer:

```bash
wget2 \
  --user-agent="Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.37 Mobile Safari/537.36" \
  --referer="https://www.apkmirror.com/" \
  -O download.apk \
  'APKMirror_DOWNLOAD_URL'
```

Replace `APKMirror_DOWNLOAD_URL` with the complete URL you obtained from APKMirror.

For example, the final command should look like:

```bash
wget2 \
  --user-agent="Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.37 Mobile Safari/537.36" \
  --referer="https://www.apkmirror.com/" \
  -O download.apk \
  'https://www.apkmirror.com/wp-content/themes/APKMirror/download.php?id=YOUR_ID&key=YOUR_KEY'
```

## Optional helper script

This repository includes [`scripts/apkmirror/wget2-download.sh`](../../../../scripts/apkmirror/wget2-download.sh), which wraps the same command into a reusable Termux script.

After cloning the repository:

```bash
chmod +x scripts/apkmirror/wget2-download.sh
```

Download an APK with the default filename:

```bash
./scripts/apkmirror/wget2-download.sh 'APKMirror_DOWNLOAD_URL'
```

Or choose the output filename:

```bash
./scripts/apkmirror/wget2-download.sh 'APKMirror_DOWNLOAD_URL' my-app.apk
```

## Why the URL must be quoted

APKMirror download URLs contain `&`. In a shell, `&` is a control operator, so an unquoted URL can be split into separate commands or background a command unexpectedly.

**Correct:**

```bash
wget2 'https://example.com/download.php?id=123&key=abc'
```

**Incorrect:**

```bash
wget2 https://example.com/download.php?id=123&key=abc
```

## What happens during the download

A successful request commonly looks like this:

```text
HTTP response 302
        ↓
APKMirror temporary storage URL
        ↓
wget2 downloads the APK
```

The `302` redirect is expected. The destination may be a temporary signed Cloudflare R2 storage URL rather than the APKMirror domain itself.
