#!/usr/bin/env bash
set -ex

docker build --build-arg BASE_IMAGE=circleci/ruby:2.7.1 -t superpro/deploy-container:2.7.1 .
docker push superpro/deploy-container:2.7.1