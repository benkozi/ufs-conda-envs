#!/bin/bash

set -xue

./env.sh

cd ${_CLONEDIR}
git pull
git checkout ${_BRANCH}
${_CONDARUN} python ${_CLONEDIR}/src/ufs_conda/ufs_conda_cli.py create --help
${_CONDARUN} python ${_CLONEDIR}/src/ufs_conda/ufs_conda_cli.py create --platform=${_PLATFORM} --env-key=${_ENV_KEY} --module-version=${_MODULE_VERSION}
