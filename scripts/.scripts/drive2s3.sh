# !/bin/sh
# Path for tmp list file
FILE=/tmp/gdrive-list

# Path for tmp downloads
DOWNLOAD_PATH=/tmp/gdrive-dl

# Setting globals from config if they exist
if [[ -f ~/.drive2s3 ]]; then
  CONFIG_GDRIVE_ID=$(cat ~/.drive2s3 | grep GDRIVE_ID | cut -d "=" -f 2)   
  CONFIG_S3_LINK=$(cat ~/.drive2s3 | grep S3_LINK | cut -d "=" -f 2)   
  CONFIG_MAX=$(cat ~/.drive2s3 | grep MAX | cut -d "=" -f 2)
fi

if [[ ! -f ~/.aws/credentials ]]; then
  echo "Please configure AWS CLI before running this script."
  echo "To do that, run \"aws configure\"."
  exit
elif [[ ! -f ~/.gdrive/token_v2.json ]]; then
  echo "Please configure gdrive before running this script."
  echo "To do that, run the \"gdrive\" command."
  exit
fi

# Find all state directories
if [ -n "$CONFIG_GDRIVE_ID" ]; then
  GDRIVE_ID="$CONFIG_GDRIVE_ID" 
else
  echo -n "Enter source Google Drive directory ID: "
  read GDRIVE_ID
fi

gdrive list --query " '$GDRIVE_ID' in parents" --max $CONFIG_MAX > $FILE

# Remove the header row from the gdrive list output
tail -n +2 "$FILE" > "$FILE.tmp" && mv "$FILE.tmp" "$FILE"

migrateAll() {
  if [ -n "$CONFIG_S3_LINK" ]; then
    S3_LINK="$CONFIG_S3_LINK"
  else
    echo -n "Enter target S3 link: "
    read S3_LINK
  fi

  echo "migrateAll()"
  cat $FILE | while read line; do
  read -r ID NAME TYPE SIZE CREATED <<< $line
    echo "ID: $ID"
    echo "State: $NAME"
    echo "============================================="

    # Dowload state directory
    #
    # TODO: Implement exponential backoff to address "Rate limit exceeded" errors
    # https://developers.google.com/drive/api/v3/handle-errors#403_rate_limit_exceeded
    gdrive download $ID --recursive --force

    # Upload to S3
    aws s3 sync $DOWNLOAD_PATH/$NAME $S3_LINK/$NAME/
  done
}

migrateState() {
  if [ -n "$CONFIG_S3_LINK" ]; then
    S3_LINK="$CONFIG_S3_LINK"
  else
    echo -n "Enter target S3 link: "
    read S3_LINK
  fi

  LINE=$(cat $FILE | grep $1)
  read -r ID NAME TYPE SIZE CREATED <<< $LINE

  echo "migrateState()"
  echo "ID: $ID"
  echo "State: $NAME"
  echo "============================================="

  # Prompt to make sure grep returned the right result
  echo -n "Proceed? [y/n]: "
  read ans
  case $ans in
    n|N)
      exit
      ;;
    y|Y|"")
      # Dowload state directory
      gdrive download $ID --recursive --force --path $DOWNLOAD_PATH

      # Upload to S3
      aws s3 sync $DOWNLOAD_PATH/$NAME $S3_LINK/$NAME/
      ;;
    *)
      echo "Please enter y or no"
      exit
      ;;
  esac
}

case $1 in
  -s|--state)
    migrateState $2
    ;;
  -a|--all)
    migrateAll
    ;; 
  *)
    printf "\n"
    cat $FILE
    ;;
esac

# Clean up
echo "Cleaning up..."
rm -rf $FILE $DOWNLOAD_PATH
