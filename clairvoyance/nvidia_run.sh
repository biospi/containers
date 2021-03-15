#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
nvidia-docker run --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 --gpus all -it --rm  bristol.ac.uk/hdruk-sw/clairvoyance:latest 
