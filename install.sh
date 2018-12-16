#!/usr/bin/env bash
#
# Clone the dotfiles repository and run the installer.

set -eu -o pipefail

HOME="$(echo ~)"
ROOT_DIR="$HOME/.dotfiles"
REMOTE_URL='https://github.com/yufengwng/dotfiles.git'

if [[ -d "$ROOT_DIR" ]]; then
  printf 'dotfiles already present on system\n'
else
  printf '> fetching dotfiles\n'
  git clone $REMOTE_URL $ROOT_DIR
  printf '> running dotfiles installer\n'
  $ROOT_DIR/bin/dotfilez install
fi
