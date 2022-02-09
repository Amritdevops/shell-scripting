#!/bin/bash
ID= $(id -u)
if [ $ID -ne 0 ]; then
  echo -e "\e[1;31m switch to root user\e[0m"
  exit
fi

bash components/$1.sh