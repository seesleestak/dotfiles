#!/usr/bin/env bash
pbpaste | python -c 'import json, sys; print(json.dumps(json.load(sys.stdin), indent=2))' | pbcopy
