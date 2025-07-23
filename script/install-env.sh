#!/bin/bash

set -eux

#INSTALL_DIR=/gpfs/f6/bil-fire8/world-shared/ufs-conda # gaea-c6
#MODULEFILES=../modulefiles/gaeac6/python-ufs-default

INSTALL_DIR=/scratch3/NAGAPE/epic/ufs-conda # hera
MODULEFILES=../modulefiles/hera/python-ufs-default

# ----------

CONDA_ENV_TO_INSTALL="ufs-default"

${INSTALL_DIR}/miniconda3/condabin/conda env create -f ../environment-${CONDA_ENV_TO_INSTALL}.yaml
mkdir -p "${INSTALL_DIR}"/modulefiles
cp -rv "${MODULEFILES}" "${INSTALL_DIR}"/modulefiles
