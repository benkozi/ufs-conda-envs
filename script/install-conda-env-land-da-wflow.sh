#!/bin/bash

set -xue

source ./env.sh

HASH=0f58574
DOWNLOAD_URL=https://raw.githubusercontent.com/ufs-community/land-DA_workflow/${HASH}/parm/conda_environment.yml

cd "${_CONDA_ENV_DEF_DIR}"
wget "${DOWNLOAD_URL}"
mv conda_environment.yml environment-land_da.yaml
"${_CONDA_BIN}" env create -f environment-land_da.yaml
