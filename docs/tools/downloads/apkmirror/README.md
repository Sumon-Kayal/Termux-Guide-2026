# APKMirror Downloads

`wget2` can be used to download APK files from APKMirror directly from Termux. Some APKMirror download endpoints may return `HTTP 403 Forbidden` when requested without browser-like headers. A Chrome-compatible Android User-Agent together with an APKMirror Referer can allow the request to proceed to the temporary file-storage URL.

- [wget2 usage](wget2.md): install, get the URL, download, helper script
- [Troubleshooting](troubleshooting.md): 403 errors, quoting, expired links

The helper script is [`scripts/apkmirror/wget2-download.sh`](../../../../scripts/apkmirror/wget2-download.sh).
