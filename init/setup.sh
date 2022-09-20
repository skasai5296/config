#!/usr/bin/env bash

set -euo pipefail -o posix

case "$(uname -s)" in
Darwin)
  find "${CONFIG_ROOT}/init/macos/" -name '*.sh' -exec {} \;
  ;;
*)
  ;;
esac

vim +PluginInstall +qall
