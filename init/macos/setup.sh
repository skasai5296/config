#!/usr/bin/env bash

set -euo pipefail -o posix

if [ -z ${ZSH+x} ]; then
  # install oh-my-zsh
  eval "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

exists() {
  command -v "$1" > /dev/null 2>&1
  return $?
}

# install homebrew
if ! exists "brew"; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle --verbose --file="$CONFIG_ROOT/init/macos/Brewfile"

cp $CONFIG_ROOT/misc/ssh.config $HOME/.ssh/config
