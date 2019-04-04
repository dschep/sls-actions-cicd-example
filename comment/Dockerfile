FROM node:10-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/dschep/sls-actions-cicd-example/"
LABEL homepage="https://github.com/dschep/sls-actions-cicd-example/"
LABEL maintainer="Daniel Schep <dschep@gmail.com>"

LABEL "com.github.actions.name"="Comment on PR"
LABEL "com.github.actions.description"="Comments with sls info output on the PR"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="blue"

RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*
RUN npm i -g serverless

COPY package.json package.json
RUN npm i

COPY entrypoint.js entrypoint.js
ENTRYPOINT ["node", "/entrypoint.js"]
