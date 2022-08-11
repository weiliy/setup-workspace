#!/bin/bash

# post action for nvm
NVM_DIR="$HOME/.nvm"
[ -d "$NVM_DIR" ] \
  || mkdir "$NVM_DIR" \
  && echo "Created $NVM_DIR"
