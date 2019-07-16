#!/bin/bash

# copy static.ref to static (can be external mount
echo "Copying static utils"
cp -a /Bismuth/static.ref/. /Bismuth/static/

# copy custom files to Bismuth (config_custom.txt)
echo "Copying custom files"
cp /custom/*.* /Bismuth

# TODO: bootstrap with the right util if no db is there
echo "Bootstrapping (todo)"

# TODO: if peers or suggested peers is too small, copy over from dist "bak" folder.

cd /Bismuth
echo "Starting Bismuth Node"
python node.py
