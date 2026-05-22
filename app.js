const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('UTS DevOps - Aplikasi Web Berjalan!');
});

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'OK', timestamp: new Date() });
});

app.listen(port, () => {
  console.log(`Aplikasi berjalan di http://localhost:${port}`);
});

module.exports = app;