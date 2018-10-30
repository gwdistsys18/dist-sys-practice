# Install LAMP server on Linux

## Prepare

1. Connect to instance.

2. Ensure that all of software packages are up to date, perform a quick software update on your instance. It is important to make sure that you have the latest security updates and bug fixes

   `sudo yum update -y` is used to update source.

3. Install the lamp-mariadb10.2-php7.2 and php7.2 Amazon Linux Extras repositories to get the latest versions of the LAMP MariaDB and PHP packages for Amazon Linux 2.

   `sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2`

4. Install the Apache web server, MariaDB, and PHP software packages.

   Use the **yum install** command to install multiple software packages and all related dependencies at the same time.

   `sudo yum install -y httpd mariadb-server`

   `yum info package_name` is used to view the current versions of packages.

5. Start the Apache web server.

   `sudo systemctl start httpd`

6. Use the **systemctl** command to configure the Apache web server to start at each system boot.

   `sudo systemctl enable httpd`

7. Add a security rule to allow inbound HTTP (port 80) connections to instance. By default, a **launch-wizard-N** security group was set up for your instance during initialization. This group contains a single rule to allow SSH connections.
   1. Open the Amazon EC2 console at <https://console.aws.amazon.com/ec2/>.
   2. Choose **Instances** and select your instance.
   3. Under **Security groups**, choose **view inbound rules**.
   4. You should see the following list of rules in your default security group
8. Test your web server. 

## Test

1. Create a PHP file in the Apache document root.
2. In a web browser, type the URL of the file that you just created. This URL is the public DNS address of your instance followed by a forward slash and the file name. 

## Secure the Database Server

1. Start the MariaDB server.
2. Run **mysql_secure_installation**.

## Install phpMyAdmin

