#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo 'Not specified a version/tag, assuming <latest>'
    exit 1
fi

if [ "$#" -lt 2 ]; then
    echo 'Not specified a version/tag, assuming <latest>'
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

image=$1
version='latest'

echo "image : ${image}, tag : ${version} "
docker build -f ${image}.Dockerfile -t dataismus/${image}:${version} . && \
docker push dataismus/${image}:${version}