#!/usr/bin/env bash


download_dotfiles() {
  printf "Downloading dotfiles...\n"
  git clone "$DOTFILES_REPO" "$CONFIG_ROOT"
}

deploy_dotfiles() {
  # Create symbolic links of dotfiles to home directory.

  cd "$CONFIG_ROOT"
  for file in $(find dotfiles -maxdepth 1 -name '.[!.]*' -not -name '.git*'); do
    ln -sfnv "$file" "$HOME/$(basename $file)"
  done

  CONFIG_ROOT=$CONFIG_ROOT bash $CONFIG_ROOT/init/setup.sh
}

if [ -z "${CONFIG_ROOT:-}" ]; then
  CONFIG_ROOT="$HOME/dev/github.com/skasai5296/config"; export CONFIG_ROOT
fi
DOTFILES_REPO="git@github.com:skasai5296/config.git"; export DOTFILES_REPO

main() {
  download_dotfiles
  deploy_dotfiles
}

main
