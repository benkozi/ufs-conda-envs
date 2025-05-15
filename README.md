Environment definitions for UFS conda installations.

# Usage

## Gaea-C6

```
# As a module -->
module use /gpfs/f6/bil-fire8/world-shared/ufs-conda/modulefiles
module load python-ufs-default
which python
python --version
```

```
# With conda activate -->
source /gpfs/f6/bil-fire8/world-shared/ufs-conda/miniconda3/etc/profile.d/conda.sh
conda activate ufs-default
```

# Environment Descriptions

* `python-ufs-default`: Contains the newest version of select packages. Pinning is avoided whenever possible.
