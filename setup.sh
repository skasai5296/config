#!/usr/bin/env bash

set -eo pipefail -o posix

deploy_dotfiles() {
  # Create symbolic links of dotfiles to home directory.

  cd "$CONFIG_ROOT"
  for file in $(find dotfiles -maxdepth 1 -name '.[!.]*' -not -name '.git*'); do
    ln -sfnv "$CONFIG_ROOT/$file" "$HOME/$(basename $file)"
  done

}

run_setup_scripts() {
  CONFIG_ROOT=$CONFIG_ROOT bash $CONFIG_ROOT/init/setup.sh
}

if [ -z "${CONFIG_ROOT:-}" ]; then
  CONFIG_ROOT=$(git rev-parse --show-toplevel); export CONFIG_ROOT
fi

main() {
  deploy_dotfiles
  run_setup_scripts
}

main
