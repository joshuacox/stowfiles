#!/usr/bin/env bash
useage () {
  echo "$0 CONFIG_TO_SNATCH"
}
if [[ $# -eq 1 ]]
then
  TARGET=$1
else
  echo "ERROR: wrong number of args $#"
  useage
  exit 1
fi 
if [[ ! -d ~/.config/${TARGET}/ ]]; then
  echo "ERROR: ~/.config/${TARGET}/ does not exist!"
  exit 1
fi
if [[ -d ${TARGET}/.config/ ]]; then
  echo "ERROR: ${TARGET}/.config/ already exists!"
  exit 1
else
  mkdir -pv ${TARGET}/.config
fi

set -eu
mv -v ~/.config/${TARGET} ${TARGET}/.config/
stow -vvv ${TARGET}
echo "stow ${TARGET}" >> config.sh
ls -alh ~/.config|grep ${TARGET}
