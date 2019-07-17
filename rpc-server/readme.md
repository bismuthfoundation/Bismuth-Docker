# Bismuth-json-rpc image

Docker image hosted on docker hub, https://cloud.docker.com/repository/docker/eggdrasyl/bismuth-json-rpc

`docker pull eggdrasyl/bismuth-json-rpc:latest`

The native Bismuth protocol is the prefered way to interact with a Bismuth node:  
See the native Bismuth RPC and API, with clients for several languages,at https://github.com/bismuthfoundation/BismuthAPI

However, an attempt has been made to provide a Json-rpc server, as close as possible to bitcoind implementation.

## Pre-requisites

- Functional docker install
- Minimal knowledge of Docker, docker mounts and networking
- Running container on host, with https://github.com/bismuthfoundation/Bismuth-Docker/tree/master/node

## Config

The image supports Three mount points, for ledger db, extra config and for the wallet files.

### .wallet mount point

Thid will hold the wallet files and private keys. This is sensitive info.  
Here, we will suppose it's located, on the host, at /.wallet.  
This mount point does not need any content, the node container will fill it.

`mkdir -p /.wallet`

### /Bismuth/static mount point

This is the ledger db mountt point, feeded by the node image.
Here, we will suppose it's located, on the host, at /static.  
It will be mounted to /Bismuth/static/ within the container. This is the SAME host path to be used for both containers.

This mount point does not need any content, the node container will fill it.

`mkdir -p /static`

### /custom

This will store extra files needed for config.  
Here, we will suppose it's located, on the host, at /custom.  
Files placed in /custom/rpc-server will be *copied* to the RPCServer dir within the container at every start, and override files that could be there.

This directory is used for custom config.

This directory needs a single file, `config_custom.txt`, which is the user bismuth config file.   
This file can be empty, but for a maximum compatibility with the other images, please use the following settings:

`mkdir -p /custom/rpc-server`

`nano /custom/rpc-server/bismuthd.conf`
paste:  
```
## Auth settings ##
rpcuser=username
rpcpassword=password
## Bismuth node
# IP use ip:port format. Default Bismuth port is 5658
bismuthnode = 1.2.3.4:5658
# relative path to the node directory
bismuthpath = /Bismuth/
rpcport=8115
rpcallowip=1.2.3.4
verbose=0
```
**Take care to REPLACE** 1.2.3.4 (twice) with the real ip to access the bismuth node image from within the container.  
This is likely to be the public host ip.  
Replace rpcuser and password to your liking.  
Then ctrl-x, y, enter

See https://github.com/EggPool/BismuthRPC/blob/master/RPCServer/bismuthd.default.conf for an example of a full config

## Run

For a host with a single IP, you just need to run with mounts and port forwarding (default=8115), like:  
`docker run -d -v /custom:/custom -v /static:/Bismuth/static -v /.wallet:/BismuthRPC/RPCServer/.wallet -p 8115:8115 --name bisrpc bismuth-json-rpc:latest`


## Sample extra commands

This supposes the container is named "bisrpc"

### Stop the rpc server

`docker stop bisrpc`  

### See docker logs

`docker logs -f bisrpc`  
ctrl-c to stop

### Test rpc server from the host

(Adjust)  
`curl -d '{ "jsonrpc": "2.0", "method":"getinfo", "id":1}' http://username:password@1.2.3.4:8115/`

### Run an interactive shell in the container

Bash was added to the image:

`docker exec -it bisrpc /bin/bash`  

`exit` to go back to the host.

## Devs: build the image

Comes with a makefile:  
- make build  
- make build-nc  (no cache)  
- publish

Edit makefile for version prior to publish.

# Help

- Head over to our Discord for any help: https://discord.gg/8KvA3JU
- Github repo (json-rpc server) https://github.com/EggPool/BismuthRPC
