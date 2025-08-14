# WhatsApp Reminder - Android App 📱

A standalone Android app for automated WhatsApp reminders that works entirely on your phone without needing a backend server.

## Features 🚀

- ✅ **Standalone Android App** - No backend server required
- ✅ **WhatsApp Web Integration** - Uses your existing WhatsApp account
- ✅ **Background Operation** - Continues working even when app is closed
- ✅ **Local Storage** - All data stored securely on your device
- ✅ **Custom Scheduling** - Set frequency and time ranges
- ✅ **Push Notifications** - Get notified when messages are sent
- ✅ **Elegant UI** - Clean black & white design

## Quick Start 🏃‍♂️

### Build the APK

```bash
cd @APP
./build.sh
```

This will:
1. Install all dependencies
2. Set up the Capacitor project
3. Build the Android APK
4. Output: `WhatsApp-Reminder.apk`

### Install on Android

1. **Enable Unknown Sources:**
   - Go to Settings → Security → Unknown Sources
   - Enable installation from unknown sources

2. **Install APK:**
   - Transfer `WhatsApp-Reminder.apk` to your Android device
   - Tap the file to install
   - Grant all requested permissions

3. **Setup WhatsApp:**
   - Open the app
   - Tap "Connect WhatsApp Web"
   - Scan QR code in WhatsApp Web
   - Return to the app

4. **Create Reminders:**
   - Enter phone number (with country code)
   - Type your message
   - Set frequency and time range
   - Tap "Start Reminder"

## How It Works 🔧

### WhatsApp Integration
- Opens WhatsApp Web for authentication
- Uses `wa.me` links to send messages
- No unofficial APIs or hacks required

### Background Operation
- Uses Android background services
- Continues running when app is minimized
- Sends local notifications for status updates

### Data Storage
- All reminder data stored locally using Capacitor Preferences
- WhatsApp session preserved between app launches
- No data sent to external servers

## App Structure 📁

```
@APP/
├── www/                    # Web assets
│   └── index.html         # Main app interface
├── android/               # Generated Android project
├── capacitor.config.ts    # Capacitor configuration
├── package.json          # Dependencies
├── build.sh              # Build script
└── README.md             # This file
```

## Permissions Explained 🔒

The app requests these permissions:

- **Internet Access**: Connect to WhatsApp Web
- **Network State**: Check connectivity
- **Wake Lock**: Keep app running in background
- **Foreground Service**: Background reminder processing
- **Notifications**: Show reminder status
- **Battery Optimization**: Prevent Android from killing the app

## Troubleshooting 🔧

### Build Issues

**Node.js not found:**
```bash
# Install Node.js (macOS)
brew install node

# Install Node.js (Linux)
sudo apt-get install nodejs npm
```

**Android SDK not found:**
1. Install Android Studio
2. Set ANDROID_HOME environment variable
3. Add SDK tools to PATH

### App Issues

**WhatsApp not connecting:**
- Make sure you have WhatsApp installed
- Try reconnecting in the app settings
- Clear app data and reconnect

**Reminders not working:**
- Check app permissions in Android settings
- Disable battery optimization for the app
- Ensure app has background processing enabled

**Messages not sending:**
- Verify phone number format (+1234567890)
- Check internet connection
- Ensure WhatsApp Web session is active

## Development 👨‍💻

### Manual Build Steps

```bash
# Install dependencies
npm install

# Initialize Capacitor
npx cap init "WhatsApp Reminder" "com.whatsappreminder.app"

# Add Android platform
npx cap add android

# Sync changes
npx cap sync android

# Open in Android Studio
npx cap open android

# Build APK manually
cd android
./gradlew assembleDebug
```

### Customization

- Edit `www/index.html` for UI changes
- Modify `capacitor.config.ts` for app settings
- Update `android-config.xml` for Android permissions

## Security & Privacy 🔐

- **No Data Collection**: App doesn't collect or transmit personal data
- **Local Storage**: All reminders stored on your device only
- **WhatsApp Authentication**: Uses official WhatsApp Web authentication
- **Open Source**: All code is visible and can be audited

## Limitations ⚠️

- Requires active internet connection
- WhatsApp Web session may expire (need to re-authenticate)
- Android may limit background processing (requires battery optimization disable)
- Cannot send media files, only text messages

## Support 💬

If you encounter issues:
1. Check the troubleshooting section above
2. Verify all permissions are granted
3. Try reinstalling the app
4. Check Android system logs for errors

## License 📝

MIT License - Use freely for personal use.

**Disclaimer**: Use responsibly and respect WhatsApp's terms of service. This tool is for personal automation only.
