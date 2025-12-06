#!/bin/sh
if command -v zsh >/dev/null 2>&1; then
  exec zsh -l
else
  exec bash -l
fi
