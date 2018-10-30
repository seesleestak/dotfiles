# !/bin/sh
case $1 in
  -a|--all)
    google-chrome-stable --app="https://hixme.slack.com/messages"
    google-chrome-stable --app="https://hixme2.slack.com/messages"
    ;;
  -2|--hixme2)
    google-chrome-stable --app="https://hixme2.slack.com/messages"
    ;;
  *)
    google-chrome-stable --app="https://hixme.slack.com/messages"
    ;; 
esac
