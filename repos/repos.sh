#!/bin/bash

SCRIPT_PATH="$(cd "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P)"
REPOS_FILE="${SCRIPT_PATH}/repos.conf"

init() {
  pushd "${SCRIPT_PATH}" >/dev/null 2>&1 || exit
  while read -r line
  do
    _url=$(echo "$line" | cut -d' ' -f1)
    _name=$(echo "$line" | cut -d' ' -f2)
    _branch=$(echo "$line" | cut -d' ' -f3)
    if [ -d "./${_name}" ]
    then
      echo "SKIP... ${_name} directory already exists"
    else
      echo "clone repositories"

      git clone "${_url}" "${_name}"

      git checkout "${_branch}"
    fi
  done < "$REPOS_FILE"
  popd "${SCRIPT_PATH}" >/dev/null 2>&1 || exit
}

case "$1" in
  "init" )
    init;;
  * )
    echo "???";;
esac