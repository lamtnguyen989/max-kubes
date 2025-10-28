#!/bin/bash

# Importing the source link and extract the version
LINK=$(cat source.txt)
VERSION=$(echo $LINK | grep -o "v[0-9]\+\.[0-9]\+\.[0-9]\+")

# Download the source yaml file
curl -sSL $LINK -o "gateway-api-standard-$VERSION.yaml"