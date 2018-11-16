# !/bin/sh
STATE=$(ps -e | grep dunst | head -n 1)

if [[ -n $STATE ]]; then
  notify-send "Silencing notifications..."
  sleep 2
  notify-send DUNST_COMMAND_PAUSE
else
  notify-send DUNST_COMMAND_RESUME
  notify-send "Resuming notification service..."
fi
