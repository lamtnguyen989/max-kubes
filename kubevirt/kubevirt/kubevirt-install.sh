#!/bin/bash

# Getting the latest stable release
export VERSION=$(curl https://storage.googleapis.com/kubevirt-prow/release/kubevirt/kubevirt/stable.txt)
echo $VERSION

# Download the operator file
curl -sSL https://github.com/kubevirt/kubevirt/releases/download/${VERSION}/kubevirt-operator.yaml -o kubevirt-operator.yaml
curl -sSL https://github.com/kubevirt/kubevirt/releases/download/$VERSION/kubevirt-cr.yaml -o kubevirt-cr.yaml