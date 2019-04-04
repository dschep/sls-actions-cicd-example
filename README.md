# sls-actions-cicd-example
A repo demonstrating CI/CD with Github Actions &amp; Serverless

It creates a serverless deployment for each branch, using the branch name as the stage name.

If used in a private repo, it comments on PRs with the output of `sls info`.
See [#6](https://github.com/dschep/sls-actions-cicd-example/pull/6) for ane example
