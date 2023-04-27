#!/usr/bin/env bash

set -e

for image_tag in 8-jdk-hotspot 8-jdk-openj9; do
    sed "s@{{BASE_IMAGE}}@reg.weattech.com/base/adoptopenjdk:${image_tag}@g" Dockerfile | docker build -t reg.weattech.com/base/javabuild:${image_tag} -f - .
    docker push reg.weattech.com/base/javabuild:${image_tag}
done
