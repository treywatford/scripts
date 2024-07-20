#!/bin/bash

####################################################################
# setup_entertainment.sh
# author: Trey Watford (treyjustinwatford@gmail.com)
# usage:
#   This script installs some apps for entertainment like battle.net
#   and steam
####################################################################
# variables
OS_LINUX=0

# Determine if we are on mac or linux
if [[ "$(uname)" = "Linux" ]]; then
    echo "OS Detected: $(uname)"
    OS_LINUX=1
fi

if [[ "${OS_LINUX}" -eq 1 ]]; then
    # TODO: update when I have a linux machine
    # have not tested or searched for an option on linux yet since i don't currently have a linux machine
    echo "Linux detected, but installation steps are not defined."
else
    # install using homebrew cask for mac
    brew install --cask battle-net
    echo "to install batte.net make sure to run 'open and the path to the .app file'"
    # brew install --cask steam
    # steam is built for intel based macs and requires rosetta 2 which is apparently hard to remove after install so i'm not installing it yet
fi
