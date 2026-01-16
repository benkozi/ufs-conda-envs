#!/bin/bash

set -ue -o pipefail

module use /glade/work/chanhooj/UFS-DA-ENV/ss19.2/modulefiles/
module load mkl/2024.2.2

module load python-ufs-land-da-wflow
which python
which mpirun
python -c "from pyioda import ioda"
python -c "import pyiodaconv.ioda_conv_engines as iconv"