#!/bin/bash


_INSTALLDIR=/glade/work/chanhooj/UFS-DA-ENV/ss19.2
_CLONEDIR=/glade/derecho/scratch/benkoz/sandbox/ufs-conda-envs
_BRANCH=feat/install-on-derecho
_CONDABIN=${_INSTALLDIR}/miniconda3/condabin/conda
_CONDARUN="${_CONDABIN} run --no-capture-output -n ufs-conda-envs"
_PLATFORM=derecho
_ENV_KEY=land-da-wflow
