const DB = require('../utils/dbConnect')

class Olympian {
  static async index() {
    return await DB('olympians')
  }
}

module.exports = Olympian;