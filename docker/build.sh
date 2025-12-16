#!/usr/bin/env bash
# author: Daniel Rode
# dependencies:
#   podman 5.7.0
# created: 16 Dec 2025


# Build 3D Forest Docker container


cd "$(dirname "$0")"
podman build -t 3d-forest .
