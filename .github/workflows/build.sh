#!/bin/bash

set -e

BUILD_NUMBER="$(git rev-list --count $(git rev-parse --abbrev-ref HEAD))"
GITHUB_USERNAME="monotek"
DOCKER_REGISTRY="index.docker.io"
DOCKER_REPOSITORY="fluentd-elasticsearch"

echo "Build Docker image with tag / build number ${BUILD_NUMBER} for DockerHubs ${DOCKER_REGISTRY}/${GITHUB_USERNAME}/${DOCKER_REPOSITORY} repo"

echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

docker build --pull --no-cache -t ${DOCKER_REGISTRY}/${GITHUB_USERNAME}/${DOCKER_REPOSITORY}:latest -t ${DOCKER_REGISTRY}/${GITHUB_USERNAME}/${DOCKER_REPOSITORY}:${BUILD_NUMBER} .

docker push ${DOCKER_REGISTRY}/${GITHUB_USERNAME}/${DOCKER_REPOSITORY}:${BUILD_NUMBER}
docker push ${DOCKER_REGISTRY}/${GITHUB_USERNAME}/${DOCKER_REPOSITORY}:latest
