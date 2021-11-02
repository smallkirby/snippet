#!/bin/sh
docker ps -a | tail -n+2 | awk -F" " '{print $1}' | xargs docker stop
