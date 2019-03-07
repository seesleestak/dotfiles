# Get latest
git fetch origin master develop -q

LOG="git log master..develop --oneline --no-merges --no-decorate"

BRANCH_ARRAY=()
$LOG | \
while read -r commit ; do
  echo $commit | cut -d " " -f 2 | cut -d ":" -f 1
done | \
sort -u | \
grep -v "release/*"
