IFS=$'\n'
TMP_FILE=/tmp/release-$(date -I'seconds').log

git log origin/master..origin/develop --oneline --no-merges --no-decorate > $TMP_FILE

OTHER=()
CONVENTIONAL=()
while read -r commit ; do
  if echo $commit | grep -q "release/*"; then
    continue
  elif echo $commit | grep -qE "^[^:]*$"; then 
    OTHER=("${OTHER[@]}" "$(echo $commit | cut -c 10-)")
  elif echo $commit | grep -qE "[A-Za-z]{3,11}\/[A-Za-z]{2,4}-[0-9]{1,5}"; then
    CONVENTIONAL=("${CONVENTIONAL[@]}" "$(echo $commit | cut -c 10- | cut -d ":" -f 1)")
  else
    OTHER=("${OTHER[@]}" "$(echo $commit | cut -c 10- | cut -d ":" -f 1)")
  fi
done < $TMP_FILE

echo "======= TICKETS ======="
sort -u <<<"${CONVENTIONAL[*]}"

echo "======= OTHER ======="
sort -u <<<"${OTHER[*]}"

rm $TMP_FILE
unset IFS
