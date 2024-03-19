#!/bin/bash

IMAGE_NAME="my-react-app"
DOCKER_USERNAME="suryaa05"
docker login -u $DOCKER_USERNAME -p dckr_pat_NZiazd1UpDiiMVDwt0dExnj8TcA

build_and_push_image() {
    local repo=$1
    docker build -t $DOCKER_USERNAME/$repo .
    docker push $DOCKER_USERNAME/$repo
    if [ $? -eq 0 ]; then
        echo "Image $IMAGE_NAME pushed successfully to $repo repository on Docker Hub."
    else
        echo "Error: Failed to push image $IMAGE_NAME to $repo repository on Docker Hub."
        exit 1
    fi
}

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <branch>"
    exit 1
fi

BRANCH=$1

if [ "$GIT_BRANCH" = "dev" ]; then
    build_and_push_image "dev"
elif [ "$GIT_BRANCH" = "master" ]; then
    build_and_push_image "prod"
else
    echo "Error: Invalid branch. The supported branches are 'dev' and 'master'."
    exit 1
fi

