#!/bin/bash

set -xue

# Directory to clone ufs-conda-envs to
_CLONEDIR=/work/noaa/epic/bwkoziol/sandbox/ufs-conda-envs
# Directory to install conda environments and modulefiles
_INSTALLDIR=/work/noaa/epic/bwkoziol/tmp/ufs-conda

# -----

git clone -b feat/i9-pin-for-land-da https://github.com/benkozi/ufs-conda-envs.git ${_CLONEDIR}
cd ${_CLONEDIR}

bash ./init.sh ${_INSTALLDIR}