#!/bin/bash
#
# build docker image
#

set -ex

echo "Build Docker image with tag / travis build number ${TRAVIS_BUILD_NUMBER} for DockerHubs ${DOCKER_REGISTRY}/${GITHUB_USERNAME}/${DOCKER_REPOSITORY} repo"

docker build --pull --no-cache --build-arg BUILD_DATE=$(date -u +”%Y-%m-%dT%H:%M:%SZ”) -t ${DOCKER_REGISTRY}/${GITHUB_USERNAME}/${DOCKER_REPOSITORY}:latest -t ${DOCKER_REGISTRY}/${GITHUB_USERNAME}/${DOCKER_REPOSITORY}:${TRAVIS_BUILD_NUMBER} .

docker push ${DOCKER_REGISTRY}/${GITHUB_USERNAME}/${DOCKER_REPOSITORY}:latest
