#!/usr/bin/env bash

set -euo pipefail -o posix

if [ -z ${ZSH+x} ]; then
  # install oh-my-zsh. Ignore non-zero code.
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash || true
fi

exists() {
  command -v "$1" > /dev/null 2>&1
  return $?
}

# install homebrew
if ! exists "brew"; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
fi

brew bundle --verbose --file="$CONFIG_ROOT/init/macos/Brewfile"

cp $CONFIG_ROOT/misc/ssh.config $HOME/.ssh/config
