#!/bin/bash

set -eux

#INSTALL_DIR=/gpfs/f6/bil-fire8/world-shared/ufs-conda # gaea-c6
INSTALL_DIR=/scratch3/NAGAPE/epic/ufs-conda # hera

if [ -e "${INSTALL_DIR}" ]; then
  printf "ERROR: %s exists. Remove the build directory before proceeding" ${INSTALL_DIR}
  exit 1
fi

installer=Miniconda3-latest-Linux-x86_64.sh
wget https://repo.anaconda.com/miniconda/${installer}
bash ./${installer} -bfp "${INSTALL_DIR}/miniconda3"
rm ${installer}
