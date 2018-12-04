VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[\ ",]//g')

# Delete local branch/tag
git branch -D "release/$VERSION"
git tag -d $VERSION

# Delete remote branch/tag
git push --delete origin "release/$VERSION" $VERSION --no-verify

# Rerun release script
# npm run release:minor
