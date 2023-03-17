#!/bin/bash
REPO_NAME="docker_ecr_repo"
ECR_ACCOUNT="932999788441.dkr.ecr.eu-east-1.amazonaws.com"
ECR_REPO="${ECR_ACCOUNT}/${REPO_NAME}"
docker build --cache-from "${ECR_REPO}" -t "${ECR_REPO}" .
aws ecr get-login --region us-east-1  | sed -e 's/^.*-p \(.*\)\s\-\e.*$/\1/' |  docker login --password-stdin -u AWS ${ECR_ACCOUNT}


# Get the image id of the Docker build. If there is a "latest" use that else get the first without latest

TAG=`docker images | grep -w "${REPO_NAME}" | grep latest | awk '{ print $3; }'`
if [[ -z ${TAG} ]]; then
        TAG=`docker images | grep -w "${REPO_NAME}" | awk '{ print $3; }'`
fi
 
docker tag "$TAG" "${ECR_REPO}"
docker push "${ECR_REPO}"