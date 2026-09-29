# Termux:API Usage

## F-Droid and GitHub builds: Dual Installation Required

**For F-Droid and GitHub builds, you need BOTH components:**
1. **Termux:API app** from the same source as your Termux app: [F-Droid](https://f-droid.org/packages/com.termux.api/) for F-Droid Termux, or [GitHub](https://github.com/termux/termux-api/releases) for GitHub Termux. Do not mix sources.
2. **termux-api package**: `pkg install termux-api`

Without both installed, API commands will fail silently or show "command not found"!

### Verify Installation (F-Droid and GitHub)
```bash
# Check if package is installed
pkg list-installed | grep termux-api

# Test if API app is working
termux-battery-status
# Should return JSON with battery info
```

## Google Play build

The Google Play build includes support for a subset of API commands in the main Termux app; no separate Termux:API app is required. See the [official Play build status and changelog](https://github.com/termux-play-store#current-status-for-users) for availability in your version.

Supported commands include:

- `termux-audio-info`, `termux-battery-status`, `termux-dialog`, `termux-keystore`, `termux-toast`
- `termux-clipboard-*`, `termux-download`, `termux-saf-*`, `termux-share`, `termux-storage-get`, `termux-usb`
- `termux-vibrate`, `termux-volume`, `termux-camera-info`, `termux-job-scheduler`
- `termux-media-player`, `termux-microphone-record`, `termux-notification`, `termux-notification-channel`, `termux-notification-list`, `termux-notification-remove`
- `termux-speech-to-text`, `termux-tts-engines`, `termux-tts-speak`

Test built-in support with `termux-battery-status` or `termux-vibrate -d 500`. The examples below cover the wider F-Droid/GitHub API; Play users should use only commands supported by their build.

## Camera

```bash
# Take a photo (saves to ~/storage/dcim/)
termux-camera-photo ~/storage/dcim/photo.jpg

# Take photo with front camera
termux-camera-photo -c 1 ~/storage/dcim/selfie.jpg
```

## Battery Information

```bash
# Get battery status
termux-battery-status

# Pretty print battery info
termux-battery-status | python -m json.tool
```

## Location

```bash
# Get current location (GPS)
termux-location

# Get location with specific provider
termux-location -p gps

# Get location with network provider
termux-location -p network
```

## Notifications

```bash
# Send notification
termux-notification -t "Title" -c "Content message"

# Notification with action
termux-notification -t "Download Complete" -c "File.zip ready" --sound

# Vibrate notification (still works in 2026)
termux-notification -t "Alert" -c "Check this!" --vibrate 200,100,200
```

## SMS (requires permissions)

```bash
# Send SMS
termux-sms-send -n "+1234567890" "Hello from Termux!"

# List SMS messages
termux-sms-list

# List only inbox
termux-sms-list -t inbox -l 10
```

## Clipboard

```bash
# Copy to clipboard
echo "Hello World" | termux-clipboard-set

# Get clipboard content
termux-clipboard-get
```

## Vibration

```bash
# Vibrate for 1 second
termux-vibrate -d 1000

# Vibrate for half a second
termux-vibrate -d 500
```

## Toast Messages (Working in 2026)

```bash
# Show toast message
termux-toast "Hello from Termux!"

# Short duration toast
termux-toast -s "Quick message"

# Long duration toast
termux-toast -l "Longer message display"
```

## Volume Control

```bash
# Get current volume
termux-volume

# Set music volume to 50%
termux-volume music 50

# Set alarm volume to max
termux-volume alarm 15
```

## Flashlight

```bash
# Turn on flashlight
termux-torch on

# Turn off flashlight
termux-torch off
```

## Contact List

```bash
# List all contacts
termux-contact-list

# Get specific contact
termux-contact-list | grep "John"
```

## Call Log

```bash
# Get recent calls
termux-call-log

# Get last 5 calls
termux-call-log -l 5
```

## Additional Working Features (2026)

```bash
# Screen brightness control
termux-brightness 100  # Max brightness

# Microphone recording
termux-microphone-record -f output.mp3

# TTS (Text-to-Speech)
termux-tts-speak "Hello from Termux"

# Download with notification
termux-download https://example.com/file.zip

# Sensor data
termux-sensor -s light
termux-sensor -s accelerometer

# WiFi information
termux-wifi-connectioninfo
termux-wifi-scaninfo
```

---
