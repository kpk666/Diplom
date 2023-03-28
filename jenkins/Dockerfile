FROM jenkins/jenkins:2.375.3
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli 
RUN apt-get install -y docker-compose-plugin 
 
COPY ./docker-compose /usr/local/lib/docker/cli-plugins/docker-compose
RUN chmod +x /usr/local/lib/docker/cli-plugins/docker-compose 
COPY ./docker-compose /usr/bin/docker-compose
RUN chmod +x /usr/bin/docker-compose

USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugin.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugin.txt