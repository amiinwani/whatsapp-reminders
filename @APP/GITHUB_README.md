# 📱 WhatsApp Reminder - Android App

[![Build Android APK](https://github.com/YOUR_USERNAME/whatsapp-reminder/actions/workflows/build-android.yml/badge.svg)](https://github.com/YOUR_USERNAME/whatsapp-reminder/actions/workflows/build-android.yml)
[![Release](https://img.shields.io/github/v/release/YOUR_USERNAME/whatsapp-reminder)](https://github.com/YOUR_USERNAME/whatsapp-reminder/releases)
[![Downloads](https://img.shields.io/github/downloads/YOUR_USERNAME/whatsapp-reminder/total)](https://github.com/YOUR_USERNAME/whatsapp-reminder/releases)

> **🚀 Automated WhatsApp reminders directly on your Android device - no backend server required!**

![WhatsApp Reminder Preview](https://img.shields.io/badge/App-Ready%20to%20Download-brightgreen?style=for-the-badge&logo=android)

---

## 📥 **Quick Download**

### **🎯 Get the Latest APK**

1. **Go to [Releases](../../releases)** 
2. **Download `WhatsApp-Reminder-*.apk`**
3. **Install on your Android device**
4. **Start automating your WhatsApp messages!**

*APKs are automatically built and tested with every update!*

---

## ✨ **Features**

- 🔄 **Automated WhatsApp Reminders** - Set custom messages and schedules
- 📱 **Native Android App** - No web browser needed, runs natively
- 🌙 **Dark Theme** - Elegant black & white interface
- 🔔 **Background Operation** - Continues working when app is closed
- 💾 **Local Storage** - All data stored on your device (privacy first!)
- 📞 **Direct Phone Input** - Enter any phone number for reminders
- ⏰ **Flexible Scheduling** - Set frequency and time ranges
- 🔔 **Push Notifications** - Get notified when messages are sent
- 🛡️ **Privacy Focused** - No data collection, uses official WhatsApp Web

---

## 📱 **Installation**

### **Android Requirements**
- Android 5.1+ (API Level 22+)
- WhatsApp installed and active
- Internet connection for WhatsApp Web authentication

### **Install Steps**
1. **Enable Unknown Sources**: Android Settings → Security → Unknown Sources
2. **Download APK**: From [Releases](../../releases) page
3. **Install**: Tap the APK file on your device
4. **Grant Permissions**: Allow notifications, battery optimization bypass
5. **Launch & Connect**: Open app → Connect WhatsApp Web (scan QR once)

---

## 🚀 **How It Works**

### **1. First Time Setup**
```
Open App → "Connect WhatsApp Web" → Scan QR Code → Done!
```
*Your WhatsApp session will be remembered for future use*

### **2. Create Reminders**
```
Enter Phone Number → Type Message → Set Frequency → Start Reminder
```
*Example: Send "Daily standup in 10 mins" to +1234567890 every weekday at 9:50 AM*

### **3. Background Automation**
```
App runs in background → Opens WhatsApp at scheduled times → Sends messages automatically
```
*Receive notifications when messages are sent*

---

## 🔧 **Technical Details**

### **Built With**
- **Frontend**: HTML5, CSS3, JavaScript (Mobile-Optimized)
- **Framework**: Capacitor (Web-to-Native)
- **Platform**: Android Native
- **Build**: GitHub Actions (Automated CI/CD)
- **WhatsApp**: Official Web API Integration

### **Architecture**
```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Android App   │    │  WhatsApp Web    │    │  Target Contact │
│   (Background)  │───▶│  (wa.me links)   │───▶│   (Receives)    │
└─────────────────┘    └──────────────────┘    └─────────────────┘
         │
         ▼
┌─────────────────┐
│ Local Storage   │
│ (Your Device)   │
└─────────────────┘
```

### **Privacy & Security**
- ✅ **No Backend Servers** - Everything runs on your device
- ✅ **No Data Collection** - Zero telemetry or analytics
- ✅ **Official WhatsApp** - Uses legitimate WhatsApp Web authentication
- ✅ **Local Storage** - Messages and settings stored only on your phone
- ✅ **Open Source** - All code visible and auditable

---

## 🛠️ **Development**

### **Build Locally**
```bash
# Clone and setup
git clone https://github.com/YOUR_USERNAME/whatsapp-reminder.git
cd whatsapp-reminder
npm install

# Build APK (requires Android SDK)
./build.sh
```

### **Auto-Build with GitHub Actions**
Every push to `main` automatically:
1. ✅ Builds the Android APK
2. ✅ Runs tests and validation
3. ✅ Creates a new release
4. ✅ Uploads APK for download

**No manual building required!**

---

## 📋 **FAQ**

**Q: Is this safe to use?**
A: Yes! Uses official WhatsApp Web authentication, no bots or unofficial APIs.

**Q: Do I need to keep the app open?**
A: No! The app runs in the background and will continue sending reminders when closed.

**Q: Can WhatsApp ban me for using this?**
A: Very unlikely. This uses the same method as manually opening WhatsApp Web and sending messages.

**Q: Does this work without internet?**
A: No, it requires internet to connect to WhatsApp Web and send messages.

**Q: How do I stop reminders?**
A: Open the app and tap "Stop Reminder" - simple as that!

---

## 🚨 **Important Notes**

⚠️ **Battery Optimization**: Disable battery optimization for this app in Android settings to ensure reliable background operation.

⚠️ **WhatsApp Session**: You may need to re-scan the QR code occasionally if WhatsApp Web logs out.

⚠️ **Responsible Use**: This tool is for personal automation. Please respect others' privacy and WhatsApp's terms of service.

---

## 🎉 **Latest Release**

Check out the [**Releases**](../../releases) page for:
- 📱 **Latest APK downloads**
- 📝 **Changelog and new features**  
- 🐛 **Bug fixes and improvements**
- 📊 **Build information and checksums**

---

## 🤝 **Contributing**

Found a bug or want to suggest a feature? 

1. **Issues**: [Report bugs or request features](../../issues)
2. **Pull Requests**: Submit improvements
3. **Discussions**: Ask questions or share ideas

---

## 📄 **License**

MIT License - Free for personal use

---

<div align="center">

**🚀 Ready to automate your WhatsApp messages?**

[**📥 Download APK**](../../releases/latest) | [**🐛 Report Issues**](../../issues) | [**⭐ Star this repo**](../../stargazers)

</div>

---

*Built with ❤️ for personal WhatsApp automation*
