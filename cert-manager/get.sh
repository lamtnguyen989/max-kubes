#!/bin/bash

LINK=$(cat source.txt)
curl -sSL $LINK -o cert-manager.yaml