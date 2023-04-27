#!/usr/bin/env bash

NOCACHE="$1"
CACHE_CMD=""

IMAGE_LIST="17-jre"
# IMAGE_LIST="8-jre 8-jdk 11-jre 11-jdk 17-jre 17-jdk"

if [ "${NOCACHE}" == "nocache" ]; then
    CACHE_CMD="--no-cache"
fi

function build(){
    for base_image in ${IMAGE_LIST}; do
        info "building eclipse-temurin ${base_image}..."
        sed "s@{{BASE_IMAGE}}@eclipse-temurin:${base_image}@g" Dockerfile | docker build -t reg.weattech.com/base/eclipse-temurin:${base_image} -f - . ${CACHE_CMD}
        # docker push reg.weattech.com/base/eclipse-temurin:${base_image}
    done
}

function info(){
    echo -e "\033[32mINFO: $@\033[0m"
}

function warn(){
    echo -e "\033[33mWARN: $@\033[0m"
}

function err(){
    echo -e "\033[31mERROR: $@\033[0m"
}

build
