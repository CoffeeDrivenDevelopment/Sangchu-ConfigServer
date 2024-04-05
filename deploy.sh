#!/bin/sh

##########
# ENV
##########

export CONFIG_SERVER_IMAGE_NAME="cdd/config-server"
export CONFIG_SERVER_TAG_NAME="0.0.1"

##########
# Build CONFIG Server Image
##########

echo "\n🗑 Start Delete Docker Files"

if docker image inspect $CONFIG_SERVER_IMAGE_NAME:$CONFIG_SERVER_TAG_NAME &> /dev/null; then
    docker image rm -f $CONFIG_SERVER_IMAGE_NAME:$CONFIG_SERVER_TAG_NAME
fi

echo "\n🔨 Start Build Docker Image"

docker build \
-t $CONFIG_SERVER_IMAGE_NAME:$CONFIG_SERVER_TAG_NAME .

##########
# CONFIG Server Container Start
##########

if [ "$(docker ps -aq -f name=$CONFIG_SERVER_NAME)" ]; then
    echo "🚫 Stop Docker Container : "
    docker rm -f $CONFIG_SERVER_NAME
else
    echo "🚫 There is no running container named $CONFIG_SERVER_NAME"
fi

echo "🚀 Docker $CONFIG_SERVER_NAME Container Start! : "
docker run -d \
--name $CONFIG_SERVER_NAME \
-p $CONFIG_SERVER_PORT:$CONFIG_SERVER_PORT \
-e PROFILE=$CONFIG_SERVER_PROFILE \
$CONFIG_SERVER_IMAGE_NAME:$CONFIG_SERVER_TAG_NAME