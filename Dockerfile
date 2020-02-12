FROM node:12.15.0-alpine3.11

LABEL maintainer="Michael Hettmer - @michaelhettmer"

LABEL description="empty description"

# install necessary build dependencies
RUN apk update && apk --no-cache add npm python g++ make && rm -rf /var/cache/apk/*

# install node-gyp globally to be used by gatsby-plugin-sharp and other image related dependencies
RUN npm install -g node-gyp@6.1.0