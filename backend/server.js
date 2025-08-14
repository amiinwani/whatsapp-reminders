const express = require('express');
const cors = require('cors');
const { Client, LocalAuth } = require('whatsapp-web.js');
const qrcode = require('qrcode');
const cron = require('node-cron');
const path = require('path');

const app = express();
const PORT = 3001;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, '../frontend')));

// WhatsApp Client
const client = new Client({
    authStrategy: new LocalAuth({
        clientId: "whatsapp-reminder"
    }),
    puppeteer: {
        headless: true,
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    }
});

// State management
let clientReady = false;
let qrCode = null;
let contacts = [];
let activeReminder = null;
let cronTask = null;

// WhatsApp event handlers
client.on('qr', (qr) => {
    console.log('QR Code generated, scan it to authenticate');
    qrcode.toDataURL(qr, (err, url) => {
        if (!err) {
            qrCode = url;
            console.log('QR Code ready for scanning');
        }
    });
});

client.on('ready', async () => {
    console.log('WhatsApp client is ready!');
    clientReady = true;
    qrCode = null;
    
    // Get contacts
    try {
        const chats = await client.getChats();
        contacts = chats
            .filter(chat => chat.isGroup === false && chat.name)
            .map(chat => ({
                id: chat.id._serialized,
                name: chat.name,
                isMyContact: chat.isMyContact
            }))
            .sort((a, b) => a.name.localeCompare(b.name));
        
        console.log(`Loaded ${contacts.length} contacts`);
    } catch (error) {
        console.error('Error loading contacts:', error);
    }
});

client.on('authenticated', () => {
    console.log('WhatsApp authenticated successfully');
});

client.on('auth_failure', () => {
    console.log('WhatsApp authentication failed');
    clientReady = false;
});

client.on('disconnected', (reason) => {
    console.log('WhatsApp client disconnected:', reason);
    clientReady = false;
    qrCode = null;
});

// Helper function to check if current time is within allowed range
function isWithinTimeRange(startTime, endTime) {
    if (!startTime || !endTime) return true;
    
    const now = new Date();
    const currentTime = now.getHours() * 60 + now.getMinutes();
    
    const [startHour, startMin] = startTime.split(':').map(Number);
    const [endHour, endMin] = endTime.split(':').map(Number);
    
    const start = startHour * 60 + startMin;
    const end = endHour * 60 + endMin;
    
    return currentTime >= start && currentTime <= end;
}

// Send reminder message
async function sendReminder() {
    if (!clientReady || !activeReminder) {
        console.log('Cannot send reminder: client not ready or no active reminder');
        return;
    }
    
    // Check time range
    if (!isWithinTimeRange(activeReminder.startTime, activeReminder.endTime)) {
        console.log('Outside allowed time range, skipping reminder');
        return;
    }
    
    try {
        await client.sendMessage(activeReminder.contactId, activeReminder.message);
        console.log(`Reminder sent to ${activeReminder.contactName}: "${activeReminder.message}"`);
        activeReminder.lastSent = new Date().toISOString();
        activeReminder.messageCount = (activeReminder.messageCount || 0) + 1;
    } catch (error) {
        console.error('Error sending reminder:', error);
    }
}

// API Routes
app.get('/api/status', (req, res) => {
    res.json({
        clientReady,
        qrCode,
        contactsCount: contacts.length,
        activeReminder: activeReminder ? {
            ...activeReminder,
            contactId: undefined // Don't expose full contact ID
        } : null
    });
});

app.get('/api/contacts', (req, res) => {
    if (!clientReady) {
        return res.status(400).json({ error: 'WhatsApp client not ready' });
    }
    res.json(contacts);
});

app.post('/api/reminder/start', (req, res) => {
    const { contactId, contactName, message, frequency, startTime, endTime } = req.body;
    
    if (!clientReady) {
        return res.status(400).json({ error: 'WhatsApp client not ready' });
    }
    
    if (!contactId || !message || !frequency) {
        return res.status(400).json({ error: 'Missing required fields' });
    }
    
    // Stop existing reminder
    if (cronTask) {
        cronTask.stop();
        cronTask = null;
    }
    
    // Create new reminder
    activeReminder = {
        contactId,
        contactName: contactName || 'Unknown',
        message,
        frequency: parseInt(frequency),
        startTime,
        endTime,
        started: new Date().toISOString(),
        messageCount: 0,
        lastSent: null
    };
    
    // Set up cron job based on frequency (in minutes)
    const cronExpression = `*/${frequency} * * * *`;
    cronTask = cron.schedule(cronExpression, sendReminder, {
        scheduled: false
    });
    
    cronTask.start();
    
    console.log(`Reminder started for ${contactName}: "${message}" every ${frequency} minutes`);
    
    res.json({ success: true, reminder: activeReminder });
});

app.post('/api/reminder/stop', (req, res) => {
    if (cronTask) {
        cronTask.stop();
        cronTask = null;
    }
    
    const stoppedReminder = activeReminder;
    activeReminder = null;
    
    console.log('Reminder stopped');
    
    res.json({ success: true, stoppedReminder });
});

app.post('/api/reminder/test', async (req, res) => {
    if (!clientReady || !activeReminder) {
        return res.status(400).json({ error: 'No active reminder or client not ready' });
    }
    
    try {
        await sendReminder();
        res.json({ success: true, message: 'Test message sent' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to send test message', details: error.message });
    }
});

// Serve frontend
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../frontend/index.html'));
});

// Start server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
    console.log('Initializing WhatsApp client...');
    client.initialize();
});

// Graceful shutdown
process.on('SIGINT', () => {
    console.log('Shutting down...');
    if (cronTask) {
        cronTask.stop();
    }
    client.destroy();
    process.exit(0);
});
