workflow "Deploy" {
  on = "push"
  resolves = ["Comment on PR"]
}

workflow "Remove" {
  on = "push"
  resolves = ["serverless remove"]
}

action "npm install" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
  needs = ["On non-deleted branches"]
}

action "npm install 2" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
  needs = ["On deleted branches"]
}

action "npm test" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["npm install"]
  args = "test"
}

action "serverless deploy" {
  uses = "serverless/github-action@master"
  needs = ["npm test"]
  args = "deploy"
  secrets = ["SERVERLESS_ACCESS_KEY"]
}

action "serverless remove" {
  uses = "serverless/github-action@master"
  args = "remove"
  secrets = ["SERVERLESS_ACCESS_KEY"]
  needs = ["npm install 2"]
}

action "On deleted branches" {
  uses = "dschep/filter-event-action@master"
  args = "event.deleted"
}

action "On non-deleted branches" {
  uses = "dschep/filter-event-action@master"
  args = "!event.deleted"
}

action "On Pull Requests" {
  uses = "dschep/filter-event-action@master"
  needs = ["serverless deploy"]
  args = "event.pull_request"
}

action "Comment on PR" {
  uses = "./comment"
  needs = ["On Pull Requests"]
  secrets = ["GITHUB_TOKEN", "SERVERLESS_ACCESS_KEY"]
}
