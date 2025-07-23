#!/bin/bash

UCE_CONDA_ENV="${UCE_CONDA_ENV:?'ERROR: UCE_CONDA_ENV environment variable is required. Valid values are "default" or "land-da-wflow".'}"
UCE_PLATFORM="${UCE_PLATFORM:?'ERROR: UCE_PLATFORM environment variable is required. Valid values are "gaeac6", "hera", or "docker".'}"

case "${UCE_PLATFORM}" in
    "gaeac6")
        _INSTALL_DIR=/gpfs/f6/bil-fire8/world-shared/ufs-conda
        _CONDA_BIN="${_INSTALL_DIR}"/miniconda3/condabin/conda
        ;;
    "hera")
        _INSTALL_DIR=/scratch3/NAGAPE/epic/ufs-conda
        _CONDA_BIN="${_INSTALL_DIR}"/miniconda3/condabin/conda
        ;;
    "docker")
        _INSTALL_DIR=/opt/ufs-conda
        _CONDA_BIN=conda
        ;;
    *)
        echo "ERROR: Invalid UCE_PLATFORM '${UCE_PLATFORM}'. Valid values are 'hera', 'gaeac6', or 'docker'." >&2
        exit 1
        ;;
esac

# Set template variables based on environment
case "${UCE_CONDA_ENV}" in
    "default")
        _HELP_DESCRIPTION="UFS default Python environment"
        _MODULE_NAME="python-ufs-default"
        ;;
    "land-da-wflow")
        _HELP_DESCRIPTION="Land DA workflow Python environment"
        _MODULE_NAME="python-ufs-land-da-wflow"
        ;;
    *)
        echo "ERROR: Invalid UCE_PLATFORM '${UCE_PLATFORM}'. Valid values are 'default' or 'land-da-wflow'." >&2
        exit 1
        ;;
esac

_CONDA_ENV_NAME="ufs-${UCE_CONDA_ENV}"
_CONDA_ENV_DEF_DIR=../environment
_MODULEFILES=../modulefiles/${UCE_PLATFORM}
_MODULEFILES_INSTALL_DIR="${_INSTALL_DIR}"/modulefiles
