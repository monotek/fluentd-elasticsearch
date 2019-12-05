#!/bin/bash

set -e

BUILD_NUMBER="$(git rev-list --count $(git rev-parse --abbrev-ref HEAD))"

echo "Build Docker image with tag / build number ${BUILD_NUMBER} for DockerHubs ${{ DOCKER_REGISTRY }}/${{ GITHUB_USERNAME }}/${{ DOCKER_REPOSITORY }} repo"
echo "${{ DOCKER_PASSWORD }}" | docker login -u "${{ DOCKER_USERNAME }}" --password-stdin

docker build --pull --no-cache -t ${{ secrets.DOCKER_REGISTRY }}/${{ secrets.GITHUB_USERNAME }}/${{ secrets.DOCKER_REPOSITORY }}:latest -t ${{ secrets.DOCKER_REGISTRY }}/${{ secrets.GITHUB_USERNAME }}/${{ secrets.DOCKER_REPOSITORY }}:${{ secrets.BUILD_NUMBER }} .

docker push ${{ secrets.DOCKER_REGISTRY }}/${{ secrets.GITHUB_USERNAME }}/${{ secrets.DOCKER_REPOSITORY }}:${{ secrets.BUILD_NUMBER }}
docker push ${{ secrets.DOCKER_REGISTRY }}/${{ secrets.GITHUB_USERNAME }}/${{ secrets.DOCKER_REPOSITORY }}:latest
