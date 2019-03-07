# Get latest
git fetch origin master develop -q

IFS=$'\n'
TMP_FILE=/tmp/release.log

git log master..develop --oneline --no-merges --no-decorate > $TMP_FILE

OTHER=()
CONVENTIONAL=()
while read -r commit ; do
  if echo $commit | grep -q -e "^[^:]*$"; then 
    OTHER=("${OTHER[@]}" "$(echo $commit | cut -c 10-)")
  elif echo $commit | grep -q -v "release/*"; then
    CONVENTIONAL=("${CONVENTIONAL[@]}" "$(echo $commit | cut -c 10- | cut -d ":" -f 1)")
  fi
done < /tmp/release.log

echo "TICKETS ===>"
sort -u <<<"${CONVENTIONAL[*]}"

echo "OTHER ===>"
echo "${OTHER[*]}"

rm $TMP_FILE
unset IFS
