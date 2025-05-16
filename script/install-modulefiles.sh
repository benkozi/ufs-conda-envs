#!/bin/bash

set -xue

source ./env.sh

mkdir -p "${MODULEFILES_INSTALL_DIR}"
cp -rv "${MODULEFILES}"/gaeac6/* "${MODULEFILES_INSTALL_DIR}"
