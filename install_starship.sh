#!/bin/bash

####################################################################
# install_starship.sh
# author: Trey Watford (treyjustinwatford@gmail.com)
# usage:
#   This script installs and sets up starship cross shell prompt. 
#   for details see https://starship.rs/
####################################################################

# install starship
curl -sS https://starship.rs/install.sh | sh

# add starship to zshrc for z shell
echo 'eval "$(starship init zsh)"' >> ~/.zshrc