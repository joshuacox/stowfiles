#!/usr/bin/env bash
useage () {
  echo "useage:"
  echo "$0 TARGET_TO_STOW"
}

if [[ $# -eq 1 ]]; then
TARGET=$1
else
  useage
fi

mkdir -p ${TARGET}/.config
mv -v ${HOME}/.config/${TARGET} ${TARGET}/.config/
echo "stow -v ${TARGET}" >> stow_all.sh
stow -v ${TARGET}

