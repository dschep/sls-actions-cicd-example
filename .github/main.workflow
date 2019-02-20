workflow "Deploy" {
  on = "push"
  resolves = ["serverless deploy"]
}
workflow "Remove" {
  on = "push"
  resolves = ["serverless remove"]
}

action "npm install" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
}

action "test" {
  uses = "serverless/github-action@master"
  needs = ["On non-deleted branches"]
  args = "invoke local -f hello"
  secrets = ["SERVERLESS_ACCESS_KEY"]
}

action "serverless deploy" {
  uses = "serverless/github-action@master"
  needs = ["test"]
  args = "deploy"
  secrets = ["SERVERLESS_ACCESS_KEY"]
}

action "serverless remove" {
  uses = "serverless/github-action@master"
  args = "remove"
  secrets = ["SERVERLESS_ACCESS_KEY"]
  needs = ["On deleted branches"]
}

action "On deleted branches" {
  uses = "dschep/filter-event-action@master"
  needs = ["npm install"]
  args = "event.deleted"
}

action "On non-deleted branches" {
  uses = "dschep/filter-event-action@master"
  needs = ["npm install"]
  args = "!event.deleted"
}
