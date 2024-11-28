#!/bin/sh
set -e
docker build \
    --tag ubuntu-kernel-dev --file Dockerfile.kernel .
docker run \
    --rm \
    --interactive \
    --tty \
    --volume ./pep-dna:/usr/src/pep-dna \
    --volume ./linux:/usr/src/linux \
    ubuntu-kernel-dev:latest
