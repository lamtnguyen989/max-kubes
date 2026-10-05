#!/usr/bin/env bash

VERSION=0.4.0

curl -fsSL https://github.com/bitnami/sealed-secrets/releases/download/v0.40.0/controller.yaml \
        -o kubeseal_${VERSION}.yaml
