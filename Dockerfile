FROM node:6
MAINTAINER Vasily Kolesnikov re.vkolesnikov@gmail.com

ARG EXERCISM_CLI_VERSION
ARG EXERCISM_KEY

ENV APP_HOME /root/exercism

RUN mkdir $APP_HOME

# install exercise-cli
WORKDIR /usr/local/bin
RUN wget -qO- https://github.com/exercism/cli/releases/download/v$EXERCISM_CLI_VERSION/exercism-linux-64bit.tgz | tar -zx
RUN chmod +x exercism

# configure exercise-cli
RUN exercism configure --key=$EXERCISM_KEY --dir="$APP_HOME/lib/exercism"

WORKDIR $APP_HOME

# configure Node.js
RUN npm install -g yarn

USER root
CMD bash
