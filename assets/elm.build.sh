#!/bin/bash

set -e

ELM_FILES="elm/Home.elm"
ELM_COMMAND="elm make $ELM_FILES --output ../priv/static/js/elm.js --yes"

if [[ $TRAVIS = true ]]; then
  bash -c "$TRAVIS_BUILD_DIR/sysocnfcpus/bin/sysocnfcpus -n 2 $ELM_COMMAND"
else
  bash -c "$ELM_COMMAND"
fi
