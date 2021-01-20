#!/usr/bin/env bash
set -ex

export TAG=$(cat VERSION)
docker build -t gadgetinc/deploy-container:$TAG .
docker tag gadgetinc/deploy-container:$TAG gadgetinc/deploy-container:latest