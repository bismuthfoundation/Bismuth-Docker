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
Here, we will suppose it's located, on the host, at /static.  
It will be mounted to /Bismuth/static/ within the container.

This mount point does not need any content, the container will fill it.

`mkdir -p /static`

### /custom

This will store extra files needed for config.  
Here, we will suppose it's located, on the host, at /Bismuth/static.  
Files placed here will be *copied* to /Bismuth within the container at every start, and override files that could be there.

This directory is used for custom config, peers list and specific issues.

This directory needs a single file, `config_custom.txt`, which is the user bismuth config file.   
This file can be empty, but for a maximum compatibility with the other images, please use the following settings:

`mkdir -p /custom`

`nano /custom/config_custom.txt`
paste:  
```
mempool_ram=False
mempool_path=/Bismuth/static/mempool.db
```
then ctrl-x, y, enter

This will allow to share the mempool with other containers, needed for walelt servers and json-rpc images.

## Run

For a host with a single IP, you just need to run with mounts and port forwarding (default=5658), like:  
`docker run -d -v /custom:/custom -v /static:/Bismuth/static -p 5658:5658 --name bistest1 eggdrasyl/bismuth-node:latest`

> Note:
For hosts with several fail over ips, you need more knownledge of docker networking to do it clean.  
After configuring nat, bridges, docker networks, the command would be like  
`docker run -d -v /custom:/custom -v /static:/Bismuth/static -p 1.2.3.4:5658:5658 --net bridge-1 --ip 192.168.10.3 --name bistest1 eggdrasyl/bismuth-node:latest`  
**Warning**: We won't support docker network config. Only use if you know enough of docker and networking to make it work both ways (ingoing AND outgoing tcp flow)


## Sample extra commands

This supposes the container is named "bistest1"

### Clean stop the node

`docker exec bistest1 /stop.sh`  
Better than stopping via docker, ensures a clean state of the DB.

### See docker logs

`docker logs -f bistest1`  
ctrl-c to stop

### See node logs

`docker exec bistest1 tail -f /Bismuth/node.log`  
ctrl-c to stop

### Get node status

`docker exec bistest1 commands.py statusget`

(others commands from commands.py can be run the same way)

### Run an interactive shell in the container

Bash was added to the image:

`docker exec -it bistest1 /bin/bash`  
Default location will be /Bismuth. `exit` to go back to the host.

## Devs: build the image

Comes with a makefile:  
- make build  
- make build-nc  (no cache)  
- publish

Edit makefile for version prior to publish.

# Help

Head over to our Discord for any help: https://discord.gg/8KvA3JU
