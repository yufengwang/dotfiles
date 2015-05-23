#!/bin/bash
#
# Clone the dotfiles repository and run the installer.

HOME="$(echo ~)"
DOTFILES_DIR="${HOME}/.dotfiles"
REMOTE_URL="https://github.com/yufengwng/dotfiles.git"

if [[ ! -d "${DOTFILES_DIR}" ]]; then
  git clone ${REMOTE_URL} ${DOTFILES_DIR}
  echo ""
fi

# invoke the installer
${DOTFILES_DIR}/bin/dotfilez install
