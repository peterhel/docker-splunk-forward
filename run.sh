sudo docker build -t logger ./client-logger
sudo docker build -t splunk ./splunk-forwarder

sudo docker run -d logger 
sudo docker run --volumes-from logger -it splunk
