# Bismuth-Docker
Build Docker images of Bismuth services

This is the repository the team uses to build the docker images at https://cloud.docker.com/repository/list

Check each directory for a more comprehensive readme of every image.

## Node

A node only image, with optional mount volume for db data.  
This image - running - is a pre-requisite for the images above.

## Wallet-server

A wallet server image, runs along a node image.

## Websocket-server

A websocket wallet server image, runs along a node image.  
Both a wallet and websocket wallet can run side by side.

## RPC-Server

A json-rpc server, runs along with a node image.  
Usually run by an exchange, on a private network.

# Help

Head over to our Discord for any help: https://discord.gg/8KvA3JU
