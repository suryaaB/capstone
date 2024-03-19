#!/bin/bash

IMAGE_NAME="my-react-app"
DOCKER_USERNAME="suryaa05"
docker login -u $DOCKER_USERNAME -p dckr_pat_NZiazd1UpDiiMVDwt0dExnj8TcA

build_and_push_image() {
    docker build -t $DOCKER_USERNAME/prod
    docker push $DOCKER_USERNAME/prod
}
build_and_push_image_dev() {
    docker build -t $DOCKER_USERNAME/dev
    docker push $DOCKER_USERNAME/dev
}


if [ "$GIT_BRANCH" = "dev" ]; then
    build_and_push_image_dev
elif [ "$GIT_BRANCH" = "master" ]; then
    build_and_push_image 
else
    echo "Error: Invalid branch. The supported branches are 'dev' and 'master'."
    exit 1
fi

