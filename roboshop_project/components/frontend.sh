## yum install nginx -y
## systemctl enable nginx
## systemctl start nginx

#Let's download the HTDOCS content and deploy under the Nginx path.#
# curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

#
#Deploy in Nginx Default Location.
#
#```
## cd /usr/share/nginx/html
## rm -rf *
## unzip /tmp/frontend.zip
## mv frontend-main/* .
## mv static/* .
## rm -rf frontend-master README.md
## mv localhost.conf /etc/nginx/default.d/roboshop.conf

#
#Finally restart the service once to effect the changes.
#
#```
## systemctl restart nginx
echo "installing NGINX"
LOG_FILE=/tmp/roboshop.log
rm -f $LOG_FILE

yum install nginx -y &>>$LOG_FILE
if [ $? -eq 0 ]; then
  echo -e "\e[1;32m success\e[0m"
else
  echo -e "\e[1;33m failed\e[0m"
  exit
fi

echo "download frontend content"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG_FILE
if [ $? -eq 0 ]; then
  echo -e "\e[1;32m success\e[0m"
else
  echo -e "\e[1;33m failed\e[0m"
  exit
fi

echo "cleaning old content"
rm -rf /usr/share/nginx/html &>>$LOG_FILE
if [ $? -eq 0 ]; then
  echo -e "\e[1;32m success\e[0m"
else
  echo -e "\e[1;33m failed\e[0m"
  exit
fi

echo "Exract frontend content"
cd /tmp
unzip -o frontend.zip &>>$LOG_FILE
if [ $? -eq 0 ]; then
  echo -e "\e[1;32m success\e[0m"
else
  echo -e "\e[1;33m failed\e[0m"
  exit
fi

echo "copy extracted content to Nginx path"
cp -r  frontend-main/static/* /usr/share/nginx/html/ &>>$LOG_FILE
if [ $? -eq 0 ]; then
  echo -e "\e[1;32m success\e[0m"
else
  echo -e "\e[1;33m failed\e[0m"
  exit
fi

echo "copy Nginx roboshop config"
cp frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE
if [ $? -eq 0 ]; then
  echo -e "\e[1;32m success\e[0m"
else
  echo -e "\e[1;33m failed\e[0m"
  exit
fi

echo " start nginx"
systemctl enable nginx &>>$LOG_FILE
systemctl start nginx &>>$LOG_FILE
if [ $? -eq 0 ]; then
  echo -e "\e[1;32m success\e[0m"
else
  echo -e "\e[1;33m failed\e[0m"
  exit
fi




