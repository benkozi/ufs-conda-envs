#!/bin/bash

set -eux

CONDA_ENV_TO_INSTALL="ufs-default"
INSTALL_DIR=/gpfs/f6/bil-fire8/world-shared/ufs-conda

${INSTALL_DIR}/miniconda3/condabin/conda env create -f ../environment-${CONDA_ENV_TO_INSTALL}.yaml
