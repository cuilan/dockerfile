#!/bin/bash

docker build -t ubuntu-ssh:20.04 .

#docker run --name ussh -p 23:22 -d ubuntu-ssh:20.04