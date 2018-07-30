# !/bin/sh
COUNT=$(acpi -b | wc -l)
SUM=$(acpi -b | egrep -o '[0-9]{1,3}%' | tr -d '%' | xargs -I% echo -n '+%')
echo  $(( SUM / COUNT ))%
