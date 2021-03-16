#!/bin/bash
set -e

port=$1
[ $# -eq 0 ] && { echo "Usage: $0 <jupyter host port>"; exit 1; }

docker run -p $port:8888 -it --rm  bristol.ac.uk/hdruk-sw/clairvoyance:latest
