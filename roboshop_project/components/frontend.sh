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
source components/common.sh

echo "installing NGINX"
yum install nginx -y &>>$LOG_FILE
STAT $?

echo "download frontend content"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG_FILE
STAT $?


echo "cleaning old content"
rm -rf /usr/share/nginx/html &>>$LOG_FILE
STAT $?

echo "Exract frontend content"
cd /tmp
unzip -o frontend.zip &>>$LOG_FILE
STAT $?


echo "copy extracted content to Nginx path"
cp -r frontend-main/static/* /usr/share/nginx/html/ &>>$LOG_FILE
STAT $?

echo "copy Nginx roboshop config"
cp frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE
STAT $?

echo " start nginx"
systemctl enable nginx &>>$LOG_FILE
systemctl start nginx &>>$LOG_FILE
STAT $?





