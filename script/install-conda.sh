#!/bin/bash

set -eux

source ./env.sh

if [ -e "${INSTALL_DIR}" ]; then
  printf "ERROR: %s exists. Remove the build directory before proceeding" ${INSTALL_DIR}
  exit 1
fi

installer=Miniconda3-latest-Linux-x86_64.sh
wget https://repo.anaconda.com/miniconda/${installer}
bash ./${installer} -bfp "${INSTALL_DIR}/miniconda3"
rm ${installer}
