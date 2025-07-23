#!/bin/bash

set -eux

source ./env.sh

if [ -e "${_INSTALL_DIR}" ]; then
  printf "Error: %s exists. Remove the install directory before proceeding" ${_INSTALL_DIR}
  exit 1
fi

installer=Miniconda3-latest-Linux-x86_64.sh
wget https://repo.anaconda.com/miniconda/${installer}
bash ./${installer} -bfp "${_INSTALL_DIR}/miniconda3"
rm ${installer}
