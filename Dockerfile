FROM jenkins/jenkins
USER root
RUN apt-get update 
#install git
RUN apt-get -y install git
#install vim
RUN apt-get -y install vim
#install docker cli
RUN curl -sSL https://get.docker.com/ | sh
#install Node
RUN apt-get -y install curl software-properties-common
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get -y install nodejs
#install Maven
RUN wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -P /tmp
RUN tar xf /tmp/apache-maven-3.6.3-bin.tar.gz -C /opt
RUN ln -s /opt/apache-maven-3.6.3 /opt/maven
#install apache jmeter
RUN wget -c http://ftp.ps.pl/pub/apache//jmeter/binaries/apache-jmeter-5.2.tgz -P /tmp
RUN tar -xf /tmp/apache-jmeter-5.2 -C /opt
RUN ln -s /opt/apache-jmeter-5.2 /opt/jmeter
#env variables
ENV JAVA_HOME=/usr/local/openjdk-8/
ENV M2_HOME=/opt/maven
ENV MAVEN_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}
#install Chrome.
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -y update
RUN apt-get -y install google-chrome-stable
#install allure
RUN wget -O allure.zip https://github.com/allure-framework/allure2/releases/download/2.7.0/allure-2.7.0.zip
RUN unzip allure.zip -d /opt/  
RUN ln -s /opt/allure-2.7.0 /opt/allure
#install jenkins plugins
WORKDIR /app
COPY jenkins-plugin.list /app
RUN /usr/local/bin/install-plugins.sh < jenkins-plugin.list
#configure global config
COPY jenkins.yaml /var/jenkins_home/
RUN usermod -a -G root jenkins
