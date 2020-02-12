FROM node:12.15.0-alpine3.11

LABEL maintainer="Michael Hettmer - @michaelhettmer"

LABEL description="empty description"

RUN npm install -g node-gyp@6.1.0