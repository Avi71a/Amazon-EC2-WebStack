# EC2 Stack Setup

This script automates the setup of an Apache HTTP server and MySQL database on a CentOS EC2 instance, along with deploying a basic demo website.

## Installation Steps:

1. **Update the System:**
   ```
   sudo yum update -y
   ```

2. **Install Apache HTTP Server:**
   ```
   sudo yum install httpd -y
   ```

3. **Start and Enable HTTP Server:**
   ```
   sudo systemctl start httpd
   sudo systemctl enable httpd
   ```

4. **Install MySQL Server:**
   ```
   sudo yum install mysql-server -y
   ```

5. **Start and Enable MySQL Server:**
   ```
   sudo systemctl start mysqld
   sudo systemctl enable mysqld
   ```

6. **Secure MySQL Installation:**
   ```
   sudo mysql_secure_installation
   ```

7. **Install MySQL Client:**
   ```
   sudo yum install mysql -y
   ```

8. **Create MySQL Database and User:**
   ```
   sudo mysql -e "CREATE DATABASE demo_db;"
   sudo mysql -e "CREATE USER 'demo_user'@'localhost' IDENTIFIED BY 'password';"
   sudo mysql -e "GRANT ALL PRIVILEGES ON demo_db.* TO 'demo_user'@'localhost';"
   sudo mysql -e "FLUSH PRIVILEGES;"
   ```

9. **Download and Extract Demo Website:**
   ```
   sudo yum install wget -y
   wget -O free-template.zip http://example.com/free-template.zip
   sudo yum install unzip -y
   sudo unzip free-template.zip -d /var/www/html/
   ```

10. **Set Permissions and Restart Apache:**
    ```
    sudo chown -R apache:apache /var/www/html/
    sudo chmod -R 755 /var/www/html/
    sudo systemctl restart httpd
    ```

11. **Access Your Demo Website:**
    Open a web browser and navigate to `http://your_ec2_instance_public_ip/`




Feel free to customize the script and update configurations based on your specific needs. For security 
## Usage:

1. Run the script: ./setup-ec2-stack.sh
2. Follow on-screen instructions to secure MySQL and set a password.
3. Access your demo website at http://your_ec2_instance_ip/

Feel free to customize the script for your specific requirements. Ensure a strong password for MySQL user security.

Enjoy your EC2 WebStack! 🚀
