#!/bin/bash

# Update the system
sudo yum update -y

# Install Apache HTTP server (httpd)
sudo yum install httpd -y

# Start and enable httpd service
sudo systemctl start httpd
sudo systemctl enable httpd

# Install MySQL server
sudo yum install mysql-server -y

# Start and enable mysqld service
sudo systemctl start mysqld
sudo systemctl enable mysqld

# Secure MySQL installation (set root password and remove anonymous users)
sudo mysql_secure_installation

# Install MySQL client
sudo yum install mysql -y

# Create a MySQL database and user for the demo website
sudo mysql -e "CREATE DATABASE demo_db;"
sudo mysql -e "CREATE USER 'demo_user'@'localhost' IDENTIFIED BY 'password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON demo_db.* TO 'demo_user'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Download and extract a demo template website (replace URL with your template)
sudo yum install wget -y
wget -O demo_website.zip http://example.com/demo_website.zip
sudo yum install unzip -y
sudo unzip demo_website.zip -d /var/www/html/

# Set permissions for the web server
sudo chown -R apache:apache /var/www/html/
sudo chmod -R 755 /var/www/html/

# Restart Apache to apply changes
sudo systemctl restart httpd

echo "Installation complete. Your demo website is now accessible at http://ec2_instance_public_ip/"
