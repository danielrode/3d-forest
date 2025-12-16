#!/usr/bin/env bash
# author: Daniel Rode
# dependencies:
#   podman 5.7.0
#   remmina
# created: 16 Dec 2025


# Run locally build containerized version of 3D Forest


podman run --rm -it -p 5900:5900 -v ./dropper:/dropper 3d-forest:latest
remmina --connect vnc://localhost:5900
