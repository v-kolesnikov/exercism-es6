FROM node
MAINTAINER Vasily Kolesnikov re.vkolesnikov@gmail.com

ARG EXERCISM_CLI_VERSION
ARG EXERCISM_KEY

# install exercise-cli
WORKDIR /usr/local/bin
RUN wget -qO- https://github.com/exercism/cli/releases/download/v$EXERCISM_CLI_VERSION/exercism-linux-64bit.tgz | tar -zx
RUN chmod +x exercism

# configure exercise-cli
RUN mkdir /root/exercism
WORKDIR /root/exercism
RUN exercism configure --key=$EXERCISM_KEY --dir="/root/exercism/lib/exercism"

USER root
CMD bash
