const fs = require('fs')

module.exports = () => {
  if (!process.env.GITHUB_EVENT_PATH) return
  const event = JSON.parse(fs.readFileSync(process.env.GITHUB_EVENT_PATH))
  if (event.ref.startsWith('refs/heads/')) {
    return event.ref.slice('refs/heads/'.length)
  } else {
    return event.ref
  }
}
