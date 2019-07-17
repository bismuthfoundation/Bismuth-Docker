#!/bin/bash

# copy custom files to Bismuth (config_custom.txt)
echo "Copying custom files"
cp /custom/rpc-server/*.* /BismuthRPC/RPCServer/

cd /BismuthRPC/RPCServer/
echo "Starting JSon-RPC server"
python bismuthd.py
