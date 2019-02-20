const { hello } = require('./handler')

describe('hello', () => {
  it('returns the event body', async () => {
    const resp = await hello({foo: 'bar'})
    expect(resp).toEqual({
      statusCode: 200,
      body: JSON.stringify({
        message: 'Go Serverless v1.0! Your function executed successfully!',
        input: {foo: 'bar'},
      }),
    })
  })
})
