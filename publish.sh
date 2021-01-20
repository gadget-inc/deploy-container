#!/usr/bin/env bash
set -ex

export TAG=$(cat VERSION)
docker push gadgetinc/deploy-container:$TAG
docker push gadgetinc/deploy-container:latest