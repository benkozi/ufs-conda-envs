#!/bin/bash

UCE_PLATFORM="${UCE_PLATFORM:?'UCE_PLATFORM environment variable is required'}"
UCE_CONDA_ENV="${UCE_CONDA_ENV:-default}"

case "${UCE_CONDA_ENV}" in
    "default")
        _CONDA_ENV_NAME="ufs-default"
        ;;
    "land-da-wflow")
        _CONDA_ENV_NAME="ufs-land-da-workflow"
        ;;
    *)
        echo "ERROR: Invalid UCE_CONDA_ENV '${UCE_CONDA_ENV}'. Valid values are 'default' or 'land-da-wflow'." >&2
        exit 1
        ;;
esac

case "${UCE_PLATFORM}" in
    "gaeac6")
        _INSTALL_DIR=/gpfs/f6/bil-fire8/world-shared/ufs-conda
        ;;
    "hera")
        _INSTALL_DIR=/scratch3/NAGAPE/epic/ufs-conda
        ;;
    *)
        echo "ERROR: Invalid UCE_PLATFORM '${UCE_PLATFORM}'. Valid values are 'hera' or 'gaeac6'." >&2
        exit 1
        ;;
esac

_CONDA_BIN="${_INSTALL_DIR}"/miniconda3/condabin/conda
_CONDA_ENV_DEF_DIR=../environment
_MODULEFILES_INSTALL_DIR="${_INSTALL_DIR}"/modulefiles
