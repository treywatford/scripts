# scripts

developer utility scripts

## dev_setup.sh

Used to set up a new linux or mac machine.

- uses [homebrew](https://brew.sh/) as the primary package manager
- view/modify the script to change the applications to install

## install_starship.sh

Used to install starship cross shell prompt since I use it on all operating systems

- uses curl

## zsh_setup.sh

Used to set up zsh and powerlevel9k theme. I prefer to use starship moving forward but wanted to leave this available for anyone that wants it

- uses [homebrew](https://brew.sh/) as the primary package manager
- uses git commands over ssh
- this script should be executed after dev_setup.sh if desired
