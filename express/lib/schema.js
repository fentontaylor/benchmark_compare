const { buildSchema } = require('graphql')
const Olympian = require('../models/olympian')

var schema = buildSchema(`
  type Olympian {
    id: ID!
    name: String!
    sex: String
    age: Int
    height: Int
    weight: Int
  }

  type Query {
    message: String
    olympians: [Olympian]
  }
`);

var root = {
  message: () => {
    return 'Hello, World!'
  },
  olympians: () => {
    return Olympian.index()
  }
}

module.exports = {
  schema: schema,
  root: root
}
