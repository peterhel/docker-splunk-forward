FROM ubuntu
MAINTAINER peter@hertigcarl.se

RUN export DEBIAN_FRONTEND=noninteractive

ADD ./client-logger /opt/client-logger

RUN apt-get update && apt-get install -y nodejs
VOLUME /logs
EXPOSE 4500 4443
CMD ["/usr/bin/nodejs", "/opt/client-logger/server.js"]
