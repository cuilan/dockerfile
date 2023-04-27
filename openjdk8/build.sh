#!/usr/bin/env bash

set -e

docker build -t my-java-app .

docker run -it --rm --name my-running-app my-java-app

docker rmi my-java-app

