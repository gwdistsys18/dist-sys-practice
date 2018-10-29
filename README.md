# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

# Table of contents
- [Docker Container](https://github.com/JackTedo/dist-sys-practice/#docker-container)  
	- [Beginner Level: Docker Container](https://github.com/JackTedo/dist-sys-practice/#beginner-level-docker-container)
		- [Why docker](https://github.com/JackTedo/dist-sys-practice/#video-why-docker)  
		- [DevOps Docker Beginners Guide](https://github.com/JackTedo/dist-sys-practice/#lab-devops-docker-beginners-guide)  

- [Cloud Web Apps](https://github.com/JackTedo/dist-sys-practice/#Cloud-Web-Apps)  
	- [Beginner Level: Cloud Web Apps](https://github.com/JackTedo/dist-sys-practice/#Beginner-Level-Cloud-Web-Apps)
		- [AWS Tutorial: Launch a VM](https://github.com/JackTedo/dist-sys-practice/#AWS-Tutorial-Launch-a-VM )  
		- [QwikLab: Intro to S3](https://github.com/JackTedo/dist-sys-practice/#QwikLab-Intro-to-S3)  
	- [Intermediate Level](https://github.com/JackTedo/dist-sys-practice#intermediate-level-Cloud-Web-Apps)  
		- [Video: Virtualization](https://github.com/JackTedo/dist-sys-practice#Video-Virtualization)  
		- [AWS Tutorial: Install a LAMP Web Server on Amazon Linux 2](https://github.com/JackTedo/dist-sys-practice#AWS-Tutorial-Install-a-LAMP-Web-Server-on-Amazon-Linux-2)  
		- [S3 versus an EC2 VM](https://github.com/JackTedo/dist-sys-practice#S3-versus-an-EC2-VM)  
		- [QwikLab: Intro to DynamoDB](https://github.com/JackTedo/dist-sys-practice#QwikLab-Intro-to-DynamoDB)  
		- [AWS Tutorial: Deploy a Scalable Node.js Web App](https://github.com/JackTedo/dist-sys-practice#AWS-Tutorial-Deploy-a-Scalable-Nodejs-Web-App)  
		- [QwikLab: Intro to AWS Lambda ](https://github.com/JackTedo/dist-sys-practice#QwikLab-Intro-to-AWS-Lambda)  
		- [QwikLab: Intro to Amazon API Gateway](https://github.com/JackTedo/dist-sys-practice#QwikLab-Intro-to-Amazon-API-Gateway)  
		- [AWS Tutorial: Build a Serverless Web Application](https://github.com/JackTedo/dist-sys-practice#AWS-Tutorial-Build-a-Serverless-Web-Application)  
		- [AWS Tutorial: Build a Modern Web Application](https://github.com/JackTedo/dist-sys-practice#AWS-Tutorial-Build-a-Modern-Web-Application)  
		



## Docker Container
### Beginner Level: Docker Container
#### [Video: Why Docker?](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)  
Time: 15 min   

1. Docker is a software platform that allows you to build, test, and deploy applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime. Using Docker, you can quickly deploy and scale applications into any environment and know your code will run. 
2. Amazon ECS uses Docker images in task definitions to launch containers on EC2 instances in your clusters.

#### [Lab: DevOps Docker Beginners Guide](https://training.play-with-docker.com/ops-s1-hello/)  
Time: 1 hr  

1. Running your first container  
	Firstly, log into a docker sandbox environment. Type: "docker container run hello-world" to run the fist container. Container is different to VM in that A container is an application abstraction;  
  
2. Docker Image
	The pull command fetches the alpine image from the Docker registry and saves it in our system.

3. Containers and images are different concept.  
	__Images__: The file system and configuration(read-only) of application which are used to create containers.   
	__Containers__: Containers are running instances of Docker images. Containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers and runs as an isolated process in user space on the host OS.  
  
4. Container Isolation  
	Even though two containers share the same image, these two instances are separated from each other. No matter what happens in an instance, it won't affect other instances. 
	This is a critical security concept in the world of Docker containers! Even though each docker container run command used the same alpine image, each execution was a separate, isolated container. Each container has a separate filesystem and runs in a different namespace; by default a container has no way of interacting with other containers, even those from the same image.
	
## Cloud Web Apps
### Beginner Level: Cloud Web Apps
#### [AWS Tutorial: Launch a VM](https://aws.amazon.com/getting-started/tutorials/launch-a-virtual-machine/)  
Time: 30 min   
1. Amazon Elastic Compute Cloud (EC2) is the Amazon Web Service you use to create and run virtual machines in the cloud. AWS calls these virtual machines 'instances'.
2. Steps
	   
	
	Step 1: Launch an Amazon EC2 Instance
	
	Login in and open the Amazon EC2 console, then click Launch Instance to create and configure your virtual machine.
	
	Step 2: Configure your Instance
	
	Important: After you download the MyKeyPair key, you will want to store your key in a secure location. If you lose your key, you won't be able to access your instance. If someone else gets access to your key, they will be able to access your instance. This key will be used in future.
	
	Step 3: Connect to your Instance
	
	Step 4: Terminate Your Instance
	
	You can easily terminate the instance from the EC2 console. In fact, it is a best practice to terminate instances you are no longer using so you don’t keep getting charged for them.
	
	Important: I once forgot to terminate the instance and found out later that my account instance usage added up many hours.
	
	
	Summary: This is the basic usage of EC2, not difficulty.

	
#### [QwikLab: Intro to S3](https://awseducate.qwiklabs.com/focuses/30?parent=catalog)  
Time: 1 hr 

 Amazon S3 is a cloud computing web service offered by Amazon Web Services. Amazon S3 provides object storage through web services interfaces. 
 
1. Create a Bucket  
	Every object in Amazon S3 is stored in a bucket  
  
2. Upload an Object to the Bucket
	An object can be any kind of file: a text file, a photo, a video, a zip file, etc. Add an object to Amazon S3 to let it available in network with permission

3. Make Your Object Public
  
	Configure permissions on your object so that it is publicly accessible. The object is private by default.
	
4. Create a Bucket Policy

	Bucket Policy is a set of permissions associated with an Amazon S3 bucket. It can be used to control access to a whole bucket or to specific directories within a bucket.

5. Explore Versioning

	Versioning is a means of keeping multiple variants of an object in the same bucket. You can use versioning to preserve, retrieve, and restore every version of every object stored in your Amazon S3 bucket. With versioning you can easily recover from both unintended user actions and application failures.



### Intermediate Level: Cloud Web Apps
#### [Video: Virtualization](https://www.youtube.com/watch?v=GIdVRB5yNsk)  
Time: 10 min   
	what are Virtual Machines and how do they run legacy software alongside cutting edge code.
	
#### [AWS Tutorial: Install a LAMP Web Server on Amazon Linux 2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html)  
Time: 60 min   


LAMP is an archetypal model of web service stacks, named as an acronym of the names of its original four open-source components: the GNU/Linux operating system, the Apache HTTP Server, the MySQL relational database management system, and the PHP programming language(from Wikipedia).

Part One: Prepare the LAMP Server

1. Connect to your instance.   
	It seems instance is one of the core components of AWS. An EC2 instance is a virtual server in Amazon's Elastic Compute Cloud (EC2) for running applications on the Amazon Web Services (AWS) infrastructure. Instance types comprise varying combinations of CPU, memory, storage, and networking capacity.  
  
2. perform a quick software update on your instance.
	It seems that we need to update the instance every time. Why no automatical update?
	
3. Install latest versions of the LAMP MariaDB and PHP packages for Amazon Linux 2. 

4. install the Apache web server, MariaDB, and PHP software packages. 

5. Start the Apache web server.

6.  Use the systemctl command to configure the Apache web server to start at each system boot.

7. Add a security rule.

8. Test your web server.

	I tried several times till the success of the test. The problem is the security rules. The security group you are using contains a rule to allow HTTP (port 80) traffic. 
	
Part Two: Test Your LAMP Server

1. Create a PHP file in the Apache document root.   
	
2. In a web browser, type the URL of the file that you just created. This URL is the public DNS address of your instance followed by a forward slash and the file name.
	Notes: It is "http://", not "https://".

3. Delete the phpinfo.php file.
	Notes: security reasons.

Part Three: Secure the Database Server

The default installation of the MariaDB server has several features that are great for testing and development, but they should be disabled or removed for production servers.

1. Start the MariaDB server.   
	
2. Run mysql_secure_installation.


#### S3 versus an EC2 VM

Time: 30 min   

- Amazon EC2

It's just kind of a regular computer hosted somewhere on one of AWS data-center. And, as part of that it has a hard-drive or local storage. And, it is not permanent in the sense that anything that you want to store long term you don't want to store on the hard-drive of EC2 instance because of scaling-up and scaling-down while adding easy to servers, vice-versa(maintaining Elasticity property). And, so you don't want to have things that you want to keep forever on to the local storage because as you add or remove instances then you can potentially lost that information or lose that data. EC2 is meant to deploy your application on server(using its processing power) and that server serve the contents through the S3 and RDS, respectively. Hence, Amazon EC2 good for any type of processing activity.

- Amazon S3

Amazon S3 stores data as objects in a flat environment (without a hierarchy). Each object (file) in the storage contains a header with an associated sequence of bytes from 0 bytes to 5 TB.  Amazon S3 is a storage platform of AWS. It's specially called large unlimited storage bucket(Limit is very high). So, S3 is perfect place for storing doc, movie, music, apps, pictures, anything you want to store, just dump onto S3. And, it's going to be multiple redundancies and back-up of files that you put there. So, again you are always going to have high availability of any files that you decide to store on S3. 
Uses of S3:
Mass storage container
Long-Term Storage

- Benefits of using Amazon S3 to store static assets such as pictures and videos:

    S3 is pay-as-you-go 
    
    S3 is highly available: You don't need to run any servers
    
    S3 is highly durable: Your data is duplicated across three data centres, so it is more resilient to failure
    
    S3 is highly scalable: It can handle massive volumes of requests. If you served content from Amazon EC2, you'd have to scale-out to meet requests
    
    S3 has in-built security at the object, bucket and user level.
    

- Amazon EC2 instance, and serve the content from the EC2 instance:

    You would need to pre-provision storage using Amazon EBS volumes (and you pay for the entire volume even if it isn't all used)
    
    You would need to Snapshot the EBS volumes to improve durability (EBS Snapshots are stored in Amazon S3, replicated between data centres)
    
    You would need to scale your EC2 instances (make them bigger, or add more) to handle the workload
    
    You would need to replicate data between instances if you are running multiple EC2 instances to meet request volumes
    
    You would need to install and configure the software on the EC2 instance(s) to manage security, content serving, monitoring, etc.
    

#### [QwikLab: Intro to DynamoDB](https://awseducate.qwiklabs.com/focuses/23?parent=catalog)  
Time: 20 min   


Amazon DynamoDB is a fully managed proprietary NoSQL database service that supports key-value and document data structures and is offered by Amazon.com as part of the Amazon Web Services portfolio. DynamoDB exposes a similar data model to and derives its name from Dynamo, but has a different underlying implementation(from Wikipedia).

1. Create a new table.   
	In AWS management console, select Service, then select DynamoDB. Create new table.  
  
2. Add Data

3. Modify an existing item

4. Query the table

5. Delete the table

	Amazon DynamoDB is very good to be used as a cloud db.
	

#### [AWS Tutorial: Deploy a Scalable Nodejs Web App](https://aws.amazon.com/getting-started/projects/deploy-nodejs-web-app/?trk=gs_card)  
Time: 60 min   

   This tutorial is about how to deploy a high-availability Node.js web app using AWS Elastic Beanstalk and Amazon DynamoDB. Using Elastic Beanstalk, you can simply upload your code and Elastic Beanstalk automatically handles the deployment, from capacity provisioning, load balancing, auto-scaling to application health monitoring. Elastic Beanstalk automatically scales your application up and down based on your application's specific need using easily adjustable Auto Scaling settings. Amazon DynamoDB is a fast and flexible NoSQL database service for all applications that need consistent, single-digit millisecond latency at any scale. It is a fully managed cloud database and supports both document and key-value store models.
   
1. Prerequisites.   

	This tuturial uses sample application source bundle from GitHub: eb-node-express-sample-v1.1.zip.  
  
2. Launch an Elastic Beanstalk Environment

	Elastic Beanstalk creates and manages severals resources.
   
3. Add Permissions to Your Environment's Instances

	The application runs on one or more EC2 instances behind a load balancer, serving HTTP requests from the Internet. When it receives a request that requires it to use AWS services, the application uses the permissions of the instance it runs on to access those services. 
   
4. Deploy the Sample Application

5. Create a DynamoDB Table

	Notes: When you create a table outside of Elastic Beanstalk, it is completely independent of Elastic Beanstalk and your Elastic Beanstalk environments, and will not be terminated by Elastic Beanstalk. 

6. Update the Application's Configuration Files

	Update the configuration files in the application source to use the nodejs-tutorial table instead of creating a new one. 

7. Configure Your Environment for High Availability

    Configure the environment's Auto Scaling group with a higher minimum instance count. Run at least two instances at all times to prevent the web servers in your environment from being a single point of failure, and to allow you to deploy changes without taking your site out of service. 
    
    
8. Cleanup

	Elastic Beanstalk terminates all AWS resources associated with your environment, such as Amazon EC2 instances, database instances, load balancers, security groups, and alarms. 



#### [QwikLab: Intro to AWS Lambda](https://awseducate.qwiklabs.com/focuses/36?parent=catalog)  
Time: 30 min   

   This lab demonstrates AWS Lambda by creating a serverless image thumbnail application.
   
1. Create the Amazon S3 Buckets.   

	This create two Amazon S3 buckets -- one for input and one for output.  
   
2. Create an AWS Lambda Function.   

	This create an AWS Lambda function that reads an image from Amazon S3, resizes the image and then stores the new image in Amazon S3.
   
3. Test Your Function.   

	This is done by simulating an event with the same information normally sent from Amazon S3 when a new object is uploaded.  
   
4. Monitoring and Logging.   

	Monitor AWS Lambda functions to identify problems and view log files to assist in debugging.  
   

#### [QwikLab: Intro to Amazon API Gateway](https://awseducate.qwiklabs.com/focuses/21?parent=catalog)  
Time: 35 min   

   This lab create a simple FAQ micro-service. The micro-service will return a JSON object containing a random question and answer pair using an Amazon API Gateway endpoint that invokes an AWS Lambda function. 
   
   The idea of a microservices architecture is to take a large, complex system and break it down into independent, decoupled services that are easy to manage and extend. This enables developers to meet their key design goals like extensibility, extendibility, availability and maintainability.
   
   Representational state transfer (REST) refers to architectures that follow six constraints: Client–server architecture, Statelessness, Cacheability, Layered system, Code on demand (optional), Uniform interface.
   
1. Create a Lambda Function.   

	This create two Amazon S3 buckets -- one for input and one for output.  
   
2. Test the Lambda function.


#### [AWS Tutorial: Build a Serverless Web Application](https://aws.amazon.com/getting-started/projects/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/?trk=gs_card)  
Time: 120 min   

   This serverless web application takes me about 4 hours to finish. I almost do it twice to complete it.
   
   This lab create a simple serverless web application that enables users to request unicorn rides from the Wild Rydes fleet. 
   
   The application will present users with an HTML based user interface for indicating the location where they would like to be picked up and will interface on the backend with a RESTful web service to submit the request and dispatch a nearby unicorn. 
   
   The application will also provide facilities for users to register with the service and log in before requesting rides.
   
   The application architecture uses AWS Lambda, Amazon API Gateway, Amazon S3, Amazon DynamoDB, and Amazon Cognito.
   
   
 - Module 1. Static Web Hosting

	Architecture Overview:  

	The static web content including HTML, CSS, JavaScript, images and other files will be stored in Amazon S3. Your end users will then access your site using the public website URL exposed by Amazon S3.  
	
   
	Implementation Instructions:

	The static web content including HTML, CSS, JavaScript, images and other files will be stored in Amazon S3. Your end users will then access your site using the public website URL exposed by Amazon S3.  
	
   
   Steps:
   
1. Select a Region

	I always use the default region. 
	
2. Create an S3 Bucket

	Amazon S3 can be used to host static websites without having to configure or manage any web servers. A new S3 bucket that will be used to host all of the static assets (e.g. HTML, CSS, JavaScript, and image files) for the web application.
	





#### [AWS Tutorial: Build a Modern Web Application](https://aws.amazon.com/getting-started/projects/build-modern-app-fargate-lambda-dynamodb-python/?trk=gs_card)  
Time: 150 min   

   This lab create a simple FAQ micro-service. The micro-service will return a JSON object containing a random question and answer pair using an Amazon API Gateway endpoint that invokes an AWS Lambda function. 

1. Create a Lambda Function.   

	This create two Amazon S3 buckets -- one for input and one for output.  
   
2. Test the Lambda function.






