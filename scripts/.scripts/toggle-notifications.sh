# !/bin/sh
STATE=$(ps -e | grep dunst | head -n 1)

if [[ -n $STATE ]]; then
  notify-send "Silencing notifications..."
  sleep 2
  killall dunst
else
  notify-send "Resuming notification service..."
fi
