const env = process.env.NODE_ENV || 'development';
const config = require('../knexfile')[env];
const DB = require('knex')(config);

module.exports = DB;