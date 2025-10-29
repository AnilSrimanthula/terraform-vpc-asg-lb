sudo yum update -y
sudo yum install httpd git -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl restart httpd
chkconfig httpd on
cd /var/www/html
git clone https://github.com/CleverProgrammers/pwj-netflix-clone.git
mv pwj-netflix-clone/* .
