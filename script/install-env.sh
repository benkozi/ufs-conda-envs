#!/bin/bash

set -eux

source ./install-conda-env.sh

mkdir -p "${_INSTALL_DIR}"/modulefiles
cp -rv "${_MODULEFILES}" "${_INSTALL_DIR}"/modulefiles
