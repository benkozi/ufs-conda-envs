#!/bin/bash


_INSTALLDIR=/scratch3/NAGAPE/epic/ufs-conda
_CLONEDIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/ufs-conda-envs
_BRANCH=feat/i11-add-xesmf
_CONDABIN=${_INSTALLDIR}/miniconda3/condabin/conda
_CONDARUN="${_CONDABIN} run --no-capture-output -n ufs-conda-envs"
_PLATFORM=ursa
_ENV_KEY=land-da-wflow
_MODULE_VERSION=i11