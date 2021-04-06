#!/usr/bin/env bash

set -euo pipefail -o posix

case "$(uname -s)" in
Darwin)
  for file in "$CONFIG_ROOT/init/macos/*.sh"; do
    bash $file
  done
  ;;
esac

vim +PluginInstall +qall
