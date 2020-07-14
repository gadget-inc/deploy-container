#!/usr/bin/env bash
set -ex

docker build --build-arg BASE_IMAGE=circleci/ruby:2.7.1 -t gadgetinc/deploy-container:2.7.1 .
docker push gadgetinc/deploy-container:2.7.1