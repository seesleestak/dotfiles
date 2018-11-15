# !/bin/sh
STATE=$(ps -e | grep dunst | head -n 1)
if [[ -n $STATE ]]; then
  echo 
else
  echo 
fi
