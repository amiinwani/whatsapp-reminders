# WhatsApp Reminder Tool 📱

A simple personal WhatsApp auto-messaging reminder tool that runs locally on your machine.

## Features

- ✅ Send automated reminder messages to any WhatsApp contact
- ✅ Set custom message frequency (in minutes)
- ✅ Optional time range restrictions (e.g., 9 AM - 6 PM only)
- ✅ Clean web interface for easy control
- ✅ Local WhatsApp session storage (no need to scan QR every time)
- ✅ Real-time status and statistics
- ✅ Test message functionality

## Quick Start

1. **Install dependencies:**
   ```bash
   cd backend
   npm install
   ```

2. **Start the server:**
   ```bash
   npm start
   ```

3. **Open the web interface:**
   - Go to `http://localhost:3001` in your browser

4. **First-time setup:**
   - Scan the QR code with your WhatsApp mobile app
   - Go to WhatsApp → Settings → Linked Devices → Link a Device
   - Scan the QR code displayed on the web page

5. **Use the tool:**
   - Select a contact from the dropdown
   - Enter your reminder message
   - Set frequency (in minutes)
   - Optionally set time range
   - Click "Start Reminder"

## How It Works

- Uses `whatsapp-web.js` to connect to WhatsApp Web
- Stores session locally so you only need to scan QR code once
- Runs cron jobs based on your frequency settings
- Respects time range restrictions if set
- Provides real-time web interface for control

## File Structure

```
whatsapp-reminder/
├── backend/
│   ├── server.js       # Main server and WhatsApp logic
│   └── package.json    # Dependencies
├── frontend/
│   └── index.html      # Web interface
└── README.md
```

## API Endpoints

- `GET /api/status` - Get connection status and active reminder info
- `GET /api/contacts` - Get list of WhatsApp contacts  
- `POST /api/reminder/start` - Start a new reminder
- `POST /api/reminder/stop` - Stop active reminder
- `POST /api/reminder/test` - Send a test message

## Important Notes

⚠️ **This tool is for personal use only.** Use responsibly and respect others' privacy.

⚠️ **WhatsApp Terms:** Make sure your usage complies with WhatsApp's terms of service.

⚠️ **Rate Limits:** Don't set extremely high frequencies to avoid being flagged by WhatsApp.

## Troubleshooting

**QR Code not showing?**
- Make sure the server is running
- Refresh the page
- Check the browser console for errors

**Can't see contacts?**
- Make sure WhatsApp is connected (green status dot)
- Try refreshing the page
- Check that you have contacts in your WhatsApp

**Messages not sending?**
- Check if you're within the time range (if set)
- Verify the contact is still available
- Test with the "Send Test Message" button

## Development

To run in development mode with auto-restart:

```bash
cd backend
npm install -g nodemon  # if not already installed
npm run dev
```

## License

MIT License - Use at your own risk.
