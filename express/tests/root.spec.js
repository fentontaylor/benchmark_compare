const request = require("supertest");
const app = require('../app');

describe('Test root endpoint', () => {
  it('returns a hello world message', async () => {
    const response = await request(app).get('/')
    expect(response.body).toEqual({ message: 'Hello, World!'})
  })
})