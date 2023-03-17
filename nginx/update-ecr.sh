#!/bin/bash
IMAGE = Hello
AWS_REGION = us-east-1
AWS_ACCOUNT_ID = 932999788441
AWS_SERVER = $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
TAG_LATEST = $AWS_SERVER/$IMAGE:latest
#build:
docker image build --cache-from $TAG_LATEST -t $TAG_LATEST .
#login:
aws ecr get-login-password | docker login --username AWS --password-stdin $(AWS_SERVER)

#push: build loging
docker push $(TAG_LATEST)