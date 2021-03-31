#!/usr/bin/env bash



install_dotfiles() {
  printf "Downloading dotfiles...\n"
  git clone "$DOTFILES_REPO" "$CONFIG_ROOT"
  cd "$CONFIG_ROOT"
  
  # Create symbolic links to home.
  for file in $(find dotfiles/ -maxdepth 1 -name '.[!.]*' -not -name '.git*'); do
    echo $file
    echo "$HOME/$(basename $file)"
    #ln -sfnv "$file" "$HOME/(basename $file)"
  done
}

if [ -z "${CONFIG_ROOT:-}" ]; then
  CONFIG_ROOT="$HOME/dev/github.com/skasai5296/dotfiles"; export CONFIG_ROOT
fi
DOTFILES_REPO="git@github.com:skasai5296/dotfiles.git"; export DOTFILES_REPO

main() {
  install_dotfiles
}

main


#git submodule update --init
#
#vim -c PluginInstall -c qa
#
#bash $HOME/.bash_it/install.sh
