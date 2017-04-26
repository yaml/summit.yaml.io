#! bash

cogweb-id() {
  cat /dev/urandom |
    LC_CTYPE=C tr -cd A-HJ-NP-Z2-9 |
    fold -w4 |
    grep [A-Z] |
    grep [0-9] |
    head -n1
}

cogweb-new-id() {
  local id
  while true; do
    id=$(cogweb-id)
    [[ -e .cog/$id.cog ]] || break
  done
  echo $id
}

cogweb-validate() {
  local id=$1
  local file=".cog/$id"
  return 0
}

cogweb-link() {
  :
}

cogweb-commit() {
  :
}
