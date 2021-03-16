#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

user=$1
[ $# -eq 0 ] && { echo "Usage: $0 <physionet.org username>"; exit 1; }

( cd "$DIR/docker"
  wget -r -N -c -np --user $user --ask-password https://physionet.org/files/mimiciii/1.4/
  docker build -t bristol.ac.uk/hdruk-sw/clairvoyance:latest . )
