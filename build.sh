#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <image_name>"
    exit 1
fi

image_name="my-react-app"

docker build -t $image_name .


