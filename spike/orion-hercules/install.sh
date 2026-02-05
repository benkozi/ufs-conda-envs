#!/bin/bash

set -xue

_INSTALLDIR=/work/noaa/epic/UFS-conda
_CLONEDIR=/work/noaa/epic/bwkoziol/sandbox/ufs-conda-envs
_BRANCH=fix/broken-env-on-orion
_CONDABIN=${_INSTALLDIR}/miniconda3/condabin/conda
_CONDARUN="${_CONDABIN} run --no-capture-output -n ufs-conda-envs"

cd ${_CLONEDIR}
git pull
git checkout ${_BRANCH}
${_CONDARUN} python ${_CLONEDIR}/src/ufs_conda/ufs_conda_cli.py create --help
${_CONDARUN} python ${_CLONEDIR}/src/ufs_conda/ufs_conda_cli.py create --platform=orion-hercules --env-key=land-da-wflow --module-version="20260205-1057"
module purge && module use /work/noaa/epic/UFS-conda/modulefiles && module load python-ufs-land-da-wflow-20260205-1057
