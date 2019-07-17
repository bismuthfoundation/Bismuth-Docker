#!/bin/bash

# copy custom files to Bismuth (config_custom.txt)
echo "Copying custom files"
cp /custom/wallet-server/*.* /WalletServer/

cd /WalletServer
echo "Starting Regular Wallet server"
python wallet_server.py
