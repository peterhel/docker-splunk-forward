FROM ubuntu
MAINTAINER peter@hertigcarl.se

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget expect
COPY splunk_login /opt/splunkforwarder/bin/splunk_login

RUN wget -O splunkforwarder-6.2.0-237341-linux-2.6-amd64.deb 'http://www.splunk.com/page/download_track?file=6.2.0/universalforwarder/linux/splunkforwarder-6.2.0-237341-linux-2.6-amd64.deb&ac=&wget=true&name=wget&platform=Linux&architecture=x86_64&version=6.2.0&product=splunk&typed=release'
RUN dpkg -i --force-depends splunkforwarder-6.2.0-237341-linux-2.6-amd64.deb

CMD /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes
CMD /opt/splunkforwarder/bin/splunk_login

CMD /opt/splunkforwarder/bin/splunk add forward-server 172.17.100.101:9997
CMD /opt/splunkforwarder/bin/splunk list forward-server 
CMD /opt/splunkforwarder/bin/splunk add monitor /logs/ -index garbo -sourcetype docker
CMD /opt/splunkforwarder/bin/splunk restart
CMD /opt/splunkforwarder/bin/splunk_login

CMD ["/opt/splunkforwarder/bin/splunk", "start", "--nodaemon"]
