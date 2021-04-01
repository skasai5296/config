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
}

if [ -z "${CONFIG_ROOT:-}" ]; then
  CONFIG_ROOT="$HOME/dev/github.com/skasai5296/dotfiles"; export CONFIG_ROOT
fi
DOTFILES_REPO="git@github.com:skasai5296/dotfiles.git"; export DOTFILES_REPO

main() {
  download_dotfiles
  deploy_dotfiles
}

main


#git submodule update --init
#
#vim -c PluginInstall -c qa
#
#bash $HOME/.bash_it/install.sh
