# Bismuth-node image

Docker image hosted on docker hub, https://cloud.docker.com/repository/docker/eggdrasyl/bismuth-node

`docker pull eggdrasyl/bismuth-node:latest`

## Pre-requisites

- functional docker install
- 

## Config

## Run


## Sample commands

This supposes the container is named "bistest1"

### Clean stop the node

`docker exec bistest1 /stop.sh`

### See dpcker logs

docker logs -f bistest1

### See node logs

docker exec bistest1 tail -f /Bismuth/node.log

### Get node status

`docker exec bistest1 commands.py statusget`

(others commands from commandS.py can be run the same way)

## Devs: build the image

Comes with a makefile:  
- make build  
- make build-nc  (no cache)  
- publish

Edit makefile for version prior to publish
