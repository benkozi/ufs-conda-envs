#!/bin/bash

set -xue

source ./env.sh

git clone -b feat/i9-pin-for-land-da https://github.com/benkozi/ufs-conda-envs.git ${_CLONEDIR}
cd ${_CLONEDIR}

source ./init.sh ${_INSTALLDIR}