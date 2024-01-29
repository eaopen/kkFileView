#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change to the parent directory if in */script/docker
if [[ "$DIR" == *"script/docker"* ]]; then
  cd ./../..
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

## mvn
# mvn clean
# mvn install -DskipTests=true



## docker build

artifactId=kkfileview
version=4.4-beta
#version=$(date +%F)

docker build .  --tag ${artifactId}:${version}
docker tag  ${artifactId}:${version}  ${artifactId}:latest

## docker push

#LOGIN_FILE_PATH="${DIR}/openea-docker-login.sh"
#if [ -f "$LOGIN_FILE_PATH" ]; then
#  sh $LOGIN_FILE_PATH
#fi
#
#repsBase=openea-docker.pkg.coding.net/reps/docker
#docker tag ${artifactId}:${version}  ${repsBase}/${artifactId}:${version}
#docker push ${repsBase}/${artifactId}:${version}
#docker tag ${artifactId}:${version}  ${repsBase}/${artifactId}:latest
#docker push ${repsBase}/${artifactId}:latest
