#!/bin/bash
# Script to symlink files to home dir

HOME="`echo ~`"
echo "Home: $HOME"

# start in dotfiles root
cd $HOME/.dotfiles/

for item in ./*; do
  # grab only the filename
  file="`echo ${item:2}`"

  if [ "$file" == "link.sh" ] || [ "$file" == "README.md" ]; then
    # skip script and readme
    echo "$file: skipping"
    continue

  elif [ -e "$HOME/.$file" ] && [ ! -L "$HOME/.$file" ] ; then
    # if file exists and is not a symlink
    echo ".$file: already exists"
    echo ".$file: backing up"
    mv $HOME/.$file $HOME/.$file.old

    echo ".$file: symlinking"
    ln -s $HOME/.dotfiles/$file $HOME/.$file

  elif [ -e "$HOME/.$file" ] && [ -L "$HOME/.$file" ] ; then
    # if file exits and is a symlink
    echo ".$file: symlink already exists"
    echo ".$file: updating"
    rm -rf $HOME/.$file
    ln -s $HOME/.dotfiles/$file $HOME/.$file

  else
    # file does not exist
    echo ".$file: does not exist"
    echo ".$file: symlinking"
    ln -s $HOME/.dotfiles/$file $HOME/.$file
  fi
done

echo "Done"
