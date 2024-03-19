#!/bin/bash

# Log in to Docker Hub
echo "Logging in to Docker Hub..."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin docker.io

# Push the Docker image to Docker Hub
echo "Pushing Docker image to Docker Hub..."
docker push "$DOCKER_CAPSTONE_IMAGE"

echo "Deployment to Docker Hub completed."
