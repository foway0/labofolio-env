#!/usr/bin/env bash

__execpath() {
  if [ ! -e "$1" ]; then
    return 1
  fi
  pushd `dirname $1` >/dev/null 2>&1
  [ $? -eq 1 ] && exit 1
  _dir=`pwd`
  popd >/dev/null 2>&1
  echo ${_dir}
}

__SCRIPT_DIR=`__execpath $0`
__NAME="foway/linux"
__TAG="1.0.0"
__IMAGES=`echo ${__NAME}:${__TAG}`

docker build -t ${__IMAGES} ${__SCRIPT_DIR}