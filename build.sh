#!/bin/bash

#login into DockerHub:
docker login -u $DOCKER_USERNAME -p $DOCKER_PASS

#building a image:
docker build -t capstone .

#running a container from the created image:
docker run -d -it --name capCont -p 80:80 capstone
