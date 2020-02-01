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
    .then(data => res.status(200).send({ olympians: data }))
    .catch(err => err)
})

const graphqlHTTP = require('express-graphql');
const { schema, root } = require('./lib/schema');

app.use('/api/v2/graphql', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true
}))

module.exports = app;