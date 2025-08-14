#!/bin/bash

echo "🔧 WhatsApp Reminder Android App Setup"
echo "======================================"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if a directory exists
directory_exists() {
    [ -d "$1" ]
}

echo "📋 Checking system requirements..."

# Check Node.js
if command_exists node; then
    NODE_VERSION=$(node --version)
    echo "✅ Node.js: $NODE_VERSION"
else
    echo "❌ Node.js not found"
    echo "   Please install Node.js from https://nodejs.org/"
    exit 1
fi

# Check npm
if command_exists npm; then
    NPM_VERSION=$(npm --version)
    echo "✅ npm: $NPM_VERSION"
else
    echo "❌ npm not found"
    echo "   Please install npm (usually comes with Node.js)"
    exit 1
fi

# Check for Android development environment
echo ""
echo "🤖 Checking Android development environment..."

# Check ANDROID_HOME
if [ -z "$ANDROID_HOME" ]; then
    echo "⚠️  ANDROID_HOME not set"
    echo "   Please install Android Studio and set ANDROID_HOME"
    echo "   Example: export ANDROID_HOME=/Users/$(whoami)/Library/Android/sdk"
else
    echo "✅ ANDROID_HOME: $ANDROID_HOME"
fi

# Check for Java
if command_exists java; then
    JAVA_VERSION=$(java -version 2>&1 | head -n 1)
    echo "✅ Java: $JAVA_VERSION"
else
    echo "⚠️  Java not found"
    echo "   Please install Java JDK 11 or higher"
fi

# Check for Android SDK tools
if directory_exists "$ANDROID_HOME/platform-tools"; then
    echo "✅ Android Platform Tools found"
else
    echo "⚠️  Android Platform Tools not found"
    echo "   Please install Android SDK via Android Studio"
fi

echo ""
echo "📦 Installing project dependencies..."

# Install npm dependencies
if npm install; then
    echo "✅ Dependencies installed successfully"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""
echo "🎯 Setup recommendations:"
echo ""

# Check if Capacitor CLI is installed globally
if command_exists cap; then
    echo "✅ Capacitor CLI already installed"
else
    echo "💡 Install Capacitor CLI globally for easier development:"
    echo "   npm install -g @capacitor/cli"
fi

# Check if Android Studio is available
if command_exists studio; then
    echo "✅ Android Studio command available"
elif [ -d "/Applications/Android Studio.app" ]; then
    echo "💡 Android Studio found at /Applications/Android Studio.app"
    echo "   You can open the project with:"
    echo "   npx cap open android"
else
    echo "💡 Install Android Studio for easier development:"
    echo "   https://developer.android.com/studio"
fi

echo ""
echo "🚀 Next steps:"
echo "1. Run './build.sh' to build the APK"
echo "2. Install WhatsApp-Reminder.apk on your Android device"
echo "3. Grant necessary permissions when prompted"
echo "4. Connect to WhatsApp Web and start creating reminders!"
echo ""
echo "📚 For detailed instructions, see README.md"
echo "✅ Setup complete!"
