#!/bin/bash

# camelot dependencies
apt-get --yes update
apt-get install --yes libgl1 ghostscript python3-tk

# create environment in the project's directory using a prefix
ENV_PREFIX="venv"
ENV_DIR="${PWD}/${ENV_PREFIX}"
if ! test -d "${ENV_DIR}"; then
    conda env create --file environment.yml --prefix "./${ENV_PREFIX}" --quiet --yes
    conda env list
else
    conda env list
fi

# create environment in the default conda environment directory
# with the name provided in the yaml file
# ENV_NAME=$(grep "name:" environment.yml | sed 's/name: //')
# if ! { conda env list | grep "${ENV_NAME}"; } >/dev/null 2>&1; then
#     conda env create -f environment.yml
#     conda env list
# else
#     conda env list
# fi
