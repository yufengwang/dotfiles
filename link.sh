#!/bin/bash
# Script to symlink files to home directory

HOME="`echo ~`"

# start in dotfiles source directory
cd $HOME/.dotfiles/src/

echo "Linking dotfiles to $HOME"
echo ""

for match in ./*; do
  # grab only the filename
  file="`echo ${match:2}`"

  if [ -e "$HOME/.$file" ] && [ ! -L "$HOME/.$file" ] ; then
    # if file exists and is not a symlink
    echo ".$file: already exists"
    echo ".$file: backing up to .$file.old"
    mv $HOME/.$file $HOME/.$file.old

    echo ".$file: symlinking"
    ln -s $HOME/.dotfiles/src/$file $HOME/.$file

  elif [ -e "$HOME/.$file" ] && [ -L "$HOME/.$file" ] ; then
    # if file exits and is a symlink
    echo ".$file: symlink already exists"
    echo ".$file: updating"
    rm -rf $HOME/.$file
    ln -s $HOME/.dotfiles/src/$file $HOME/.$file

  else
    # file does not exist
    echo ".$file: does not exist"
    echo ".$file: symlinking"
    ln -s $HOME/.dotfiles/src/$file $HOME/.$file
  fi

  echo ""
done

# cd to dotfiles root
cd ..

# setup submodules in vim bundles
echo "setting up submodules"
git submodule init
git submodule update

echo "Done"
