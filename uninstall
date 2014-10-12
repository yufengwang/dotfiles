#!/bin/bash
# Script to unlink symlinked files in home directory

HOME="`echo ~`"

# start in dotfiles source directory
cd $HOME/.dotfiles/src/

echo "Unlinking dotfiles from $HOME"
echo ""

for match in ./*; do
  # grab only the filename
  file="`echo ${match:2}`"

  if [ -e "$HOME/.$file" ] && [ -L "$HOME/.$file" ] ; then
    # if file exits and is a symlink
    echo ".$file: unlinking"
    rm -rf $HOME/.$file
  fi
done

echo ""
echo "Done"
