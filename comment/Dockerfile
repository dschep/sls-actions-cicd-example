FROM node:10-slim


LABEL "com.github.actions.name"="Comment on PR"
LABEL "com.github.actions.description"="Comments with sls info output on the PR"
LABEL "com.github.actions.icon"="comment"
LABEL "com.github.actions.color"="blue"

RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*
RUN npm i -g serverless

COPY package.json package.json
RUN npm i

COPY entrypoint.js entrypoint.js
ENTRYPOINT ["node", "/entrypoint.js"]
