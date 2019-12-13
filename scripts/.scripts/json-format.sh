#!/bin/bash
case "$1" in
  -j)
    CONTENT=$(pbpaste)
    node -p "JSON.stringify($CONTENT)" | \
    python -c 'import json, sys; print(json.dumps(json.load(sys.stdin), indent=2))' | \
    pbcopy
    ;;
  *)
    pbpaste | \
    python -c 'import json, sys; print(json.dumps(json.load(sys.stdin), indent=2))' | \
    pbcopy
    ;;
esac
