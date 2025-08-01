#!/bin/bash

set -xue -o pipefail

_WD=/gpfs/f6/bil-fire8/scratch/Benjamin.Koziol/sandbox/ufs-conda-envs
_CONDABIN=/gpfs/f6/bil-fire8/world-shared/ufs-conda/miniconda3/condabin/conda
_CONDARUN="${_CONDABIN} run --no-capture-output -n ufs-conda-envs"

cd ${_WD}
git pull
${_CONDARUN} pip install .
${_CONDARUN} ufs-conda --help
