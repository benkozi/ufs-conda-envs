#!/bin/bash

set -eux

INSTALL_DIR=/opt/ufs-conda

if [ -e "${INSTALL_DIR}" ]; then
  printf "Error: %s exists. Remove the install directory before proceeding" ${INSTALL_DIR}
  exit 1
fi

installer=Miniconda3-latest-Linux-x86_64.sh
full_path="${INSTALL_DIR}/miniconda3"
wget https://repo.anaconda.com/miniconda/${installer}
bash ./${installer} -bfp ${full_path}
rm ${installer}

conda_bin=${full_path}/condabin/conda
${conda_bin} config --remove channels main
${conda_bin} config --remove channels r
${conda_bin} env create -f environment.yaml
