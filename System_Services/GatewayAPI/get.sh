#!/bin/bash

# Importing the source link and extract the version
VERSION=$(echo "$(cat source.txt)" | grep -o "v[0-9]\+\.[0-9]\+\.[0-9]\+")

# Download the source yaml file
curl -sSL $(cat source.txt) -o "gateway-api-standard-$VERSION.yaml"