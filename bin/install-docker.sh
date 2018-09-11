#!/bin/bash -xe

for i in $(seq 1 3); do
    vagrant ssh server$i -c "sudo apt install -y \
         apt-transport-https \
         ca-certificates \
         curl \
         software-properties-common \
     && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
     && sudo apt-key fingerprint 0EBFCD88 \
     && sudo add-apt-repository \
            \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" \
     && sudo apt update \
     && sudo apt install -y docker-ce"
done
