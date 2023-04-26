#!/bin/bash

set -e

REGISTRY=registry.nas.local.abbottland.io
IMAGE=drone-node-gh-cli
TAG=latest
BASE_IMAGE="node:18"


docker build \
    -f ./Dockerfile \
    -t $REGISTRY/$IMAGE:$TAG \
    --build-arg BASE_IMAGE=$BASE_IMAGE \
    . 

docker push $REGISTRY/$IMAGE:$TAG