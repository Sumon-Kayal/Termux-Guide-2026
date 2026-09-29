# APKMirror Troubleshooting

## HTTP 403 Forbidden

Try the exact User-Agent and Referer in the [wget2 download command](wget2.md#download-with-wget2), and make sure the complete APKMirror URL is enclosed in single quotes.

## The command starts a background job unexpectedly

Your URL probably contains an unquoted `&`. Put the entire URL inside `'...'`.

## A previously copied URL stops working

Get a fresh download URL from APKMirror. Temporary signed URLs can expire. Do not repeatedly reuse an old signed storage URL.

## The output filename is always `download.apk`

Change the value passed to `-O`:

```bash
wget2 \
  --user-agent="Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.37 Mobile Safari/537.36" \
  --referer="https://www.apkmirror.com/" \
  -O my-app.apk \
  'APKMirror_DOWNLOAD_URL'
```

> **Compatibility note:** This guide documents a browser-compatible request pattern, not a guarantee that APKMirror will accept every request. Site behavior, anti-bot protections, and signed download links can change.

---
