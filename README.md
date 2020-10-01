# custom-jenkins-poc
# Build Image:
sudo docker build --tag=custom-jenkins .
# Run jenkins image:
sudo docker run --name custom-jenkins-container -d -p 8080:8080 -p 3030:3030 -v /var/run/docker.sock/:/var/run/docker.sock custom-jenkins
