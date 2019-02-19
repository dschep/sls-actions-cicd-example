const fs = require('fs')

module.exports = () => process.env.GITHUB_EVENT_PATH && JSON.parse(
    fs.readFileSync(process.env.GITHUB_EVENT_PATH)).ref.split('refs/heads/')[1]
