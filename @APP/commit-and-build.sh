#!/bin/bash

echo "🚀 WhatsApp Reminder - Commit and Auto-Build Script"
echo "=================================================="

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if we're in a git repo
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ Not a Git repository. Initialize first:${NC}"
    echo "git init"
    echo "git remote add origin https://github.com/YOUR_USERNAME/whatsapp-reminder.git"
    exit 1
fi

# Check if there are any changes
if [ -z "$(git status --porcelain)" ]; then
    echo -e "${YELLOW}⚠️  No changes to commit${NC}"
else
    echo -e "${BLUE}📋 Changes detected, preparing commit...${NC}"
    
    # Add all files
    git add .
    
    # Create commit message
    COMMIT_MSG="🚀 WhatsApp Reminder Android App - Ready for build $(date '+%Y-%m-%d %H:%M')"
    
    echo -e "${BLUE}📝 Committing with message: ${COMMIT_MSG}${NC}"
    git commit -m "$COMMIT_MSG"
fi

# Push to GitHub
echo -e "${BLUE}📤 Pushing to GitHub...${NC}"
git push origin main || git push origin master

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ SUCCESS! Code pushed to GitHub${NC}"
    echo ""
    echo -e "${YELLOW}🔥 GitHub Actions will now automatically:${NC}"
    echo "   1. ✅ Build your Android APK"
    echo "   2. ✅ Run tests and validation"  
    echo "   3. ✅ Create a new release"
    echo "   4. ✅ Make APK available for download"
    echo ""
    echo -e "${BLUE}📱 To get your APK:${NC}"
    echo "   1. Go to your GitHub repo"
    echo "   2. Click 'Actions' tab to watch the build"
    echo "   3. Once complete, go to 'Releases' to download APK"
    echo "   4. Install on your Android device!"
    echo ""
    echo -e "${GREEN}🎉 Your WhatsApp Reminder app will be ready in ~5 minutes!${NC}"
else
    echo -e "${RED}❌ Push failed. Check your Git remote configuration.${NC}"
    exit 1
fi
