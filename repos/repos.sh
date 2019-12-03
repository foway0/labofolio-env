#!/usr/bin/env bash

export LANG=C

__exec_path() {
  if [[ ! -e "$1" ]]; then
    return 1
  fi
  pushd `dirname $1` >/dev/null 2>&1
  [[ $? -eq 1 ]] && exit 1
  _dir=`pwd`
  popd >/dev/null 2>&1
  echo ${_dir}
}

__SCRIPT_DIR=`__exec_path $0`
REPOS_FILE=${__SCRIPT_DIR}/repos.conf

pushd ${__SCRIPT_DIR} >/dev/null 2>&1
for line in `cat ${REPOS_FILE} | grep -v '^#\|^$'`
do
  git clone ${line}
done
popd ${__SCRIPT_DIR} >/dev/null 2>&1