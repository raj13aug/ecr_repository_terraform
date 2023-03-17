#!/bin/sh
AWS_REGION = "us-east-1"
AWS_ACCOUNT_ID = 932999788441
ECR_LOGIN=$(aws ecr get-login-password --region $AWS_REGION)
# Docker login to repository.
docker login --username AWS --password $ECR_LOGIN $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
IMAGE="hello"
# Create tag (which bundles image name and account ID).
TAG_LATEST=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE:latest
echo $TAG_LATEST
docker push $TAG_LATEST