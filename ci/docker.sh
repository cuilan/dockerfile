#!/usr/bin/env bash

set -ex

REG_HOST=${REG_HOST:-""}
CONF_PATH=${CONF_PATH:-"."}
SRC_PATH=${SRC_PATH:-"."}
BUILD_HOST=${BUILD_HOST:-"unix:///var/run/docker.sock"}
DOCKERFILE=${DOCKERFILE:-"./ci/Dockerfile"}

while getopts "c:h:f:s:" OPT; do
    case $OPT in
        c)
            CONF_PATH=$OPTARG;;
        h)
            BUILD_HOST=$OPTARG;;
        f)
            DOCKERFILE=$OPTARG;;
        s)
            SRC_PATH=$OPTARG;;
        *)
    esac
done

export IMAGE_NAME=${REG_HOST}/base/${APP_NAME}:${TAG}
export LATEST_IMAGE_NAME=${REG_HOST}/base/${APP_NAME}:latest

# build
cat ${DOCKERFILE} \
    | sed "s@{{REG_HOST}}@${REG_HOST}@g" \
    | docker -H ${BUILD_HOST} build -t ${IMAGE_NAME} \
        --build-arg CONF_PATH="${CONF_PATH}" \
        --build-arg SRC_PATH="${SRC_PATH}" \
        -f - .

# login
#docker -H ${BUILD_HOST} login ${REG_HOST} -u ${REG_USER} -p ${REG_PWD}

# push
docker -H ${BUILD_HOST} tag ${IMAGE_NAME} ${LATEST_IMAGE_NAME}
docker -H ${BUILD_HOST} push ${IMAGE_NAME}
docker -H ${BUILD_HOST} push ${LATEST_IMAGE_NAME}

# 本地运行不用删
#docker -H ${BUILD_HOST} rmi ${IMAGE_NAME}
#docker -H ${BUILD_HOST} rmi ${LATEST_IMAGE_NAME}

echo "Build image success --> ${IMAGE_NAME}"
