#!/bin/bash

####################################################################
# zsh_setup.sh
# author: Trey Watford (treyjustinwatford@gmail.com)
# usage:
#   This script is set up zsh (z shell) and oh-my-zsh.
# requirements:
#   git must be installed and configured (this script uses ssh)
#   homebrew is used to install zsh
####################################################################

# variables
OS_LINUX=0

# Determine if we are on mac or linux
if [[ "$(uname)" = "Linux" ]]; then
    echo "OS Detected: $(uname)"
    OS_LINUX=1 
fi

# install zsh
brew install zsh

# set default shell
ZSH_LOCATION=$(which zsh)

# add zsh to /etc/shells for linux
if [[ "${OS_LINUX}" -eq 1 ]]; then
    command -v zsh | sudo tee -a /etc/shells
fi

# install oh-my-zsh
git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# create new zsh config file
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# clone powerlevel9k theme
git clone git@github.com:bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# clone fonts
git clone git@github.com:powerline/fonts.git --depth=1
# install fonts and clean up
cd fonts
./install.sh
cd ..
rm -rf fonts

# change default shell to zsh
# to undo this action execute chsh -s $(which bash)
chsh -s ${ZSH_LOCATION}

echo "Please log out of the system and log back in for changes to take effect"
# this will take the user through the zsh setup routine
