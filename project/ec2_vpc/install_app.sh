# update linux
sudo yum update -y

# install httpd webserver
sudo yum install -y httpd

#start httpd sever
sudo systemctl start httpd

#enable httpd server
sudo systemctl enable httpd

#create file 
echo "<h1>Hello from Terraform</h1>" > /var/www/html/index.html