#!/bin/bash
# Script to keep submodules in vim bundles updated

echo "Updating pathogen"
curl -Lo ~/.dotfiles/src/vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo "Updating submodules"
cd ~/.dotfiles/
git submodule update

echo "Done"
