FROM jenkins/jenkins
USER root
RUN apt-get update
#install Node
RUN apt-get -y install curl software-properties-common
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get -y install nodejs
#install Maven
RUN wget https://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz -P /tmp
RUN tar xf /tmp/apache-maven-3.6.0-bin.tar.gz -C /opt
RUN ln -s /opt/apache-maven-3.6.0 /opt/maven
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV M2_HOME=/opt/maven
ENV MAVEN_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}
#install jenkins plugins
WORKDIR /app
COPY jenkins-plugin.list /app
RUN /usr/local/bin/install-plugins.sh < jenkins-plugin.list
RUN usermod -a -G root jenkins
