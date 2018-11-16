# !/bin/sh
if [[ -z $NOTIFICATION_STATUS ]]; then
  export NOTIFICATION_STATUS=true
fi

if [[ $NOTIFICATION_STATUS = true ]]; then
  notify-send "Silencing notifications..." -t 1500
  sleep 2
  notify-send DUNST_COMMAND_PAUSE
  export NOTIFICATION_STATUS=false
else
  notify-send DUNST_COMMAND_RESUME
  notify-send "Resuming notification service..."
  export NOTIFICATION_STATUS=true
fi
