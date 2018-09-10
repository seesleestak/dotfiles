# !/bin/sh
COUNT=$(acpi -b | wc -l)
# WEIGHT_1=$(acpi -bi | grep -E -o '[0-9]{1,4} mAh' | tr -d ' mAh' | sed g\;n | sed /^$/d | head -1)
# WEIGHT_2=$(acpi -bi | grep -E -o '[0-9]{1,4} mAh' | tr -d ' mAh' | sed g\;n | sed /^$/d | tail -1)
# VAL_1=$(acpi -b | egrep -o '[0-9]{1,3}%' | tr -d '%' | head -1)
# VAL_2=$(acpi -b | egrep -o '[0-9]{1,3}%' | tr -d '%' | tail -1)

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
