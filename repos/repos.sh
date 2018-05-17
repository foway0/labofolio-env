#!/usr/bin/env bash

export LANG=C

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
REPOS_FILE=${__SCRIPT_DIR}/repos.conf

init() {
  pushd ${__SCRIPT_DIR} >/dev/null 2>&1
  for line in `cat ${REPOS_FILE} | grep -v '^#\|^$'`
  do
    _line=`echo ${line} | sed -e 's/  */ /g'`
    _url=`echo ${_line} | cut -d ' ' -f 1`

    git clone ${_url}
  done
  popd ${__SCRIPT_DIR} >/dev/null 2>&1
}

clean() {
  pushd ${__SCRIPT_DIR} >/dev/null 2>&1
  for line in `cat ${REPOS_FILE} | grep -v '^#\|^$'`
  do
    _line=`echo ${line} | sed -e 's/  */ /g'`
    _name=`echo ${_line} | cut -d ' ' -f 2`

    rm -rf ${__SCRIPT_DIR}/${_name}
  done
  popd ${__SCRIPT_DIR} >/dev/null 2>&1
}

# run!!
if [ "x$1" == "xinit" ]; then
  init
elif [ "x$1" == "xclean" ]; then
  clean
else
  echo "????????????"
fi