#!/usr/bin/env bash

case "$(uname -s)" in
Darwin)
  for file in "$CONFIG_ROOT/init/macos/*.sh"; do
    bash $file
  done
  ;;
esac
