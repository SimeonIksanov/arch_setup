#!/usr/bin/env bash

# exit immediately on any error
set -e

# File path
LOCALE_GEN="/etc/locale.gen"
LINE="#en_US.UTF-8 UTF-8"
PATTERN="#"
REPLACE=""

sudo sed -i "/^${LINE}/s/^$PATTERN/$REPLACE/" $LOCALE_GEN

sudo locale-gen
