#!/usr/bin/env bash

set -euo pipefail -o posix

download_dotfiles() {
  printf "Downloading dotfiles...\n"
  git clone --recurse-submodules "$DOTFILES_REPO" "$CONFIG_ROOT"
  # workaround for pull request review testing
  if [ ! -z "${GITHUB_HEAD_REF}" ]; then
    git switch "${GITHUB_HEAD_REF}"
  fi
}

deploy_dotfiles() {
  # Create symbolic links of dotfiles to home directory.

  cd "$CONFIG_ROOT"
  for file in $(find dotfiles -maxdepth 1 -name '.[!.]*' -not -name '.git*'); do
    ln -sfnv "$CONFIG_ROOT/$file" "$HOME/$(basename $file)"
  done

  CONFIG_ROOT=$CONFIG_ROOT bash $CONFIG_ROOT/init/setup.sh
}

if [ -z "${CONFIG_ROOT:-}" ]; then
  CONFIG_ROOT="$HOME/dev/github.com/skasai5296/config"; export CONFIG_ROOT
fi
DOTFILES_REPO="https://github.com/skasai5296/config.git"; export DOTFILES_REPO

main() {
  download_dotfiles
  deploy_dotfiles
}

main
