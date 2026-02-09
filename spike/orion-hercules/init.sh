#!/bin/bash

set -xue

# Directory to clone ufs-conda-envs to
_CLONEDIR=/work/noaa/epic/bwkoziol/sandbox/ufs-conda-envs
# Directory to install conda environments and modulefiles
_INSTALLDIR=/work/noaa/epic/UFS-conda-v2

# -----

#git clone -b feat/i9-pin-for-land-da https://github.com/benkozi/ufs-conda-envs.git ${_CLONEDIR}
cd ${_CLONEDIR}

source ./init.sh ${_INSTALLDIR}

condabin=${_INSTALLDIR}/miniconda3/condabin/conda
${condabin} run -n ufs-conda-envs --no-capture-output pip install .
