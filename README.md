Environment definitions and management utilities for UFS conda installations.

# Usage

Supported environments:
* `default` --> Contains the newest version of select packages. Pinning is avoided whenever possible.
* `land-da-wflow` --> Contains packages in support of the Land DA workflow.

## Gaea-C6

```
# As a module -->
module use /gpfs/f6/bil-fire8/world-shared/ufs-conda/modulefiles
module load python-ufs-<environment> # e.g. default
which python
python --version
```

```
# With conda activate -->
source /gpfs/f6/bil-fire8/world-shared/ufs-conda/miniconda3/etc/profile.d/conda.sh
conda activate ufs-default
```

## Hera

```
# As a module -->
module use /scratch3/NAGAPE/epic/ufs-conda/modulefiles
module load python-ufs-<environment> # e.g. default
which python
python --version
```

```
# With conda activate -->
source /scratch3/NAGAPE/epic/ufs-conda/miniconda3/etc/profile.d/conda.sh
conda activate ufs-default
```
