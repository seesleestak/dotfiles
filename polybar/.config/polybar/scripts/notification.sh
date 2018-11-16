# !/bin/sh
if [[ -z $NOTIFICATION_STATUS ]]; then
  export NOTIFICATION_STATUS=true
fi

if [[ $NOTIFICATION_STATUS = true ]]; then
  echo 
else
  echo 
fi
