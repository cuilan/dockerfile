#!/usr/bin/env bash

set -ex

function build_alpine3_18() {
    export REG_HOST=reg.cuilan.com
    export APP_NAME=alpine
    export TAG=3.18
    .ci/docker.sh -f alpine/Alpine3_18
}

function build_alpine3_19() {
    export REG_HOST=reg.cuilan.com
    export APP_NAME=alpine
    export TAG=3.19
    .ci/docker.sh -f alpine/Alpine3_19
}

function build_alpine3_20() {
    export REG_HOST=reg.cuilan.com
    export APP_NAME=alpine
    export TAG=3.20
    .ci/docker.sh -f alpine/Alpine3_20
}

build_alpine3_18
build_alpine3_19
build_alpine3_20
