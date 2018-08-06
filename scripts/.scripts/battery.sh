# !/bin/sh
COUNT=$(acpi -b | wc -l)
SUM=$(acpi -b | egrep -o '[0-9]{1,3}%' | tr -d '%' | xargs -I% echo -n '+%')
NUM=$((SUM/COUNT))
IS_CHARGING=$(acpi -b | grep 'Charging')

if [ -n "$IS_CHARGING" ]; then
  echo CHR $NUM%
else
  if [ $NUM -gt 97 ]; then
    echo  100%
  elif [ $NUM -le 75 ]; then
    echo  $NUM%
  elif [ $NUM -le 50 ]; then
    echo  $NUM%
  elif [ $NUM -le 25 ]; then
    echo  $NUM%
  elif [ $NUM -lt 10 ]; then
    echo  $NUM%
  else
    echo  $NUM%
  fi
fi


# if [ -n "$IS_CHARGING" ]; then
#   echo CHR $NUM%
# else
#   echo $NUM%
# fi
