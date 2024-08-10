#!/bin/bash

# camelot dependencies
apt-get update
apt-get install libgl1 ghostscript python3-tk

ENV_NAME=$(grep "name:" environment.yml | sed 's/name: //')
if ! { conda env list | grep "${ENV_NAME}"; } >/dev/null 2>&1; then
    conda env create -f environment.yml
fi
