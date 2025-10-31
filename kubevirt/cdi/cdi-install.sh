#!/bin/bash

# Grab latest version
export VERSION=$(curl -s https://api.github.com/repos/kubevirt/containerized-data-importer/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# Download operator and cr yaml files for the CDI
curl -sSL https://github.com/kubevirt/containerized-data-importer/releases/download/$VERSION/cdi-operator.yaml -o cdi-operator.yaml
curl -sSL https://github.com/kubevirt/containerized-data-importer/releases/download/$VERSION/cdi-cr.yaml -o cdi-cr.yaml