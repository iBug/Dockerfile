#!/bin/sh

set -e

docker build -t slurm-build .

mkdir -p output/
docker run --rm \
  --user "$(id -u):$(id -g)" \
  -v "$PWD/output:/output" \
  slurm-build \
  cp -avf /src/ /output/
