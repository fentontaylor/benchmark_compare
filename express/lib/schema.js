const { buildSchema } = require('graphql')

var schema = buildSchema(`
  type Query {
    message: String
  }
`);

var root = {
  message: () => {
    return 'Hello, World!'
  }
}

module.exports = {
  schema: schema,
  root: root
}
