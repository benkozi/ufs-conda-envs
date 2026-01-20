#!/bin/bash

set -xue -o pipefail

export PYTHONPATH=/glade/work/chanhooj/UFS-DA-Workflow_v1.0/jedi_bundle_sync/build/lib/python3.11/

module use /glade/work/chanhooj/UFS-DA-ENV/ss19.2/modulefiles/
module load mkl/2024.2.2

module load python-ufs-land-da-wflow
which python
which mpirun
python -c "from pyioda import ioda"
python -c "import pyiodaconv.ioda_conv_engines as iconv"
python -c "import uwtools; print(uwtools.__version__)"