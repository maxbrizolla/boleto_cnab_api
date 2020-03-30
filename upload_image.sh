#!/bin/bash

docker save maxbrizolla/boleto_api:latest | bzip2 | pv | \
     ssh -i ~/.ssh/id_maxbrizolla_digitalocean root@192.81.217.239 'bunzip2 | docker load'



#acesso ssh
#ssh -i ~/.ssh/id_producao.pem ec2-user@ec2-54-233-240-33.sa-east-1.compute.amazonaws.com