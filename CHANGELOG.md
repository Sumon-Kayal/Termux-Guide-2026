# Changelog

## 2026-09-29 (Termux Handbook)

- Renamed the project to **Termux Handbook: Setup, Tools, Development & Advanced Workflows**.
- Regrouped `docs/` into `setup/`, `tools/`, `development/`, `advanced-workflows/` and `reference/`, each with an `index.md`; no page content was removed.
- Moved: SSH, curl, wget2 and downloads into `tools/`; web servers and databases into `development/`; proot, desktop GUI, background processes, battery, self-hosting and security into `advanced-workflows/`; troubleshooting, FAQ and resources into `reference/`.

## 2026-09-29 (APKMirror)

- Added APKMirror download guide with wget2 (`docs/downloads/apkmirror/`) and helper script `scripts/apkmirror/wget2-download.sh`.

## 2026-09-29 (web update)

- Added Google Play build changes (googleplay.2026.02.11 and 2026.06.21: built-in Termux API methods, Boot/Widget integrated).
- Added newest bootstrap tag, repository merges (science/game/unstable into main), glibc-repo/glibc-runner, Termux:GUI and termux-gui-package.
- Added the Android 14+ "Disable child process restrictions" toggle, Android 16 mention, and the missing ADB pairing/connect/disable steps to the phantom process fix.
- Added new links to `docs/resources.md`.

## 2026-09-29

- Merged the four README revisions into the latest one; content from older revisions that the latest already covered was not duplicated.
- Split the single README into a `docs/` tree (getting-started, packages, development, networking, downloads, proot, services, android, security, troubleshooting, faq).
- Added extra pages for content without a slot in the planned layout: `docs/getting-started/customization.md`, `docs/development/compilation.md`, `docs/services/desktop-gui.md`, `docs/security/encryption.md`, `docs/security/avcleaner.md`, `docs/security/security-tools.md`, `docs/troubleshooting/cleanup-and-removal.md`, `docs/resources.md`.
- Licence: removed the MIT badge and text from the oldest revision; the project is CC BY-SA 4.0. `LICENSE.md` renamed to `LICENSE`.
- Moved the screenshot to `assets/screenshots/` and the Hindi placeholder to `translations/hi_IN/`.
- Removed maintenance notes describing how sections were merged.
