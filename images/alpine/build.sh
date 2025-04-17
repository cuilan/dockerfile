#!/usr/bin/env bash

set -ex

# 设置通用环境变量
export REG_HOST=
export APP_NAME=alpine

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/../../" && pwd )"

function build_alpine() {
    local version=$1
    local maintainer=$2
    export TAG=$version
    export ALPINE_VERSION=$version
    export MAINTAINER="$maintainer"
    
    # 使用 envsubst 替换模板中的变量
    envsubst < "$SCRIPT_DIR/Dockerfile.template" > "$SCRIPT_DIR/Dockerfile"
    
    # 调用构建脚本
    "$PROJECT_ROOT/.ci/docker.sh" -f "$SCRIPT_DIR/Dockerfile"
}

# 构建所有版本
build_alpine 3.18 "zhangyan <17746598041@163.com>"
build_alpine 3.19 "zhangyan <17746598041@163.com>"
build_alpine 3.20 "zhangyan <17746598041@163.com>"
build_alpine 3.21 "zhangyan <17746598041@163.com>"
