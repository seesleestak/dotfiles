# !/bin/sh
xclip -o -selection clipboard | python -c 'import json, sys; print(json.dumps(json.load(sys.stdin), indent=2))' | xclip -selection clipboard
