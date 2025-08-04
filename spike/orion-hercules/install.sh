#!/bin/bash

set -xue

_INSTALLDIR=/work/noaa/epic/UFS-conda
_CLONEDIR=/work/noaa/epic/bwkoziol/sandbox/ufs-conda-envs
_CONDABIN=${_INSTALLDIR}/miniconda3/condabin/conda
_CONDARUN="${_CONDABIN} run --no-capture-output -n ufs-conda-envs"

cd ${_CLONEDIR}
git pull
${_CONDARUN} pip install .
${_CONDARUN} ufs-conda create --help
${_CONDARUN} ufs-conda create --platform=orion-hercules --all
