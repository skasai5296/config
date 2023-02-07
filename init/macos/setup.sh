#!/usr/bin/env bash

set -euo pipefail -o posix

if [[ -z ${ZSH+x} ]]; then
  # install oh-my-zsh. Ignore non-zero code.
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

exists() {
  command -v "$1" > /dev/null 2>&1
  return $?
}

# install homebrew
if ! exists "brew"; then
  # disable posix temporarily for homebrew installation
  sh -c "unset POSIXLY_CORRECT; $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install Google Chrome and Slack unless they're already installed.
# These can't be done in the Brewfile because the autoupdater
# breaks Homebrew.
if [[ ! -d "/Applications/Google Chrome.app" ]]; then
  brew install --cask google-chrome
fi
if [[ ! -d "/Applications/Slack.app" ]]; then
  brew install --cask slack
fi

brew bundle --verbose --force --file="${CONFIG_ROOT}/init/macos/Brewfile"

cp "${CONFIG_ROOT}/misc/ssh.config" "${HOME}/.ssh/config"
cat "${CONFIG_ROOT}/misc/zsh.config" >> "${HOME}/.zshrc"
