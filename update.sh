#!/bin/bash
# Script to keep submodules in vim bundles updated

HOME="`echo ~`"
cd $HOME/.dotfiles/

echo "Updating submodules"
git submodule update

echo "Done"
