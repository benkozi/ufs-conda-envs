#!/bin/bash

set -eux

source ./env.sh

CONDA_ENV_TO_INSTALL="ufs-default"

"${CONDA_BIN}" env create -f "${CONDA_ENV_DEF_DIR}"/environment-${CONDA_ENV_TO_INSTALL}.yaml
