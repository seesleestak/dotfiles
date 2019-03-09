#!/bin/bash
case "$1" in
  -j)
    CONTENT=$(xsel -ob)
    node -p "JSON.stringify($CONTENT)" | \
    python -c 'import json, sys; print(json.dumps(json.load(sys.stdin), indent=2))' | \
    xsel -ib
    ;;
  *)
    xsel -ob | \
    python -c 'import json, sys; print(json.dumps(json.load(sys.stdin), indent=2))' | \
    xsel -ib
    ;;
esac
