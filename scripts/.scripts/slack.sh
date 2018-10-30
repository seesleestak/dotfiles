# !/bin/sh
google-chrome-stable --app="https://hixme.slack.com/messages"
if [ $1 == '--all' ]; then
  google-chrome-stable --app="https://hixme2.slack.com/messages"
fi
