# Custom Jenkins
## Build Image:
```
sudo docker build --tag=custom-jenkins .
```
## Run jenkins image:
```
sudo docker run --name custom-jenkins-container -d -p 8080:8080 -p 3030:3030 -v /var/run/docker.sock/:/var/run/docker.sock custom-jenkins
```
## Integrated softwares
|Software|version|
|--------|-------|
|Git|Latest|
|Vim|Latest|
|Docker CLI|Latest|
|Node|14.x|
|Maven|3.6.3|
|Jmeter|5.2|
|Chrome|Latest|
|Allure|2.7.0|
|Sonar Scanner|3.6.3|
|Maven|4.4.0.2170|

