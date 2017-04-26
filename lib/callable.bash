#! bash

callable-or-source() {
  if can "command:$1"; then
    return 0
  else
    if source-ext-maybe cogweb-"${1/:*/}" && can "command:$1"; then
      return 0
    elif source-ext-maybe cogweb-"${1%s}" && can "command:$1"; then
      return 0
    elif source-ext-maybe cogweb-other && can "command:$1"; then
      return 0
    elif source-ext-maybe cogweb-"${1/-*/}" && can "command:$1"; then
      return 0
    fi
  fi
  return 1
}

source-ext() {
  source "$1"
}

source-ext-maybe() {
  set +e
  source "$1" 2> /dev/null
  local rc=$?
  set -e
  return $rc
}
