const { spawnSync } = require('child_process');
const fs = require('fs');
const fetch = require('node-fetch');

const event = JSON.parse(fs.readFileSync(process.env.GITHUB_EVENT_PATH))

const info = spawnSync('sls', ['info']).stdout.toString();

fetch(event.payload.pull_request.comments_url, {
  method: 'POST',
  body: JSON.stringify({body: `Created deployment for your PR. Here's the output of \`sls info\`:
\`\`\`
${info}
\`\`\`
  `}),
  headers: {
    Authorization: `token ${process.env.GITHUB_TOKEN}`,
    'Content-Type': 'application/json'
  }
}).then(r => r.json()).then(console.log)
