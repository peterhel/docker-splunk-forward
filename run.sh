sudo docker ps | awk 'NR > 1 {print $1}' | xargs sudo docker stop
sudo docker ps -a | awk 'NR > 1 {print $1}' | xargs sudo docker rm -f

sudo docker build --no-cache -t logger ./client-logger
sudo docker build --no-cache -t splunk ./splunk-forwarder

sudo docker run -p 4500:4500 -p 4443:4443 --name logger -d logger 
sudo docker run --volumes-from logger --name splunk -itd splunk
