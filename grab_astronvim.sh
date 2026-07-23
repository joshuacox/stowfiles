#!/usr/bin/env bash
TARGET_ASTRONVIM=./astronvim
if [[ -d ${TARGET_ASTRONVIM} ]]; then 
  echo 'Removing previous astronvim dir'
  rm -rf ${TARGET_ASTRONVIM}
fi
mkdir -p ${TARGET_ASTRONVIM}/.config
git clone --depth 1 https://github.com/AstroNvim/template ${TARGET_ASTRONVIM}/.config/nvim
rm -rf ${TARGET_ASTRONVIM}/.config/nvim/.git
