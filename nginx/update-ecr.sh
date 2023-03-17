#!/bin/bash
REPO_NAME="docker_ecr_repo"
ECR_ACCOUNT="932999788441.dkr.ecr.eu-east-1.amazonaws.com"
ECR_REPO="${ECR_ACCOUNT}/${REPO_NAME}"
TAG="docker_ecr_repo"

#aws ecr get-login-password --region us-east-1  | sed -e 's/^.*-p \(.*\)\s\-\e.*$/\1/' |  docker login --password-stdin -u AWS ${ECR_REPO}

aws ecr get-login-password --region us-east-1  | sed -e 's/^.*-p \(.*\)\s\-\e.*$/\1/' |  docker login --password-stdin -u AWS 932999788441.dkr.ecr.us-east-1.amazonaws.com/docker_ecr_repo
docker build -t "${TAG}" .
docker tag "${TAG}":latest 932999788441.dkr.ecr.us-east-1.amazonaws.com/docker_ecr_repo:latest
# Get the image id of the Docker build. If there is a "latest" use that else get the first without latest
docker tag "${TAG}" "${ECR_REPO}"
docker push "${ECR_REPO}"