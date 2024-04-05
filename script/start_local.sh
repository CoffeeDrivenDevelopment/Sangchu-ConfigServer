#!/bin/sh

##########
# ENV
##########

export IMAGE_NAME='cdd/config-server'
export TAG_NAME='0.0.1'
export DOCKER_CONTAINER_NAME='cdd_config_server'

##########
# BootJar
##########

echo '🚀 Start Eureka Quick Starter'

sh boot_jar.sh

##########
# Docker Local Image Build
##########

sh build_local_image.sh

##########
# Start Docker Image
##########

echo '\n🐬Start Local Docker Container'

docker rm -f $DOCKER_CONTAINER_NAME

docker run -d \
-e PROFILE=local \
--name $DOCKER_CONTAINER_NAME \
-p 8888:8888 \
$IMAGE_NAME:$TAG_NAME