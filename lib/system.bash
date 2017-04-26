#! bash

osx() {
  [[ $OSTYPE =~ ^darwin ]]
}

linux() {
  [[ $OSTYPE =~ ^linux ]]
}

have() {
  type "$1" &>/dev/null
}

missing() {
  ! (have "$@")
}

docker-running() {
  if osx; then
    have docker-machine || return 1
  fi

  docker ps &>/dev/null &
  local pid=$!
  sleep 2 && kill $pid &>/dev/null &
  wait $pid
  local rc=$?
  if [[ $rc -eq 127 ]]; then
    rc=0
  fi
  return $rc
}

say() {
  if ! $option_quiet; then
    echo "$@"
  fi
}

warn() {
  echo "Warning: $@" >&2
}

o() {
  if $option_verbose; then
    echo "* $@"
  fi
}

error() {
  local msg="Error: $1" usage=
  # TODO Generate this later:
#   source-ext cogweb-help-functions.bash
#   if can "help:$command"; then
#     msg=$'\n'"$msg"$'\n'"$("help:$command")"$'\n'
#   fi
  echo "$msg" >&2
  exit 1
}

err() {
  echo "Error: $@" >&2
  exit 1
}

pager() {
  less -FRX
}

abort() { echo "Abort: $1" >&2; exit 1; }
