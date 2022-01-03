#!/bin/bash
#
# This is the installation script for the scripts in this repository.
IDIR="/usr/local/bin/";
SDIR="/usr/local/stow/";
PACK="tools";

# Installing the scripts
mkdir -p ${SDIR};
cp -rv "${PACK}" "${SDIR}";

# Using stow to make them executable
stow --verbose=1 --dir=${SDIR} --target=${IDIR} --stow ${PACK};
