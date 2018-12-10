# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Docker and Countainers
### Beginner Level
* [Video: Why Docker?](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23) (15 min)  

History:  
Mainframe to PC: 90's  
Baremetal to Virtual: 00's  
Datacenter to Cloud: 10's  
Host to Countainer: now   
  
Countainers: "Fastest Growing Cloud Enabling Technology"  
Why we need docker: Docker is all about speed. Faster.  
Comtainers reduce the complexity.  
Docker is freeing up a lot of rasks of the maintenance of stuff and allowing us to get more of our time back to innovate.  
  
* [Lab: DevOps Docker Beginners Guide](https://training.play-with-docker.com/ops-s1-hello/) (1 hr)  

In this lab we run a lightweight container and explore the basics of how containers work, how the Docker Engine executes and isolates containers from each other.  
  
Hello World:  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/hw.png)  
  
The pull command fetches the alpine image from the Docker registry and saves it in our system.  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/pull.png)  
  
Run a Docker container based on the image.  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/run.png)  
  
Container Isolation:  
Even though each docker container run command used the same alpine image, each execution was a separate, isolated container. Each container has a separate filesystem and runs in a different namespace; by default a container has no way of interacting with other containers, even those from the same image.  
  
Terminology:  
Images - The file system and configuration of our application which are used to create containers.  
Containers - Running instances of Docker images — containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers, and runs as an isolated process in user space on the host OS.  
Docker daemon - The background service running on the host that manages building, running and distributing Docker containers.  
Docker client - The command line tool that allows the user to interact with the Docker daemon.  
Docker Store - Store is, among other things, a registry of Docker images.  
  
### Intermediate Level
#### Countainers  
* [Video: What are Containers?](https://www.youtube.com/watch?v=EnJ7qX9fkcU) (25 min)  

![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/container.png)  
  
One process per container.  
The container process is completely tied in with the lifecycle of the container itself. When you start the container, it starts the container process. when the container process exits, the container ends.  
Container image is very simply a binary representation, a bunch of bits on a filesystem somewhere.  
The images are arranged in a image hierarchy.  
A dockerfile is basically an environment in a text file.  
The start of a docker file is "From". "From" is the parent image where this docker file is inheriting from. 
We could create image from a container.  
A container is packaged with all of its dependencies.
Registry is a thing that contains images. You can pull and push from the registry at will.  
Volume is a persistent area of storage. Container will have or may have a volume if it wants to persist any data beyond the lifecycle of the container.  
  
* [Video: VMs Versus Containers](https://www.youtube.com/watch?v=L1ie8negCjc) (10 min)  

![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/vm.png)  
Keep OS simple. Less overhead.  
You can size it however you want.  
Hypervisor: It has to be responsible for interacting with all different types of NICs from all different types of hardware.  
A large benefit of containers is the ability to package up a lot of dependencies the App needs from the OS in one container.  
  
* [Lab: Docker Intro](https://training.play-with-docker.com/beginner-linux/) (40 min)  

In this lab, we look at some basic Docker commands and a simple build-ship-run workflow.  
  
Run a single task in an Alpine Linux container. The container will start, execute the hostname command, then exit. Containers which do one task and then exit can be very useful. You could build a Docker image that executes a script to configure something. Anyone can execute that task just by running the container - they don’t need the actual scripts or configuration information.  
  
Run an interactive Ubuntu container. Linux containers require the Docker host to be running a Linux kernel. Interactive containers are useful when you are putting together your own image. You can run a container and verify all the steps you need to deploy your app, and capture them in a Dockerfile.  
  
Run a background MySQL container. Background containers are how you’ll run most applications.  
  
Create a simple NGINX website from a Dockerfile.  
  
Modify a running website. Mount the source code directory on the local machine into the running container. This will allow any changes made to the files on the host to be immediately reflected in the container. It is called a bind mount.  
  
Update the image. To persist the changes you made to the index.html file into the image, you need to build a new version of the image.  
  
Test the new version.  
  
Push your images to Docker Hub. Docker Hub supports public and private repositories.  

* [Lab: Doing more with Docker Images](https://training.play-with-docker.com/ops-s1-images/) (50 min)  

Image creation from a container. this approach of manually installing software in a container and then committing it to a custom image is just one way to create an image. It works fine and is quite common.  

![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/icc.png)  

Image creation using a Dockerfile. This is useful because it becomes much easier to manage changes, especially as your images get bigger and more complex.  

![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/icd.png)  

Image layers. Using cache.  

![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/l&c.png)  

Image Inspection. Docker has an inspect command for images and it returns details on the container image, the commands it runs, the OS and more.  

Terminology:  
Layers - A Docker image is built up from a series of layers.  
Dockerfile - A text file that contains all the commands, in order, needed to build a given image.  
Volumes - A special Docker container layer that allows data to persist and be shared separately from the container itself.  

* [Video: VMs Versus Containers Deep Dive](https://www.youtube.com/watch?v=PoiXuVnSxfE) (10 min)  

Size  
VM: Depending on the size of user space and application can range from hundreds of megabytes to tens of gigabytes.  
Container: Depending on the type of application we have inside it, the size can range from tens of megabytes up to gigtabytes.  

Isolation  
VM: Have boundaries that are created outside the x86 platform. Extremely difficult for attackers.  
Container: By no means insecure. As secure as the kernel they are running on.  

Boot time  
VM: Several startup times can be divided in 2 sections. One is the system check section, usually takes around 3-4 seconds. The startup of process itself takes about 500ms.  
Container: Run the process, like in the VM, takes about 500ms. Setup the sandbox, takes no time.  

#### Networking and Orchestration  
* [Lab: Docker Networking](https://training.play-with-docker.com/docker-networking-hol/) (1 hr)  

In this lab we learn about key Docker Networking concepts.  

Networking Basics  
The docker network command is the main command for configuring and managing container networks.  
Run a docker network ls command to view existing container networks on the current Docker host.  
The docker network inspect command is used to view network configuration details.  
The docker info command shows a lot of interesting information about a Docker installation.  

Bridge Networking  
Every clean installation of Docker comes with a pre-built network called bridge.  
The bridge network is the default network for new containers. This means that unless you specify a different network, all new containers will be connected to the bridge network.  
The Docker host can ping the container over the bridge network.  
The new container can ping the internet and therefore has a valid and working network configuration.  
Traffic that hits the Docker host on port 8080 will be passed on to port 80 inside the container. If start a new container from the official NGINX image without specifying a command to run, the container will run a basic web server on port 80.  

Overlay Networking  
Initialize a new Swarm, join a single worker node, and verify the operations worked.  
Create a new overlay network. 
Create a service that uses the network.  
Test the network.  
Test service discovery.  

Cleaning Up  
Execute the docker service rm myservice command to remove the service called myservice.  
Use the docker kill <CONTAINER ID ...> command to kill the ubunut and nginx containers.  
Use the docker swarm leave --force command to remove node1 and node2 from the Swarm.  

* [Lab: Swarm Mode Introduction](https://training.play-with-docker.com/ops-s1-swarm-intro/) (45 min)  

Initialize Your Swarm  

Show Swarm Members  
How multiple managers and workers interact  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/swarm.png)  

Clone the Voting App  

Deploy a Stack  
A stack is a group of services that are deployed together: multiple containerized components of an application that run in separate instances.  
Logical interpretation of how stacks, services and tasks are inter-related  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/stack.png)  

Scaling An Application  
New architecture after scaling  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/scaling.png)  

* [Video: Kubernetes vs Swarm](https://www.youtube.com/watch?v=L8xuFG49Fac) (5 min)  

Swarm is an example of orchestration system.  
Kubernetes is a popular orchestration system for docker, orignally came from Google.  
Docker contains its built-in orchestration system called Docker Swarm.  
Kubernetes has far more features it's more widely used.  

* [Video: Kubernetes in 5 Minutes](https://www.youtube.com/watch?v=PH-2FfFD2PU) (5 min)  

Architectural component  
Kubernetes cluster services. "Desired state management": Feed the cluster services a specific configuration.  
Worker: A container host.  

Use case  
.yaml file  
Deployment file: A pod configuration. Can have running containers in a pod.  
Replica: Specify how many of pods need to be running.  

The cluster services are responsible to make sure that configuration is running across of container or workers.  

#### Bring it all together  
* [AWS Tutorial: Break a Monolith Application into Microservices](https://aws.amazon.com/cn/getting-started/projects/break-monolith-app-microservices-ecs-docker-ec2/?trk=gs_card) (2 hr)  

Deploy a monolithic node.js application to a Docker container, then decouple the application into microservices without any downtime. The node.js application hosts a simple message board with threads and messages between users.  

## Cloud Web Applications
### Beginner Level
* [AWS Tutorial: Launch a VM](https://aws.amazon.com/getting-started/tutorials/launch-a-virtual-machine/) (15 min)  

Launch an Amazon EC2 Instance.  
Configure Instance. A key pair is used to securely access Linux instance using SSH. AWS stores the public part of the key pair which is just like a house lock.  
Use SSH to connect to instance.  
Terminate the instance from the EC2 console.  

* [QwikLab: Intro to S3](https://awseducate.qwiklabs.com/focuses/30?parent=catalog) (30 min)  

Create an Amazon S3 bucket.  
Upload an object to the bucket.  
Make object public.  
Create a bucket policy. A bucket policy is a set of permission associated with Amazon S3 bucket. It can be used to control access to a whole bucket or to specific directories within a bucket.  
Explore versioning. Versioning is a means of keeping multiple variants of an object in the same bucket. Can be used to preserve, retrieve, and restore every version of every object stored in Amazon S3 bucket.  

### Intermediate Level
#### Virtual Machines, Websites, and Databases
* [Video: Virtualization](https://www.youtube.com/watch?v=GIdVRB5yNsk) (10 min)  

The idea of running a virtual machine, a viritual computer on top of the physical computer, you can actually run multiple virtual machines at the same time.  
VMWARE: 2 different levels of privilege to run software on computers: OS(Operating system) and APP(Applications)  
Ring 0 for OS, Ring 3 for APP, Ring 1 and 2 are not commonly used.  
Xen: Hypervisor(Ring 0)  
Ability to run legacy operating system like Windows NT4  

* [AWS Tutorial: Install a LAMP Web Server on Amazon Linux 2](https://docs.aws.amazon.com/zh_cn/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html) (40 min)  

Step 1: Prepare the LAMP Server  
Prerequisites  
Have already launched a new instance using Amazon Linux 2, with a public DNS name that is reachable from the internet. Must also have configured security group to allow SSH (port 22), HTTP (port 80), and HTTPS (port 443) connections.  

To prepare the LAMP server,
1. Connect to the instance. 
2. Esure that all of software packages are up to date, perform a quick software update on the instance. 
3. Install the lamp-mariadb10.2-php7.2 and php7.2 Amazon Linux Extras repositories to get the latest versions of the LAMP MariaDB and PHP packages for Amazon Linux 2. 
4. Use the yum install command to install multiple software packages and all related dependencies at the same time. 
5. Start the Apache web server. 
6. Use the systemctl command to configure the Apache web server to start at each system boot. 
7. Add a security rule to allow inbound HTTP (port 80) connections to the instance if it has not been done. By default, a launch-wizard-N security group was set up for the instance during initialization. This group contains a single rule to allow SSH connections. 
8. Test the web server. 

To set file permissions,
1. Add user to the apache group.
2. Log out and then log back in again to pick up the new group, and then verify your membership.
3. Change the group ownership of /var/www and its contents to the apache group. 
4. To add group write permissions and to set the group ID on future subdirectories, change the directory permissions of /var/www and its subdirectories.
5. To add group write permissions, recursively change the file permissions of /var/www and its subdirectories.  

To secure web server (Optional),  
Install support for HTTPS (HTTP Secure), which protects your data with SSL/TLS encryption.  

Step 2: Test LAMP Server  
To test the LAMP server,
1. Create a PHP file in the Apache document root.
2. In a web browser, type the URL of the file just created. This URL is the public DNS address of instance followed by a forward slash and the file name.
3. Delete the phpinfo.php file.  

Step 3: Secure the Database Server  
To secure the MariaDB server,
1. Start the MariaDB server.
2. Run mysql_secure_installation.  

* Compare the performance, functionality, and price when serving web content from S3 versus an EC2 VM (30 min)  

Amazon EC2:  
Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides secure, resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers. Amazon EC2’s simple web service interface allows you to obtain and configure capacity with minimal friction. It provides you with complete control of your computing resources and lets you run on Amazon’s proven computing environment. Amazon EC2 reduces the time required to obtain and boot new server instances to minutes, allowing you to quickly scale capacity, both up and down, as your computing requirements change. Amazon EC2 changes the economics of computing by allowing you to pay only for capacity that you actually use. Amazon EC2 provides developers the tools to build failure resilient applications and isolate them from common failure scenarios.  

Benefits  
Elastic Web-scale Computing  
Completely Controlled  
Flexible Cloud Hosting Services  
Integrated  
Reliable  
Secure  
Inexpensive  
Easy to Start  

Price  
General Purpose - Current Generation  
c3.2xlarge	$0.420 per Hour  
c3.4xlarge	$0.840 per Hour  
c3.8xlarge	$1.680 per Hour  

Amazon S3:  
Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance. This means customers of all sizes and industries can use it to store and protect any amount of data for a range of use cases, such as websites, mobile applications, backup and restore, archive, enterprise applications, IoT devices, and big data analytics. Amazon S3 provides easy-to-use management features so you can organize your data and configure finely-tuned access controls to meet your specific business, organizational, and compliance requirements. Amazon S3 is designed for 99.999999999% (11 9's) of durability, and stores data for millions of applications for companies all around the world.  

Benefits  
Industry-leading performance, scalability, availability, and durability  
Wide range of cost-effective storage classes  
Unmatched security, compliance, and audit capabilities  
Management tools for granular data control  
Query-in-place services for analytics  
Most supported cloud storage service  

Price  
S3 Standard  
First 50 TB/ month	$0.023 / GB  
Next 450 TB/ month	$0.022 / GB  
Over 500 TB/ month	$0.021 / GB  

* [QwikLab: Intro to DynamoDB](https://awseducate.qwiklabs.com/focuses/23?parent=catalog) (20 min)  

Amazon DynamoDB is a fast and flexible NoSQL database service for all applications that need consistent, single-digit millisecond latency at any scale. It is a fully managed database and supports both document and key-value data models.  
In this lab,  
Create a new table.  
Add Data.  
Modify an existing item.  
Query the table.  
Delete the table.  

* [AWS Tutorial: Deploy a Scalable Node.js Web App](https://aws.amazon.com/cn/getting-started/projects/deploy-nodejs-web-app/?trk=gs_card) (40 min)  

Deploy a high-availability Node.js web app using AWS Elastic Beanstalk and Amazon DynamoDB.  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/webapp.png)  
Launch a Node.js web application environment using AWS Elastic Beanstalk and Amazon DynamoDB.  
Deploy a web application using AWS Elastic Beanstalk.  
Receive email notifications with Amazon Simple Notification Service (SNS).  

#### Serverless and Edge Computing
* [QwikLab: Intro to AWS Lambda](https://awseducate.qwiklabs.com/focuses/36?parent=catalog) (25 min)  

AWS Lambda is a compute service that runs code in response to events and automatically manages the compute resources, making it easy to build applications that respond quickly to new information. The lab provides a basic explanation of AWS Lambda.  

Create the Amazon S3 Buckets.  
Create an AWS Lambda Function.  
Test Function.  
Monitoring and Logging.  

* [QwikLab: Intro to Amazon API Gateway](https://awseducate.qwiklabs.com/focuses/21?parent=catalog) (20 min)  

Create a simple FAQ micro-service.  
The micro-service will return a JSON object containing a random question and answer pair using an Amazon API Gateway endpoint that invokes an AWS Lambda function.  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/microservice.png)  
Create a Lambda Function.  
Test the Lambda function.  

* [AWS Tutorial: Build a Serverless Web Application](https://aws.amazon.com/getting-started/projects/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/?trk=gs_card) (100 min)  

Create a simple serverless web application that enables users to request unicorn rides from the Wild Rydes fleet.  
The application architecture uses AWS Lambda, Amazon API Gateway, Amazon S3, Amazon DynamoDB, and Amazon Cognito.  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/architecture.png)  

Static Web Hosting  
Amazon S3 hosts static web resources including HTML, CSS, JavaScript, and image files which are loaded in the user's browser.  
Select a Region.  
Create an S3 Bucket.  
Upload Content.  
Add a Bucket Policy to Allow Public Reads.  
Enable Website Hosting.  
Validate the Implementation.  

User Management  
Amazon Cognito provides user management and authentication functions to secure the backend API.  
Create an Amazon Cognito User Pool.  
Add an App to User Pool.  
Update the config.js File in Website Bucket.  
Test the Implementation.  

Serverless Backend  
Amazon DynamoDB provides a persistence layer where data can be stored by the API's Lambda function.  
Create an Amazon DynamoDB Table.  
Create an IAM Role for Your Lambda function.  
Create a Lambda Function for Handling Requests.  
Test the Implementation.  

RESTful API  
JavaScript executed in the browser sends and receives data from a public backend API built using Lambda and API Gateway.  
Create a New REST API.  
Create a Cognito User Pools Authorizer.  
Create a new resource and method.  
Deploy the API.  
Update the Website Config.  
Validate the implementation.  

Resource Cleanup  
Delete Amazon S3 bucket  
Delete Amazon Cognito user pool  
Delete serverless backend  
Delete REST API  
Delete CloudWatch Log  

#### Bring it together
* [AWS Tutorial: Build a Modern Web Application](https://aws.amazon.com/getting-started/projects/build-modern-app-fargate-lambda-dynamodb-python/?trk=gs_card) (150 min)  

Build a modern application on AWS. Modern applications isolate business logic, optimize reuse and iteration, and remove overhead everywhere possible.  
The application architecture diagrams provide a structural representation of the services that make up Mythical Mysfits and how these services interact with each other.  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/modernapp.png)  

Create Static Website  
Build a static website, using Amazon Simple Storage Service (S3) that serves static content (images, static text, etc.) for the website.  
Create A New AWS Cloud9 Environment.  
Create An S3 Bucket And Configure It For Website Hosting.  

Build Dynamic Website  
Host the application logic on a web server, using an API backend microservice deployed as a container through AWS Fargate.  
Setup Core Infrastructure.  
Deploy A Service With AWS Fargate.  
Automate Deployments using AWS Code Services.  

Store Mysfit Data  
Externalize all of the mysfit data and persist it with a managed NoSQL database provided by Amazon DynamoDB.  
Create A DynamoDB Table.  
Add Items To The DynamoDB Table.  
Copy The Updated Flask Service Code.  
Update The Website Content in S3.  

Add User Registration  
Enable users to registration, authentication, and authorization so that Mythical Mysfits visitors can like and adopt myfits, enabled through AWS API Gateway and its integration with Amazon Cognito.  
Create The Cognito User Pool.  
Create A Cognito User Pool Client.  
Create An API Gateway VPC Link.  
Create The REST API Using Swagger.  
Deploy The API.  
Update the Flask Service Backend.  
Update The Mythical Mysfits Website In S3.  

Capture User Clicks  
Capture user behavior with a clickstream analysis microservice that will record and analyze clicks on the website using AWS Lambda and Amazon Kinesis Firehose.  
Create A New CodeCommit Repository.  
Copy The Streaming Service Code Base.  
Use Pip To Intall Lambda Function Dependencies.  
Update The Lambda Function Code.  
Push Your Code Into CodeCommit.  
Create An S3 Bucket For Lambda Function Code Packages.  
Use The SAM CLI To Package Your Code For Lambda.  
Deploy The Stack Using AWS CloudFormation.  
Update The Website Content.  
Push The New Site Version to S3.  

Workshop Clean-Up  

## Big Data and Machine Learning
### Beginner Level
* [Video: Hadoop Intro](https://www.youtube.com/watch?v=jKCj4BxGTi8&feature=youtu.be) (20 min)  

Hadoop is a framework that allows for the distributed processing of large data sets across clusters of commodity computers using simple programming models. It is inspired by a technical document published by Google.  

The 4 key characteristics of Hadoop  
Economical: Ordinary computers can be used for data processing.  
Reliable: Stores copies of data on different machines and is resistant to hardware failure.  
Scalable: Can follow both horizontal and vertical scaling.  
Flexible: Can store as much of the data and decide to use it later.  

In Hadoop, the program goes to the data not vice-versa. It initially distributes the data to multiple systems and later runs the computation wherever the data is located.  

The components of the Hadoop ecosystem  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/hadoop.png)  

4 stages of Big Data Processing  
Ingest  
Processing  
Analyze  
Access  

* [AWS Tutorial: Analyze Big Data with Hadoop](https://aws.amazon.com/getting-started/projects/analyze-big-data/?trk=gs_card) (60 min)  

Deploy a fully functional Hadoop cluster, ready to analyze log data in just a few minutes.  
Amazon EMR is a managed cluster platform that simplifies running big data frameworks, such as Apache Hadoop and Apache Spark, on AWS to process and analyze vast amounts of data.  

Create an Amazon S3 Bucket.  
Launch the Sample Amazon EMR Cluster.  
Allow SSH Connections to the Cluster From Client.  
Process Data By Running The Hive Script as a Step.  
Terminate the Cluster and Delete the Bucket.  

Use Amazon EMR Notebooks to create and open Jupyter notebooks with the Amazon EMR console.  
An EMR notebook is a "serverless" Jupyter notebook.  
Can use an EMR notebook with Amazon EMR clusters running Apache Spark to remotely run queries and code.  

Before launch a cluster, make choices about system based on the data that are being processed and the requirements for cost, speed, capacity, availability, security, and manageability.  

Amazon EMR provides several features to help secure cluster resources and data.  
AWS Identity and Access Management (IAM) policies  
IAM roles for EMRFS requests to Amazon S3  
IAM roles  
Kerberos  
Secure Socket Shell (SSH)  
Data encryption  
Security groups  
Security configurations  

Monitor and manage the cluster after launch it.
Amazon EMR provides several tools which can be used to connect to and control the cluster.  

An issue in any of these parts can cause the cluster to fail or take longer than expected to complete. There are several tools can be used to gather information about the cluster to help determine what went wrong.  

Write Applications that Launch and Manage Clusters.  
Can access the functionality provided by the Amazon EMR API by calling wrapper functions in one of the AWS SDKs.  

## Technical Report
* [Technical Report](https://github.com/thcyang/dist-sys-practice/blob/master/Technical%20Report.md)
