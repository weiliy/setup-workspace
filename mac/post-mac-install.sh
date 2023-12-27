#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color
errcho(){ >&2 echo -e "$RED" $@ "$NC"; }

# post action for nvm
NVM_DIR="$HOME/.nvm"
[ -d "$NVM_DIR" ] \
  || mkdir "$NVM_DIR" \
  && echo "Created $NVM_DIR"


infocmp -x tmux-256color > /dev/null || \
  errcho 'No tmux-256-collor, plese install it'\
    'https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95'
