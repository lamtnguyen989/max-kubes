#!/bin/bash

### Note that this script is simply a cURL script that download the base yaml file  ###

curl -sSL -o metrics-server-components.yaml $(cat source.txt)
