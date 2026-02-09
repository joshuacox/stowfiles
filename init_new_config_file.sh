#!/usr/bin/env bash
: ${DEBUG:="false"}
set -eu
useage () {
  echo "$0 PACKAGE_NAME PATH_TO_FILE_DIR_IN_HOME CONFIG_FILE_TO_SNATCH"
  echo "e.g."
  echo "$0 hypr .config/hypr hyprland.conf"
}

linerrr () {
  if [[ ! $# -eq 2 ]]; then
    echo "wrong args $#"
    echo "useage:"
    echo "$0 line_to_add file_to_add_to"
    exit 1
  fi
  line_to_add=$1
  file_to_add_to=$2
  if ! grep -q "$line_to_add" "${file_to_add_to}"; then
    touched=1
    echo "$line_to_add" | sudo tee -a "${file_to_add_to}" > /dev/null
    echo "$line_to_add added to ${file_to_add_to}"
  else
    if [[ "$DEBUG" == "true" ]]; then
      echo "$line_to_add already exists in ${file_to_add_to}"
    fi
  fi
}

main () {
  if [[ $# -eq 3 ]]
  then
    TARGET_PACKAGE=$1
    TARGET_DIR=$2
    TARGET_FILE=$3
  else
    echo "ERROR: wrong number of args $#"
    useage
    exit 1
  fi 
  if [[ ! -f ${HOME}/${TARGET_DIR}/${TARGET_FILE} ]]; then
    echo "ERROR: ${HOME}/${TARGET_DIR}/${TARGET_FILE} does not exist!"
    exit 1
  fi
  if [[ -d ${TARGET_DIR} ]]; then
    echo "WARN: ${TARGET_DIR} already exists, not creating"
  else
    mkdir -pv ./${TARGET_PACKAGE}/${TARGET_DIR}/
  fi
  if [[ -f ${TARGET_DIR}/${TARGET_FILE} ]]; then
    echo "ERROR: ${TARGET_DIR}/${TARGET_FILE} already exists!"
    exit 1
  fi
  
  mv -v ${HOME}/${TARGET_DIR}/${TARGET_FILE} ./${TARGET_PACKAGE}/${TARGET_DIR}/${TARGET_FILE}
  STOW_CMD="stow -vvv ${TARGET_PACKAGE}"
  set -x
  ${STOW_CMD}
  linerrr "${STOW_CMD}" "./stow_all.sh"
  ls -alh ${HOME}/${TARGET_DIR}/${TARGET_FILE}
}

main $@
