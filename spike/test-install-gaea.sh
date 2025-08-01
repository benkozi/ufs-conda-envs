#!/bin/bash

set -xue -o pipefail

export PYTHONPATH=/gpfs/f6/bil-fire8/world-shared/UFS_Land-DA_v3.0/jedi_bundle_sync/build/lib/python3.11
_CONDABIN=/gpfs/f6/bil-fire8/world-shared/ufs-conda/miniconda3/condabin/conda
_CONDARUN="${_CONDABIN} run --no-capture-output -n ufs-land-da-wflow-20250801-0854"

${_CONDARUN} which python
${_CONDARUN} which mpirun
${_CONDARUN} python -c "from pyioda import ioda"
${_CONDARUN} python -c "import pyiodaconv.ioda_conv_engines as iconv"
