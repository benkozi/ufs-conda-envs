#!/bin/bash

set -xue

_INSTALLDIR=/work/noaa/epic/bwkoziol/tmp/ufs-conda
_CONDABIN=${_INSTALLDIR}/miniconda3/condabin/conda
_CONDARUN="${_CONDABIN} run --no-capture-output -n ufs-conda-envs"

${_CONDARUN} ufs-conda create --help
${_CONDARUN} ufs-conda create --platform=orion-hercules --all
