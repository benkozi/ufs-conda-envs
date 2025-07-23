#!/bin/bash

set -eux

source ./env.sh

"${_CONDA_BIN}" env create -f "${_CONDA_ENV_DEF_DIR}"/environment-ufs-"${UCE_CONDA_ENV}".yaml
