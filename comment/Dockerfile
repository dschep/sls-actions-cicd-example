FROM node:10-slim


LABEL version="1.0.0"
LABEL repository="https://github.com/serverless/github-action"
LABEL homepage="https://github.com/serverless/github-action"
LABEL maintainer="Serverless, Inc. <hello@serverless.com> (https://serverless.com)"

LABEL "com.github.actions.name"="Serverless"
LABEL "com.github.actions.description"="Wraps the Serverless Frameork to enable common Serverless commands."
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"

RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*
RUN npm i -g serverless

COPY package.json package.json
RUN npm i

COPY entrypoint.js entrypoint.js
ENTRYPOINT ["node", "/entrypoint.js"]
