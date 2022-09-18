#!/usr/bin/env bash

set -eo pipefail -o posix

deploy_dotfiles() {
  # Create symbolic links of dotfiles to home directory.

  cd "$CONFIG_ROOT"
  find dotfiles -maxdepth 1 -name '.(?!.|git)*' -exec ln -sfv "$CONFIG_ROOT/{}" "$HOME" \;

}

run_setup_scripts() {
  source "${CONFIG_ROOT}/init/setup.sh"
}

if [[ -z "${CONFIG_ROOT:-}" ]]; then
  CONFIG_ROOT=$(git rev-parse --show-toplevel); export CONFIG_ROOT
fi

main() {
  deploy_dotfiles
  run_setup_scripts
}

main
