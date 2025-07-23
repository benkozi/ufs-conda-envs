#!/bin/bash

set -eux

source ./install-conda-env.sh

# Create modulefiles directory and process templates
module_dst="${_INSTALL_DIR}"/modulefiles/python-${_CONDA_ENV_NAME}
mkdir -p ${module_dst}
# Process lua template using sed
mkdir -p ${_MODULEFILES_INSTALL_DIR}
sed -e "s|__HELP_DESCRIPTION__|${_HELP_DESCRIPTION}|g" \
    -e "s|__MODULE_NAME__|${_MODULE_NAME}|g" \
    -e "s|__INSTALL_DIR__|${_INSTALL_DIR}|g" \
    -e "s|__CONDA_ENV_NAME__|${_CONDA_ENV_NAME}|g" \
    ../modulefiles/python-3.lua.template > ${module_dst}/3.lua
