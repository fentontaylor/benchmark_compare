const request = require("supertest");
const DB = require('../utils/dbConnect')
const app = require('../app')


describe('api/v1/olympians', () => {
  beforeEach(async () => {
    await DB.raw('TRUNCATE TABLE olympians')
  })

  afterEach(async () => {
    await DB.raw('TRUNCATE TABLE olympians')
  })

  it('returns an index of all olympians', async () => {
    oly1 = await DB('olympians')
      .insert({ name: 'Bob', sex: 'M', age: 25, height: 170, weight: 65 })
      .returning('*')

    oly2 = await DB('olympians')
      .insert({ name: 'Sue', sex: 'F', age: 22, height: 160, weight: 54 })
      .returning('*')
    
    const expected = {
      olympians: [ oly1[0], oly2[0] ]
    }

    const response = await request(app).get('/api/v1/olympians')

    expect(response.status).toBe(200);
    expect(response.body).toEqual(expected);
  })
})