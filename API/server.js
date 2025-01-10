const express = require('express');
const fs = require('fs');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const PORT = 3000;
const USERS_FILE = 'users.txt';

app.use(cors())
app.use(bodyParser.json());

// Route to register a new user
app.post('/register', async (req, res) => {
    const { email, password, firstName, lastName, role } = req.body;
    console.log(email, password, firstName, lastName, role)
    if (!email || !password || !firstName || !lastName || role === undefined) {
        return res.status(400).json({ message: 'All fields are required' });
    }

    try {
        // Hash the password
        const userEntry = `${email}:${password}:${firstName}:${lastName}:${role}\n`;

        // Append user to file
        fs.appendFileSync(USERS_FILE, userEntry, 'utf8');

        res.status(201).json({ message: 'User registered successfully' });
    } catch (error) {
        console.error('Error during registration:', error);
        res.status(500).json({ message: 'Error registering user' });
    }
});

// Route to login a user
app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({
            status: 400,
            message: 'Error'
        });
    }

    try {
        const users = fs.readFileSync(USERS_FILE, 'utf8').split('\n');

        for (const userEntry of users) {
            if (!userEntry) continue;

            const [storedEmail, storedHashedPassword, firstName, lastName, role] = userEntry.split(':');

            if (storedEmail === email && storedHashedPassword === password) {
                return res.status(200).json({
                    status: 200,
                    message: 'Success',
                    id: users.indexOf(userEntry) + 1,
                    firstName,
                    lastName,
                    email: storedEmail,
                    role: role
                });
            }
        }

        res.status(400).json({
            status: 400,
            message: 'Error'
        });
    } catch (error) {
        console.error('Error during login:', error);
        res.status(500).json({
            status: 400,
            message: 'Error'
        });
    }
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});