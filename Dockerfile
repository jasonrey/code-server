FROM codercom/code-server

RUN sudo apt-get update && sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

RUN sudo apt-key fingerprint 0EBFCD88 && sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN sudo apt-get update && sudo apt-get install -y docker-ce-cli

USER root

WORKDIR /projects

VOLUME /var/run/docker.sock
VOLUME /projects

ENV color_prompt yes
