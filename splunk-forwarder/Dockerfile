FROM ubuntu
OM ubuntu
MAINTAINER peter@hertigcarl.se

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN wget -O splunkforwarder-6.2.0-237341-linux-2.6-amd64.deb 'http://www.splunk.com/page/download_track?file=6.2.0/universalforwarder/linux/splunkforwarder-6.2.0-237341-linux-2.6-amd64.deb&ac=&wget=true&name=wget&platform=Linux&architecture=x86_64&version=6.2.0&product=splunk&typed=release'
RUN dpkg -i --force-depends splunkforwarder-6.2.0-237341-linux-2.6-amd64.deb

RUN /opt/splunkforwarder/bin/splunk add monitor /logs/ -index garbo -sourcetype docker
CMD ["/opt/splunkforwarder/bin/splunk", "start", "--nodaemon", "--accept-license", "--answer-yes"]
# CMD ["/usr/bin/supervisord"]
