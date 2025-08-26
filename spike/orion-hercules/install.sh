#!/bin/bash

set -xue

_INSTALLDIR=/work/noaa/epic/UFS-conda
_CLONEDIR=/work/noaa/epic/bwkoziol/sandbox/ufs-conda-envs
_BRANCH=feat/i11-add-xesmf
_CONDABIN=${_INSTALLDIR}/miniconda3/condabin/conda
_CONDARUN="${_CONDABIN} run --no-capture-output -n ufs-conda-envs"

cd ${_CLONEDIR}
git pull
git checkout ${_BRANCH}
${_CONDARUN} pip install .
${_CONDARUN} ufs-conda create --help
${_CONDARUN} ufs-conda create --platform=orion-hercules --env-key=land-da-wflow --module-version="i11"
