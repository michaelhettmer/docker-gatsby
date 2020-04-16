FROM node:12.16.1-alpine3.11

LABEL maintainer="Michael Hettmer - @michaelhettmer"
LABEL description="empty description"

# pin build dependency versions to make image deterministic and reliable
ENV GIT_VERSION 2.24.2-r0
ENV PYTHON3_VERSION 3.8.2-r0
ENV GPP_VERSION 9.2.0-r4
ENV MAKE_VERSION 4.2.1-r2
ENV AUTOMAKE_VERSION 1.16.1-r0
ENV AUTOCONF_VERSION 2.69-r2
ENV LIBTOOL_VERSION 2.4.6-r7
ENV PKGCONF_VERSION 1.6.3-r0
ENV NASM_VERSION 2.14.02-r0

# install necessary build dependencies
RUN apk update && apk add --no-cache \
    git=$GIT_VERSION \
    python3=$PYTHON3_VERSION \
    g++=$GPP_VERSION \
    make=$MAKE_VERSION \
    automake=$AUTOMAKE_VERSION \
    autoconf=$AUTOCONF_VERSION \
    libtool=$LIBTOOL_VERSION \
    pkgconf=$PKGCONF_VERSION \
    nasm=$NASM_VERSION \
    && rm -rf /var/cache/apk/*

# pin node dependency versions to make image deterministic and reliable
ENV NODE_GYP_VERSION 6.1.0

# install node-gyp globally to be used by gatsby-plugin-sharp and other image related dependencies
RUN npm install -g node-gyp@$NODE_GYP_VERSION