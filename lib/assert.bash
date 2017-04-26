#! bash

use System

assert:cogweb() {
  [[ -d .cog ]] ||
    err "Current directory is not a cogweb"
}
