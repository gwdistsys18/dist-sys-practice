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
* Architecture:
![AWS Architecture](./img/AWS.png)
* Launch an Elastic Beanstalk Environment
    * Open the Elastic Beanstalk console using this preconfigured link: console.aws.amazon.com/elasticbeanstalk/home#/newApplication?applicationName=tutorials&environmentType=LoadBalanced&instanceType=t2.micro
    * For **Platform**, choose Node.js
    * For **Application code**, choose **Sample application**.
    * **Review and launch**, then **Create app**.
    ![Create Page](./img/node.png)
    * Elastic Beanstalk takes about five minutes to create the environment with the following resources:
        * EC2 instance
        * Instance security group
        * Load balancer
        * Load balancer security group
        * Auto Scaling group
        * Amazon S3 bucket
        * Amazon CloudWatch alarms
        * AWS CloudFormation stack
        * Domain name
* Add Permissions to Environment’s Instances
    * Open the **Roles page** in the IAM console.
    * Choose **aws-elasticbeanstalk-ec2-role**
    * On the **Permissions** tab, under **Managed Policies**, choose **Attach Policy**.
        * AmazonSNSFullAccess
        * AmazonDynamoDBFullAccess
        ![Attach Policy](./img/policy.png)
* Deploy the Sample Application
    * Open the Elastic Beanstalk console.
    * Navigate to the management page for your environment.
    * Upload file and Deploy.
    ![Upload and Deploy](./img/upload.png)
* Create a DynamoDB Table
    * Open the Tables page in the DynamoDB management console.
    * Choose Create table with following settings, then Create:
        * Table name – nodejs-tutorial
        * Primary key – email
        * Primary key type – String

* Update the Application's Configuration Files
    * Extract the project files from the source bundle
    ```
    mkdir nodejs-tutorial
    cd nodejs-tutorial
    unzip ~/Downloads/eb-node-express-sample-v1.0.zip
    ```
    * Open .ebextensions/options.config and change the values of the following settings:
        * NewSignupEmail – Your email address.
        * STARTUP_SIGNUP_TABLE – nodejs-tutorial
        This configures the application to use the nodejs-tutorial table instead of the one created by .ebextensions/create-dynamodb-table.config, and sets the email address that the Amazon SNS topic uses for notifications.
    * Remove .ebextensions/create-dynamodb-table.config.
    ```
    rm .ebextensions/create-dynamodb-table.config
    ```
    * Create a source bundle from the modified code.
    ```
    zip nodejs-tutorial.zip -r * .[^.]*
    ```
* Configure Your Environment for High Availability
    * Navigate to **the management page**.
    * Choose **Configuration**.
    * On the **Capacity** configuration card, choose **Modify**.
    * In the **Auto Scaling Group** section, set **Min instances** to 2, then **Apply**.
    ![Availability](./img/availability.png)

* Cleanup
    * **Terminate** Elastic Beanstalk environment
    * **Delete** a DynamoDB table

*Cost 60 minutes, finished on Oct 27th, 2018.*
____

#### *Serverless and Edge Computing:*
#### [QwikLab: Intro to AWS Lambda](https://awseducate.qwiklabs.com/focuses/36?parent=catalog)
* Scenario
    * AWS Lambda Application Flow:
    ![Lambda](./img/lambda.png)
* Create Amazon S3 Buckets
    * On the **Services** menu, select **S3**
    * **Create bucket**, with name images-1234, as the source bucket for original uploads
    * Create another bucket, with name images-1234-resized, as the output bucket for thumbnails
    * Upload the HappyFace.jpg to source bucket
* Create an AWS Lambda Function
    * On the **Services** menu, select **Lambda**
    * In the create function to configure:
    This role grants permission to the Lambda function to read and write images in S3
        ```
        Name: Create-Thumbnail
        Runtime: Python 3.6
        Existing role: lambda-execution-role
        ```
    * **Add triggers** and **Configure triggers**:
    ```
    Bucket: image-bucket
    Event type: Object Created (All)
    ```
    * Create-Thumbnail
    ![Create Thumbnail](./img/thumbnail.png)
    * Configure in **Function Code**
    ```
    Code entry type: Upload a file from Amazon S3
    Runtime: Python 3.6
    Handler: CreateThumbnail.handler
    ```
    * Review the **Description** and click **Save**
* Test Lambda Function
    * Click **Test** then configure:
    ```
    Event template: Amazon S3 put
    Event name: Upload
    ```
    * Replace the **example-bucket** and **test/key** with test file.
    * Save and Test
    * Click **Details** to expand it and show more infomations.
* Monitoring and Logging
    * Monitoring tab displays graphs showing:
        * **Invocations:** The number of times the function has been invoked.
        * **Duration:** How long the function took to execute (in milliseconds).
        * **Errors:** How many times the function failed.
        * **Throttles:** When too many functions are invoked simultaneously, they will be throttled. The default is 1000 concurrent executions.
        * **Iterator Age:** Measures the age of the last record processed from streaming triggers (Amazon Kinesis and Amazon DynamoDB Streams).
        * **Dead Letter Errors:** Failures when sending messages to the Dead Letter Queue.
        * Log messages from Lambda functions are retained in <strong>Amazon CloudWatch Logs</strong>
    * Logging:
        * Click the **log stream**
        * **Expand** > each message to view the log message details:
            The Event Data includes the Request Id, the duration (in milliseconds), the billed duration (rounded up to the nearest 100 ms, the Memory Size of the function and the Maximum Memory that the function used. In addition, any logging messages or print statements from the functions are displayed in the logs. This assists in debugging Lambda functions.

*Cost 60 minutes, finished on Oct 27th, 2018.*
____
#### [QwikLab: Intro to Amazon API Gateway](https://awseducate.qwiklabs.com/focuses/21?parent=catalog)
* Technical Concepts
    * Microservice Architecture: A microservice is a software development technique—a variant of the service-oriented architecture (SOA) architectural style that structures an application as a collection of loosely coupled services. The idea of a microservices architecture is to take a large, complex system and break it down into <strong>independent, decoupled services that are easy to manage and extend</strong>.
    * Application Programming Interface (API): API is a set of instructions that defines how developers interface with an application. The idea behind an API is to create a <strong>standardized approach</strong> to interfacing the various services provided by an application. An API is designed to be used with a <strong>Software Development Kit (SDKs)</strong>, which is a collection of tools that allows developers to easily create downstream applications based on the API.
    * API-First Strategy: each service within their stack is first and always released as an API.
    * RESTful API: Representational state transfer (REST) refers to architectures that follow six constraints:
        * Separation of concerns via a client-server model.
        * <strong>State</strong> is stored entirely on the client and the communication between the client and server is <strong>stateless</strong>.
        * The client will <strong>cache</strong> data to improve network efficiency.
        * There is a uniform interface (in the form of an <strong>API</strong>) between the server and client.
        * As complexity is added into the system, <strong>layers</strong> are introduced. There may be multiple layers of RESTful components.
        * Follows a <strong>code-on-demand</strong> pattern, where code can be downloaded on the fly (in our case implemented in Lambda) and changed without having to update clients.
* Amazon API Gateway features:
    * Transform the body and headers of incoming API requests to match backend systems
    * Transform the body and headers of the outgoing API responses to match API requirements
    * Control API access via Amazon Identity and Access Management
    * Create and apply API keys for third-party development
    * Enable Amazon CloudWatch integration for API monitoring
    * Cache API responses via Amazon CloudFront for faster response times
    * Deploy an API to multiple stages, allowing easy differentiation between development, test, production as well as versioning
    * Connect custom domains to an API
    * Define models to help standardize your API request and response transformations
* Amazon API Gateway and AWS Lambda Terminology
    * **Resource:** Represented as a URL endpoint and path. For example, api.mysite.com/questions. You can associate HTTP methods with resources and define different backend targets for each method. In a microservices architecture, a resource would represent a single microservice within your system.
    * **Method:** In API Gateway, a method is identified by the combination of a resource path and an HTTP verb, such as GET, POST, and DELETE.
    * **Method Request:** The method request settings in API gateway store the methods authorization settings and define the URL Query String parameters and HTTP Request Headers that are received from the client.
    * **Integration Request:** The integration request settings define the backend target used with the method. It is also where you can define mapping templates, to transform the incoming request to match what the backend target is expecting.
    * **Integration Response:** The integration response settings is where the mappings are defined between the response from the backend target and the method response in API Gateway. You can also transform the data that is returned from your backend target to fit what your end users and applications are expecting.
    * **Method Response:** The method response settings define the method response types, their headers and content types.
    * **Model:** In API Gateway, a model defines the format, also known as the schema or shape, of some data. You create and use models to make it easier to create mapping templates. Because API Gateway is designed to work primarily with JavaScript Object Notation (JSON)-formatted data, API Gateway uses JSON Schema to define the expected schema of the data.
    * **Stage:** In API Gateway, a stage defines the path through which an API deployment is accessible. This is commonly used to deviate between versions, as well as development vs production endpoints, etc.
    * **Blueprint:** A Lambda blueprint is an example lambda function that can be used as a base to build out new Lambda functions.

*Cost 30 minutes, finished on Oct 27th, 2018.*
____
#### [AWS Tutorial: Build a Serverless Web Application](https://aws.amazon.com/getting-started/projects/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/?trk=gs_card)
* Application Architecture
![Application Architecture](./img/architecture.png)
* Static Web Hosting
    * Architecture
    ![Architecture](./img/architecture1.png)
    * Create a S3 bucket as we do in previous tutorial.
    * Upload static web content like HTML, CSS, JavaScript and Media Types.
    * Configure **Bucket Policy** as following:
    ```
    {
        "Version": "2018-10-27",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:GetObject",
                "Resource": "arn:aws:s3:::[YOUR_BUCKET_NAME]/*"
            }
            ]
    }
    ```
    * Save and enable Web Hosting.
* User Management
    * Architecture
    ![Architecture](./img/architecture2.png)
    * Create an Amazon Cognito User Pool, get the Pool Id
    ![Create](./img/userpool.png)
    * Add an App to User Pool
        * Choose **Add an app client**.
        * **Uncheck** the Generate client secret option.
        * Choose **Create app** client.
        * Note **App client id**
        ![Add App](./img/addapp.png)
    * Update the config.js File in Website Bucket
    ```
    window._config = {
        cognito: {
            userPoolId: 'us-west-2_uXboG5pAb', // e.g. us-east-2_uXboG5pAb
            userPoolClientId: '25ddkmj4v6hfsfvruhpfi7n4hv', // e.g. 25ddkmj4v6hfsfvruhpfi7n4hv
            region: 'us-west-2' // e.g. us-east-2
            },
            api: {
                invokeUrl: '' // e.g. https://rc7nyt4tql.execute-api.us-west-2.amazonaws.com/prod',
            }
        };
    ```
    * Test
    ![Success](./img/success.png)
* Serverless Backend
    * Architecture
    ![Architecture](./img/architecture3.png)
    * Create an Amazon DynamoDB Table as we do in previous tutorial.
    ![Create Table](./img/createtable.png)
    * Create an IAM Role for Your Lambda function
        * Every Lambda function has an IAM role associated with it. This role defines what other AWS services the function is allowed to interact with.
        * Use the IAM console to create a new role. Name it WildRydesLambda and select AWS Lambda for the role type. You'll need to attach policies that grant your function permissions to write to Amazon CloudWatch Logs and put items to your DynamoDB table.
        * Attach the managed policy called AWSLambdaBasicExecutionRole to this role to grant the necessary CloudWatch Logs permissions. Also, create a custom inline policy for your role that allows the ddb:PutItem action for the table you created in the previous section.
        ![Create IAM](./img/createIAM.png)

    * Create a Lambda Function for Handling Requests as we do in previous tutorial.
    ![Create Lambda](./img/createLambda.png)
    * Test the Implementation
    ![Test Lambda](./img/testLambda.png)
* RESTful APIs
    * Architecture
    ![Architecture](./img/architecture4.png)
    * Create a New REST API
        * In the AWS Management Console, click **Services** then select **API Gateway** under **Application Services**.
        * Choose **Create API**.
        * Select **New API** and enter WildRydes for the **API Name**.
        * Keep **Edge optimized** selected in the **Endpoint Type dropdown**.
        ![Create API](./img/createAPI.png)
    * Create a Cognito User Pools Authorizer as we do previously
    ![Authorize](./img/authorize.png)
    * Create a new resource called /ride within your API. Then create a **POST** method for that resource and configure it to use a Lambda proxy integration backed by the RequestUnicorn function you created in the first step of this module.

    * Deploy API in stage prod
        * In the **Actions** drop-down list select **Deploy API**.
        * Select **[New Stage]** in the **Deployment stage** drop-down list.
        * Enter **prod** for the Stage Name.
        * Choose **Deploy**.
        ![Deploy API](./img/deploy.png)
    * Update the Website Config config.js as following:
    ```
    window._config = {
        cognito: {
            userPoolId: 'us-west-2_uXboG5pAb',
            userPoolClientId: '25ddkmj4v6hfsfvruhpfi7n4hv',
            region: 'us-west-2'
            },
        api: {
        invokeUrl: 'https://rc7nyt4tql.execute-api.us-west-2.amazonaws.com/prod'
        }
    };
    ```
    * Test the Implementation
    ![Test API](./img/testAPI.png)

*Cost 120 minutes, finished on Oct 27th, 2018.*
____
#### *Bring it together:*
#### [AWS Tutorial: Build a Modern Web Application](https://aws.amazon.com/getting-started/projects/build-modern-app-fargate-lambda-dynamodb-python/?trk=gs_card)
* Application Architecture
![Application Architecture](./img/arch.png)
* Modules:
    * Create Static Website: Build a static website, using **Amazon Simple Storage Service (S3)** that serves static content (images, static text, etc.)
    * Build Dynamic Website: Host the application logic on a web server, using an **API** backend microservice deployed as a container through **AWS Fargate**.
    * Store Mysfit Data: Externalize all of the mysfit data and persist it with a managed NoSQL database provided by **Amazon DynamoDB**.
    * Add User Registration: Enable users to registration, authentication, and authorization so that Mythical Mysfits visitors can like and adopt myfits, enabled through **AWS API Gateway** and its integration with **Amazon Cognito**.
    * Capture User Clicks: Capture user behavior with a clickstream analysis microservice that will record and analyze clicks on the website using **AWS Lambda** and **Amazon Kinesis Firehose**.
* Module 1: Create Static Website
    * AWS Cloud9: Cloud9 is a cloud-based integrated development environment (IDE) that lets you write, run, and debug your code with just a browser.  
    * Setup Cloud9
    ![Cloud9](./img/cloud9.png)
    * Create An S3 Bucket And Configure It For Website Hosting
    ```
    aws s3 mb s3://qibao
    aws s3 website s3://qibao --index-document index.html
    ```
    * Update The S3 Bucket Policy
    ```
    aws s3api put-bucket-policy --bucket qibao --policy file://~/environment/aws-modern-application-workshop/module-1/aws-cli/website-bucket-policy.json
    ```
    * Publish The Website Content To S3
    ```
    aws s3 cp ~/environment/aws-modern-application-workshop/module-1/web/index.html s3://qibao/index.html
    ```


*Cost 180 minutes, finished on Oct 27th, 2018.*
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
