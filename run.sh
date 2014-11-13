sudo docker ps | awk 'NR > 1 {print $1}' | xargs sudo docker stop
sudo docker ps -a | awk 'NR > 1 {print $1}' | xargs sudo docker rm -f

sudo docker stop splunk
sudo docker stop logger
sudo docker rm splunk
sudo docker rm logger

sudo docker build -t logger ./client-logger
sudo docker build -t splunk ./splunk-forwarder
# --no-cache

sudo docker run -p 4500:4500 -p 4443:4443 --name logger -d logger 
sudo docker run --volumes-from logger --name splunk -itd splunk
