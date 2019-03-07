# Get latest
git fetch origin master develop -q

LOG="git log master..develop --oneline --no-merges --no-decorate"

$LOG | while read -r commit ; do
  if echo $commit | grep -q -e "^[^:]*$"; then 
    echo $commit | cut -c 10-
  else
    echo $commit | cut -c 10- | cut -d ":" -f 1
  fi
done | \
sort -u | \
grep -v "release/*"
