#!/bin/bash


_INSTALLDIR=/gpfs/f6/bil-fire8/world-shared/ufs-conda
_CLONEDIR=/gpfs/f6/bil-fire8/scratch/Benjamin.Koziol/sandbox/ufs-conda-envs
_BRANCH=feat/i12-mpas-aerosols
_CONDABIN=${_INSTALLDIR}/miniconda3/condabin/conda
_CONDARUN="${_CONDABIN} run --no-capture-output -n ufs-conda-envs"
_PLATFORM=gaeac6
_ENV_KEY=mpas-aerosols
#_MODULE_VERSION=i11