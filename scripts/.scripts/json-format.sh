# !/bin/sh
xsel -o -b | python -c 'import json, sys; print(json.dumps(json.load(sys.stdin), indent=2))' | xsel -i -b
