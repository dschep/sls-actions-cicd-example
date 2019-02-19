workflow "New workflow" {
  on = "push"
  resolves = ["serverless deploy"]
}

action "npm install" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
}

action "test" {
  uses = "serverless/github-action@master"
  needs = ["npm install"]
  args = "invoke local -f hello"
}

action "serverless deploy" {
  uses = "serverless/github-action@master"
  needs = ["test"]
  args = "deploy"
  secrets = ["SERVERLESS_ACCESS_KEY"]
}
