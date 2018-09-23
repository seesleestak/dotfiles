# !/bin/sh
xsel -ob | python -c 'import json, sys; print(json.dumps(json.load(sys.stdin), indent=2))' | xsel -ib
