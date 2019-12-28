#!/usr/bin/env bash
#
# Clone the dotfiles repository and run the installer.

set -e -o pipefail

HOME="$(echo ~)"
ROOT_DIR="$HOME/.dotfiles"
REMOTE_REPO='git@github.com:yufengwng/dotfiles.git'

if [[ -d "$ROOT_DIR" ]]; then
  printf 'dotfiles already present on system\n'
else
  printf '> fetching dotfiles\n'
  git clone $REMOTE_REPO $ROOT_DIR
  printf '> running dotfiles installer\n'
  $ROOT_DIR/bin/dotfilez install
fi
