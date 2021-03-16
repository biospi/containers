#!/bin/bash
set -e

port=$1
[ $# -eq 0 ] && { echo "Usage: $0 <jupyter host port>"; exit 1; }

nvidia-docker run -p $port:8888 --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 --gpus all -it --rm  bristol.ac.uk/hdruk-sw/clairvoyance:latest
