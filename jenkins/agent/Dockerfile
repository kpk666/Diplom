FROM jenkins/agent:latest

USER root
RUN apt-get update && apt-get install -y gettext-base
RUN mkdir -p /home/jenkins/.kube && chown -R jenkins /home/jenkins/.kube
COPY ./docker-compose /usr/local/lib/docker/cli-plugins/docker-compose
RUN chmod +x /usr/local/lib/docker/cli-plugins/docker-compose 
COPY ./docker-compose /usr/bin/docker-compose
RUN chmod +x /usr/bin/docker-compose
COPY ./docker-machine /usr/local/bin/docker-machine
RUN chmod +x /usr/local/bin/docker-machine
COPY ./docker-machine-wrapper.bash /home/jenkins/docker-machine-wrapper.bash
RUN cd /home/jenkins \
    source ./docker-machine-wrapper.bash into .bashrc
COPY ./get_helm.sh /home/jenkins/get_helm.sh
RUN chmod 700 ./get_helm.sh
RUN ./get_helm.sh
USER jenkins
RUN cd /home/jenkins \ 
    source ./docker-machine-wrapper.bash into .bashrc
COPY ./Ast-key-west.pem /home/jenkins/Ast-key-west.pem