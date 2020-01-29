const express = require('express');
const Olympian = require('./models/olympian')
var app = express();

app.get('/', (req, res) => {
  res.status(200).send({
    'message': 'Hello, World!'
  })
})

app.get('/api/v1/olympians', (req, res) => {
  Olympian.index()
    .then(data => res.status(200).send(data))
    .catch(err => err)
})

module.exports = app;