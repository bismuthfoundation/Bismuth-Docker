# Bismuth-node image

Docker image hosted on docker hub, https://cloud.docker.com/repository/docker/eggdrasyl/bismuth-node

`docker pull eggdrasyl/bismuth-node:latest`

## Pre-requisites

- Functional docker install
- Minimal knowledge of Docker, docker mounts and networking

## Config

The image supports two mount points, for ledger db and for extra config.

### /Bismuth/static mount point

This will store the ledger db. Expect it to need several GB of disk space.  
Here, we will suppose it's located, on the host, at /Bismuth/static.  
It will be mounted to /Bismuth/static/ within the container.

This mount point does not need any content, the container will fill it.

### /custom

This will store extra files needed for config.  
Here, we will suppose it's located, on the host, at /Bismuth/static.  
Files placed here will be *copied* to /Bismuth within the container at every start, and override files that could be there.

This directory is used for custom config, peers list and specific issues.

This directory needs a single file, `config_custom.txt`, which is the user bismuth config file.   
This file can be empty, but for a maximum compatibility with the other images, please use the following settings:

Host /custom/config_custom.txt:  
```
mempool_ram=False
mempool_path=/Bismuth/static/mempool.db
```
This will allow to share the mempool with other containers, needed for walelt servers and json-rpc images.

## Run


## Sample commands

This supposes the container is named "bistest1"

### Clean stop the node

`docker exec bistest1 /stop.sh`

### See dpcker logs

`docker logs -f bistest1`

### See node logs

`docker exec bistest1 tail -f /Bismuth/node.log`

### Get node status

`docker exec bistest1 commands.py statusget`

(others commands from commandS.py can be run the same way)

## Devs: build the image

Comes with a makefile:  
- make build  
- make build-nc  (no cache)  
- publish

Edit makefile for version prior to publish
