#!/bin/bash

# copy custom files to Bismuth (config_custom.txt)
echo "Copying custom files"
cp /custom/websocket-server/*.* /WalletServer/

cd /WalletServer
echo "Starting WebSocket Wallet server"
python wallet_websocket.py
