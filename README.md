# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

Name: Qi Bao <br>
Github Name: [C91CBQ](https://github.com/C91CBQ)

## Check List
##### Docker and Containers
- [ ] Beginner Level
- [ ] Intermediate Level

##### Big Data and Machine Learning
- [ ] Beginner Level
- [ ] Intermediate Level

##### Cloud Web Applications
- [x] Beginner Level
- [x] Intermediate Level

##### SDN and NFV
- [x] Beginner Level
- [ ] Intermediate Level


## [Cloud Web Apps](https://gwdistsys18.github.io/learn/web/)
### Beginner Level
#### [AWS Tutorial: Launch a VM](https://aws.amazon.com/getting-started/tutorials/launch-a-virtual-machine/)  
1. Amazon Elastic Compute Cloud (EC2) is the Amazon Web Service you use to create and run virtual machines in the cloud. AWS calls these virtual machines 'instances'.
1. Launch a VM:
    * Click **EC2** console.
    * Select an instance and launch.
    * Create a key pair and download it.
    * Move key pair into .ssh subdirectory and set restrict permissions.
    ```
    mv ~/Downloads/MyKeyPair.pem ~/.ssh/MyKeyPair.pem
    chmod 400 ~/.ssh/mykeypair.pem
    ```
    * Use ssh to connect the instance.
    ```
    ssh -i ~/.ssh/MyKeyPair.pem ec2-user@{IP_Address}
    ```
    * Terminate the instance in console.
    * Example:
    ![Example Screenshot](/img/ec2-example.png)

*Cost 15 minutes, finished on Oct 13th, 2018.*
____
#### [QwikLab: Intro to S3](https://awseducate.qwiklabs.com/focuses/30?parent=catalog)
1. Amazon Simple Storage Service (Amazon S3) is storage for the Internet. Amazon S3 is used to store and retrieve any amount of data at any time, from anywhere on the web.
1. Create a S3 Bucket and Upload Image
    * Click **Create Bucket** and Input a bucket name.
    * Check config options, select versioning.
    * Exam the permissions.
    * Click Create Bucket.
    * In S3 console, click upload image.
1. Set Object Permissions:
    * Public Permission:
        * In S3 console, click **Permission Tab**.
        * Under the **Public Access** section, select **Everyone**.
        * Select **Read Object** and Save.
    * Bucket Policy:
        * Bucket Policy is a set of permissions associated with an Amazon S3 bucket. It can be used to control access to a whole bucket or to specific directories within a bucket.
        * Create a **Bucket Policy** with example as following:
        ```
        {
            "Version": "2012-10-17",
            "Id": "Policy1539460848531",
            "Statement": [
                {   
                    "Sid": "Stmt1539460847088",
                    "Effect": "Allow",
                    "Principal": "*",
                    "Action": "s3:GetObject",
                    "Resource": "arn:aws:s3:::mybucket10132018/*"
                }
            ]
        }
        ```
1. Versioning:
    *  Versioning is a means of keeping multiple variants of an object in the same bucket. You can use versioning to preserve, retrieve, and restore every version of every object stored in your Amazon S3 bucket. With versioning you can easily recover from both unintended user actions and application failures.
    * Click **Latest Version** tab to change version.
    * Also change **Bucket Policy**'s Action for old version permissions.
    ```
    {
        "Version": "2012-10-17",
        "Id": "Policy1539460848531",
        "Statement": [
            {   
                "Sid": "Stmt1539460847088",
                "Effect": "Allow",
                "Principal": "*",
                "Action": [
                    "s3:GetObject",
                    "s3:GetObjectVersion"
                ]
                "Resource": "arn:aws:s3:::mybucket10132018/*"
            }
        ]
    }
    ```

*Cost 30 minutes, finished on Oct 13th, 2018.*
____

### Intermediate Level
#### *Virtual Machines, Websites, and Databases:*

#### [Video: Virtualization](https://www.youtube.com/watch?v=GIdVRB5yNsk)
1. History: Virtualization first brought up in 1970s. IBM build the virtual machine on the top of physical computer and then realize multiple virtual machines can be run at the same time.

1. Hypervisor: A hypervisor or virtual machine monitor (VMM) is computer software, firmware or hardware that creates and runs virtual machines. A computer on which a hypervisor runs one or more virtual machines is called a host machine, and each virtual machine is called a guest machine. The hypervisor presents the guest operating systems with a virtual operating platform and manages the execution of the guest operating systems. Multiple instances of a variety of operating systems may share the virtualized hardware resources: for example, Linux, Windows, and macOS instances can all run on a single physical x86 machine. This contrasts with operating-system-level virtualization, where all instances (usually called containers) must share a single kernel, though the guest operating systems can differ in user space, such as different Linux distributions with the same kernel.

*Cost 20 minutes, finished on Oct 26th, 2018.*
____
#### [AWS Tutorial: Install a LAMP Web Server on Amazon Linux 2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html)
1. Prepare the LAMP Server
 * Connect to instance
 * Ensure all software packages are up to date
 ```
 sudo yum update -y
 ```
 * Install the lamp-mariadb10.2-php7.2 and php7.2 Amazon Linux Extras repositories to get the latest versions of the LAMP MariaDB and PHP packages for Amazon Linux 2.
 ```
 sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
 ```
 * Install the Apache web server, MariaDB, and PHP software packages.
 ```
 sudo yum install -y httpd mariadb-server
 ```
 * Start the Apache web server.
 ```
 sudo systemctl start httpd
 ```
 * Use the systemctl command to configure the Apache web server to start at each system boot.
 ```
 sudo systemctl enable httpd
 ```
 * Add a security rule to allow inbound HTTP (port 80) connections to instance
    * Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.
    * Choose **Instances** and select your instance.
    * Under **Security groups**, choose **view inbound rules**.
    * Using the procedures in Adding Rules to a Security Group, add a new inbound security rule with the following values:
    ```
    Type: HTTP
    Protocol: TCP
    Port Range: 80
    Source: Custom
    ```

 * Test web server
    * Access Apache test page
    ![Test Page](./img/test.png)

 * Set file permissions
    * Add user to Apache group
    ```
    sudo usermod -a -G apache qibao
    ```
    * Log out and then log back in again to pick up the new group, and then verify membership
    ```
    exit
    groups
    qibao adm wheel apache systemd-journal
    ```
    * Change the group ownership of /var/www and its contents to the apache group.
    ```
    sudo chown -R qibao:apache /var/www
    ```
    * To add group write permissions and to set the group ID on future subdirectories, change the directory permissions of /var/www and its subdirectories.
    ```
    sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
    ```
    * To add group write permissions, recursively change the file permissions of /var/www and its subdirectories:
    ```
    find /var/www -type f -exec sudo chmod 0664 {} \;
    ```
1. Test LAMP Server
    * Create a PHP file in the Apache document root.
    ```
    echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
    ```
    * Verify all of the required packages were installed.
    ```
    sudo yum list installed httpd mariadb-server php-mysqlnd
    ```
    * Delete the phpinfo.php file.
    ```
    rm /var/www/html/phpinfo.php
    ```
1. Secure the Database Server
    * Start the MariaDB server
    ```
    sudo systemctl start mariadb
    ```
    * Run mysql_secure_installation
    ```
    sudo mysql_secure_installation
    ```
    * Stop MariaDB server
    ```
    sudo systemctl stop mariadb
    ```
    * Configure MariaDB to start at every system boot
    ```
    sudo systemctl enable mariadb
    ```
1. Install phpMyAdmin
    * Install the required dependencies.
    ```
    sudo yum install php-mbstring -y
    ```
    * Restart Apache.
    ```
    sudo systemctl restart httpd
    ```
    * Restart php-fpm.
    ```
    sudo systemctl restart php-fpm
    ```
    * Navigate to the Apache document root at /var/www/html.
    ```
    cd /var/www/html
    ```
    * Select a source package for the latest phpMyAdmin release from https://www.phpmyadmin.net/downloads.
    ```
    wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
    ```
    * Create a phpMyAdmin folder and extract the package into it with the following command.
    ```
    mkdir phpMyAdmin && tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C phpMyAdmin --strip-components 1
    ```
    * Delete the phpMyAdmin-latest-all-languages.tar.gz tarball.
    ```
    rm phpMyAdmin-latest-all-languages.tar.gz
    ```
    * If the MariaDB server is not running, start it now.
    ```
    sudo systemctl start mariadb
    ```
    * phpMyAdmin Login Page
    ![Login Page](./img/login.png)

*Cost 60 minutes, finished on Oct 26th, 2018.*
____
#### Compare the performance, functionality, and price when serving web content from S3 versus an EC2 VM

| S3 | EC2 |
---|---|---
performance | Highly scalable, reliable, fast, and durable. | Highly load balance performance.
functionality | Hosted static web content and assets like videos, photos, text file and any other format file. | Hosted dynamic content or running service.
price | Pay-As-You-Go (Only pay for the storage consumed, with different options depending upon how often/fast you wish to retrieve the objects.) | Long-term pricing available for discounts. But expensive upfront payment if not using server for entire purchase length.

*Cost 20 minutes, finished on Oct 26th, 2018.*
____
#### [QwikLab: Intro to DynamoDB](https://awseducate.qwiklabs.com/focuses/23?parent=catalog)
* Introduction: Amazon DynamoDB is a fast and flexible NoSQL database service for all applications that need consistent, single-digit millisecond latency at any scale. It is a <strong>fully managed database</strong> and supports both document and key-value data models. Its flexible data model and reliable performance make it a great fit for mobile, web, gaming, ad-tech, IoT, and many other applications.
* Create a New Table
    * In the AWS Management Console, click <strong>Services</strong>,  then click <strong>DynamoDB</strong>.
    * Click <strong>Create table</strong>.
    *  For <strong>Table name</strong>, type: <input readonly class="copyable-inline-input" size="5" type="text" value="Music">
    * For <strong>Primary key</strong>, type <input readonly class="copyable-inline-input" size="6" type="text" value="Artist"> and leave <strong>String</strong> selected.
    * Select <i class="far fa-check-square"></i> <strong>Add sort key</strong>, then in the new field type <input readonly class="copyable-inline-input" size="4" type="text" value="Song"> and leave <strong>String</strong> selected.
    * Click <strong>Create</strong>.
* Add Data
    * Each table contains multiple items. An item is a group of attributes that is uniquely identifiable among all of the other items. Items in DynamoDB are similar in many ways to rows in other database systems. In DynamoDB, there is no limit to the number of items you can store in a table.

    * Each item is composed of one or more attributes. An attribute is a fundamental data element, something that does not need to be broken down any further.

    * When you write an item to a DynamoDB table, only the Primary Key and Sort Key (if used) are required. Other than these fields, the table does not require a schema. This means that you can add attributes to one item that may be different to the attributes on other items.

    * Each item is capable of having different attributes without having to pre-define a table schema, which demonstrates the flexibility of a NoSQL database.

* Query the Table (Query and Scan)
    * A <strong>query</strong> operation finds items based on Primary Key and optionally Sort Key. It is fully indexed, so it runs very fast. A query is the most efficient way to retrieve data from a DynamoDB table.
    * Another way is to **scan** for an item. This involves looking through **every item in a table**, so it is less efficient and can take significant time for larger tables.
* Delete the Table
    * Click <strong>Delete table</strong>. On the confirmation panel, click <strong>Delete</strong>.

*Cost 30 minutes, finished on Oct 27th, 2018.*
____
#### [AWS Tutorial: Deploy a Scalable Node.js Web App](https://aws.amazon.com/getting-started/projects/deploy-nodejs-web-app/?trk=gs_card)
*Cost 30 minutes, finished on Oct 27th, 2018.*
____

#### *Serverless and Edge Computing:*
#### [QwikLab: Intro to AWS Lambda](https://awseducate.qwiklabs.com/focuses/36?parent=catalog)
*Cost 30 minutes, finished on Oct 27th, 2018.*
____
#### [QwikLab: Intro to Amazon API Gateway](https://awseducate.qwiklabs.com/focuses/21?parent=catalog)
*Cost 30 minutes, finished on Oct 27th, 2018.*
____
#### [AWS Tutorial: Build a Serverless Web Application](https://aws.amazon.com/getting-started/projects/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/?trk=gs_card)
*Cost 30 minutes, finished on Oct 27th, 2018.*
____
#### *Bring it together:*
#### [AWS Tutorial: Build a Modern Web Application](https://aws.amazon.com/getting-started/projects/build-modern-app-fargate-lambda-dynamodb-python/?trk=gs_card)
*Cost 30 minutes, finished on Oct 27th, 2018.*
____


## [SDN and NFV](https://gwdistsys18.github.io/learn/sdnfv/)
### Beginner Level
#### [Video: Introduction to SDN](https://www.youtube.com/watch?v=DiChnu_PAzA)

1. Definition:
    * Software-defined networking (SDN) technology is an approach to cloud computing that facilitates network management and enables programmatically efficient network configuration in order to improve network performance and monitoring.

1. Main Goal of SDN
    * Make network to be open and programmable.

1. 3 layer model of Operating System (analogy for an SDN model)
    * Application Layer
    * Operating System with Core Service as middleware.
    * Hardware Layer with CPU, storage, memory and network as infrastructure.

1. 3 layer model of SDN
    * Network Application Layer.
    * Network Operating System with Core Service or called as SDN Controller.
    * Network forwarding devices as infrastructure.

1. Layer details
    * Network Applications
    * Application Interfaces:
        * Java API
        * Northbound (e.g. RESTConf)
    * SDN Controller/Control Panel
        * Topology Service
        * Inventory Service
        * Statistic Service
        * Host Tracking
    * SouthBound Interfaces:
        * OpenFlow
        * OVSDB
        * NETCONF
        * SNMP
    * Forwarding Devices/Data Plane

1. Availability and Scalability
    * Logically Centralized rather than Physically Centralized.
    * Cluster Networking Operating System.
    * Separate Networking Operating System into different regions.
    * SDN Controller is designed in hierarchy.

1. SDN vs traditional networks
    * Traditional networks nodes have a data plane and a control plane both contained within a single physic system.
    * Traditional networks nodes are proprietary locked boxes. The control plane is chained to the data plane and both are coupled together in a single networking nodes.
    * In traditional networks, each node is configured individually. These control planes must communicate using distributed protocols. This paradigm is typically complex.

*Cost 30 minutes, finished on Oct 13th, 2018.*
____

#### [Tutorial: Using the OpenDaylight SDN Controller with the Mininet Network Emulator](http://www.brianlinkletter.com/using-the-opendaylight-sdn-controller-with-the-mininet-network-emulator/)
1. OpenDaylight (ODL): is a popular open-source SDN controller framework.  It is a modular open platform for customizing and automating networks of any size and scale. The OpenDaylight Project arose out of the SDN movement, with a clear focus on network programmability. It was designed from the outset as a foundation for commercial solutions that address a variety of use cases in existing network environments.
1. Setup
    * Using Virtual Machines
    * Setting up the OpenDaylight Virtual Machine
        * Configure OpenDaylight VM interfaces
        ```
        ip addr show
        sudo dhclient enp0s8  
        ip addr show enp0s8
        sudo nano /etc/network/interfaces
        ```
        Add the following lines to the end of the file /etc/network/interfaces:
        ```
        # the host-only network interface
        auto enp0s8
        iface enp0s8 inet dhcp
        ```
        * Connect to the OpenDaylight VM using SSH
        ```
        ssh -X qibao@172.31.35.79
        ```
        * Install Java and set JAVA_HOME environment
        ```
        sudo apt-get update
        sudo apt-get install default-jre-headless
        ```
        * Install OpenDaylight
        ```
        wget https://nexus.opendaylight.org/content/groups/public/org/opendaylight/integration/distribution-karaf/0.4.0-Beryllium/distribution-karaf-0.4.0-Beryllium.tar.gz
        tar -xvf distribution-karaf-0.4.0-Beryllium.tar.gz
        ```
        * Start OpenDaylight
        ```
        cd distribution-karaf-0.4.0-Beryllium
        ./bin/karaf
        ```
        * Install OpenDaylight features
        ```
        opendaylight-user@root> feature:install odl-restconf odl-l2switch-switch odl-mdsal-apidocs odl-dlux-all
        ```
        * Stop OpenDaylight
        ```
        <ctrl-d>
        ```
    * Set up the Mininet Virtual Machine
        * Connect to the Mininet VM using SSH
        ```
        ssh -X 172.31.35.79
        ```
        * Start Mininet
        ```
        udo mn --topo linear,3 --mac --controller=remote,ip=192.168.56.101,port=6633 --switch ovs,protocols=OpenFlow13
        ```
        * Test the network
        ```
        mininet> pingall
        *** Ping: testing ping reachability
        h1 -> h2 h3
        h2 -> h1 h3
        h3 -> h1 h2
        *** Results: 0% dropped (6/6 received)
        ```
    * The OpenDaylight Graphical User Interface
        * Topology
        * Nodes
        * YangUI
    * Capturing OpenFlow Messages
    ```
    sudo wireshark &
    ```
    ![Capture Screenshot](/img/capture.png)
    * Shut down the project
    ```
    mininet> exit
    mininet@mininet:~$ sudo mn -c
    mininet@mininet:~$ sudo shutdown -h now
    system:shutdown
    sudo shutdown -h now
    ```

*Cost 60 minutes, finished on Oct 20th, 2018.*
____
