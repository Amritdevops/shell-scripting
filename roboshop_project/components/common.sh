LOG_FILE=/tmp/roboshop.log
rm -f $LOG_FILE

STAT() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[1;32m success\e[0m"
  else
    echo -e "\e[1;33m failed\e[0m"
    exit
  fi
}
