# this is using the TF1 base for clairvoyance
FROM nvcr.io/nvidia/tensorflow:20.11-tf1-py3

# install postgres, giving local users direct access
RUN apt-get update \ 
&& bash -c "install -m755 <(printf '#!/bin/sh\nexit 0') /usr/sbin/policy-rc.d" \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends postgresql postgresql-contrib libpq-dev \
&& service postgresql stop

# setup mimic-iii
COPY physionet.org physionet.org
RUN chmod -R o+rX physionet.org \
&& git clone https://github.com/MIT-LCP/mimic-code \
&& service postgresql start \
&& ( cd mimic-code/buildmimic/postgres/ \
&&   su postgres -c "make create-user mimic-gz datadir=/workspace/physionet.org/files/mimiciii/1.4/" ) \
&& service postgresql stop

# setup clairvoyance
RUN pip install 'gpyopt' 'keras-tcn' 'missingpy' 'torch>=1.1.0' 'pytorch-ignite' 'keras==2.3.1' 'numpy>=1.17.2' \
  'tqdm>=4.36.1' 'argparse>=1.1' 'scipy>=1.3.1' 'pandas>=0.25.1' 'scikit-learn==0.21.3' 'texttable>=1.6.2' \
  'matplotlib>=3.1.1' 'fancyimpute>=0.5.4' 'streamlit>=0.57.1' 'cvxpy==1.0.25' 'psycopg2' \
&& git clone https://github.com/vanderschaarlab/clairvoyance \
&& mkdir -p clairvoyance/datasets/data/mimic_antibiotics

#RUN service postgresql start \
#&& ( cd clairvoyance/datasets/mimic_data_extraction/ \
#&&   python extract_antibiotics_dataset.py ) \
#&& service postgresql stop

# persistant storage for user files
VOLUME data
