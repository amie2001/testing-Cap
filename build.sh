#!/bin/bash

# Stop and remove the existing container if it exists
docker stop capCont || true
docker rm capCont || true

#login into DockerHub:
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

#building a image:
docker build -t capstone .

#running a container from the created image:
docker run -d -it --name capCont -p 80:80 capstone

#pushing the image to dockerhub:
docker tag capstone  pavi2244/capstone
docker push pavi2244/capstone
