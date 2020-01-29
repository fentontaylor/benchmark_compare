const DB = require('../utils/dbConnect')

class Olympian {
  static async index() {
    const data = await DB('olympians')
    return { olympians: data }
  }
}

module.exports = Olympian;