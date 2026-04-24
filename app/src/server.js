const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 8080;

// Servir archivos estáticos para la ruta principal
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Endpoint extra para probar el backend
app.get('/api/status', (req, res) => {
  res.json({ status: 'OK', message: 'El App Service funciona correctamente' });
});

app.listen(port, () => {
  console.log(`Aplicación ejecutándose en el puerto ${port}`);
});
