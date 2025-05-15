#!/bin/bash

set -eux

CONDA_ENV_TO_INSTALL="ufs-default"
INSTALL_DIR=/gpfs/f6/bil-fire8/world-shared/ufs-conda
MODULEFILES=../modulefiles/gaeac6/python-ufs-default

${INSTALL_DIR}/miniconda3/condabin/conda env create -f ../environment-${CONDA_ENV_TO_INSTALL}.yaml
mkdir -p "${INSTALL_DIR}"/modulefiles
cp -rv "${MODULEFILES}" "${INSTALL_DIR}"/modulefiles
