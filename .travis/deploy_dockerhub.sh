#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t hpistor/cicd-python:$TAG .
docker push hpistor/cicd-python:$TAG