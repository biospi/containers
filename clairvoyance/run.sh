#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )" #
pushd $DIR > /dev/null

# download MIMIC-III
#wget -r -N -c -np --user $1 --ask-password https://physionet.org/files/mimiciii/1.4/

# clone mimic-code repository
# git clone https://github.com/MIT-LCP/mimic-code

if [ -d "$DIR/pgdata" ]; then sudo rm -Rf $DIR/pgdata; fi
mkdir -p pgdata

pushd docker > /dev/null
docker container stop hdruk-sw:20.11-tf1-py3 || true
docker rm hdruk-sw:20.11-tf1-py3 || true
docker build --no-cache -t hdruk-sw:20.11-tf1-py3_clairvoyance .

# nvidia-docker run \
#   --shm-size=1g \
#   --ulimit memlock=-1 \
#   --ulimit stack=67108864 \
#   --gpus all \
#   -it \
#   --rm \
#   -v $DIR/physionet.org/files/mimiciii/1.4:/mimic_data \
#   -v $DIR/pgdata:/var/lib/postgresql/data \
#   -e BUILD_MIMIC=1 \
#   -e POSTGRES_PASSWORD=postgres \
#   -e MIMIC_PASSWORD=mimic \
#   hdruk-sw:20.11-tf1-py3


# nvidia-docker run \
# -p 5555:5432 \
# -e BUILD_MIMIC=1 \
# -e POSTGRES_PASSWORD=postgres \
# -e MIMIC_PASSWORD=mimic \
# -v $DIR/physionet.org/files/mimiciii/1.4:/mimic_data \
# -v $DIR/pgdata:/var/lib/postgresql/data \
# --shm-size=1g \
# --ulimit memlock=-1 \
# --ulimit stack=67108864 \
# --gpus all \
# -it \
# -d hdruk-sw



# nvidia-docker run --name hdruk-sw \
# -p 5555:5432 \
# -e BUILD_MIMIC=1 \
# -e POSTGRES_PASSWORD=postgres \
# -e MIMIC_PASSWORD=mimic \
# -v $DIR/physionet.org/files/mimiciii/1.4:/mimic_data \
# -v $DIR/pgdata:/var/lib/postgresql/data \
# --shm-size=1g \
# --ulimit memlock=-1 \
# --ulimit stack=67108864 \
# --gpus all \
# -it \
# -d hdruk-sw


# -v $DIR:/workspace/clairvoyance 


#popd

