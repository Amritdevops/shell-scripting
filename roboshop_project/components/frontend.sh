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

echo "download frontend content"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG_FILE

echo "cleaning old content"
rm -rf /usr/share/nginx/html &>>$LOG_FILE

echo "Exract frontend content"
cd /usr/share/nginx/html &>>$LOG_FILE
unzip /tmp/frontend.zip &>>$LOG_FILE







