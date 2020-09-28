#!/bin/bash

####################################################################
# dev_setup.sh
# author: Trey Watford (treyjustinwatford@gmail.com)
# usage:
#   This script is intended to set up a mac or linux developer 
#   machine. This script should be called with the following 
#   parameters on the command line
#   -e {your email}
####################################################################


# email is a required argument
# if not arguments are passed exit 
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi


# variables
OS_LINUX=0
USER_EMAIL=""

# Parse CLI arguments
# -e = user email argument
while getopts ":e:" opt; do
  case $opt in
    e)
      USER_EMAIL=$OPTARG
      echo "User Email: ${USER_EMAIL}" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done


## greeting
echo "Hello $(whoami), please wait while we set up your dev environment"

# Determine if we are on mac or linux
if [[ "$(uname)" = "Linux" ]]; then
    echo "OS Detected: $(uname)"
    OS_LINUX=1 
fi

## install requirements for homebrew on linux
if [[ "${OS_LINUX}" -eq 1 ]]; then
    echo "installing cURL, build-essential, file, and git..."
    sudo apt-get install build-essential curl file git
    echo "dependencies installed"
fi 

# install homebrew (so we can use this script for mac/linux/WSL)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# add brew to path (linux)
if [[ "${OS_LINUX}" -eq 1 ]]; then
  test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
  test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
  echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
fi

# apps to install
brew install go                                 # go language
brew install vim                                # vim text editor
brew install npm                                # node package manager
brew install yarn				                # yarn
npm install -g @vue/cli                         # vue CLI

# OS specific installs
if [[ "${OS_LINUX}" -eq 1 ]]; then
    sudo snap install code                      # visual studio code
    sudo snap install discord                   # discord for chat
    sudo snap install firefox                   # firefox
    sudo snap install slack --classic           # slack for chat
    
else # install using homebrew cask for mac
    brew cask install visual-studio-code        # visual studio code
    brew cask install discord                   # discord for chat
    brew cask install iterm2                    # good terminal for mac
    brew cask install google-chrome             # chrome
    brew cask install firefox                   # firefox
    brew cask install slack                     # slack for chat
fi

# comment this out if you do not want to install chrome on linux 
if [[ "${OS_LINUX}" -eq 1 ]]; then
    sudo apt install gdebi-core wget
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo gdebi google-chrome-stable_current_amd64.deb
fi


# create ssh keys and start agent
ssh-keygen -t rsa -C "${USER_EMAIL}"
eval "$(ssh-agent -s)"  
ssh-add ~/.ssh/id_rsa
