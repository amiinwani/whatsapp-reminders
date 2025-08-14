#!/bin/bash

echo "🚀 Building WhatsApp Reminder Android App..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is required but not installed. Please install Node.js first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is required but not installed. Please install npm first."
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Initialize Capacitor if not already done
if [ ! -d "android" ]; then
    echo "🔧 Initializing Capacitor project..."
    npx cap init "WhatsApp Reminder" "com.whatsappreminder.app" --web-dir=www
fi

# Copy web assets
echo "📋 Copying web assets..."
npm run copy-assets

# Add Android platform if not already added
if [ ! -d "android" ]; then
    echo "🤖 Adding Android platform..."
    npx cap add android
fi

# Sync Capacitor
echo "🔄 Syncing Capacitor..."
npx cap sync android

# Copy Android configuration
if [ -f "android-config.xml" ]; then
    echo "📱 Copying Android configuration..."
    cp android-config.xml android/app/src/main/AndroidManifest.xml
fi

# Build APK
echo "🔨 Building APK..."
cd android

# Make gradlew executable
chmod +x gradlew

# Build debug APK
./gradlew assembleDebug

# Check if APK was built successfully
if [ -f "app/build/outputs/apk/debug/app-debug.apk" ]; then
    echo "✅ APK built successfully!"
    echo "📱 APK Location: android/app/build/outputs/apk/debug/app-debug.apk"
    
    # Copy APK to root directory for easy access
    cp app/build/outputs/apk/debug/app-debug.apk ../WhatsApp-Reminder.apk
    echo "📋 APK copied to: WhatsApp-Reminder.apk"
    
    echo ""
    echo "🎉 Build completed successfully!"
    echo "📱 Install the APK on your Android device: WhatsApp-Reminder.apk"
    echo ""
    echo "📝 Installation Instructions:"
    echo "1. Enable 'Unknown Sources' in Android Settings > Security"
    echo "2. Transfer WhatsApp-Reminder.apk to your phone"
    echo "3. Tap the APK file to install"
    echo "4. Grant necessary permissions when prompted"
    echo ""
else
    echo "❌ APK build failed!"
    exit 1
fi
