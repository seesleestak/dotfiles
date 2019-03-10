#!/bin/bash
COUNT=$(acpi -b | wc -l)
# WEIGHT_1=$(acpi -bi | grep -E -o '[0-9]{1,4} mAh' | tr -d ' mAh' | sed g\;n | sed /^$/d | head -1)
# WEIGHT_2=$(acpi -bi | grep -E -o '[0-9]{1,4} mAh' | tr -d ' mAh' | sed g\;n | sed /^$/d | tail -1)
# VAL_1=$(acpi -b | egrep -o '[0-9]{1,3}%' | tr -d '%' | head -1)
# VAL_2=$(acpi -b | egrep -o '[0-9]{1,3}%' | tr -d '%' | tail -1)

SUM=$(acpi -b | egrep -o '[0-9]{1,3}%' | tr -d '%' | xargs -I% echo -n '+%')
NUM=$((SUM/COUNT))
IS_CHARGING=$(acpi -b | grep 'Charging')
IS_DISCHARGING=$(acpi -b | grep 'Discharging')
BATTERY_PERCENTAGE=" $NUM%"

if [ $NUM -lt 10 ]; then
  BATTERY_PERCENTAGE=" $NUM%"
elif [ $NUM -le 30 ]; then
  BATTERY_PERCENTAGE=" $NUM%"
elif [ $NUM -le 50 ]; then
  BATTERY_PERCENTAGE=" $NUM%"
elif [ $NUM -le 75 ]; then
  BATTERY_PERCENTAGE=" $NUM%"
elif [ $NUM -gt 97 ]; then
  BATTERY_PERCENTAGE=" 100%"
else
  BATTERY_PERCENTAGE=" $NUM%"
fi

if [ -n "$IS_DISCHARGING" ]; then
  echo $BATTERY_PERCENTAGE 
elif [ -n "$IS_CHARGING" ]; then
  echo $BATTERY_PERCENTAGE 
else
  echo $BATTERY_PERCENTAGE
fi
