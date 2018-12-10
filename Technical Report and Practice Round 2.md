# Technical Report
## Extracting Windows 7 System Account Password with Virtual Machine and AWS EC2

I took Distributed Systems this semester and I learned a lot about virtual machines and Amazon Web Services. I also learned how to use Amazon EC2 in the practice including how to launch a virtual machine and how to connect to it. In this report I am going to introduce what I learned about virtualization and Amazon EC2 and how I used them to help with one of my assignments in Computer Network Defense class.

### Virtualization
Traditionally we utilize computing and storage resource base on hardware. But with virtualization technology we can split a physical machine and each part can have its own operating system. It helps us to make full use of hardware resource and makes management easier. 

We put hypervisors between physical machine and virtual machines to divide physical resource. When we are using virtualization on servers we install hypervisors directly on the hardware but when we are using virtualization software such as Virtual Box or VMware on a PC, the hypervisors are on top of the original operating system. 

There are generally four types of virtualization. 
1. Application Virtualization
	 
	 Application Virtualization can help separating a software from the computer. Users can run the software the same way as it is on top of the computer. For example, when we are writing program with Java Virtual Machine, we can have keyboard and mouse operations even we are running the program inside of the virtual machine. 
	 
2. Hosted Virtualization

   With hosted virtualization, the hypervisor runs on top of the operating system. The hypervisor does not have direct access to hardware resource. For security some sensitive instructions can not be accessed by the virtual machine. The operating system of the computer would process them and send the result back to the virtual machine. 

3. Paravirtualization

   With Paravirtualization the operating system is modified and each guest operating system is aware that it is being virtualized.

4. Full Virtualization
 
   Full Virtualization is also called hardware virtualization. As we know servers are using hardware virtualization. The hypervisor is directly installed on hardware and virtual machines can be accessed remotely. 

### Cloud Computing

- Infrastructure as a Service

	To use IaaS, users rent raw servers and connect to it remotely. They can either launch virtual machines, set up operating systems, install applications or store data as they want. 
	
- Platform as a Service

  PaaS provides a programming platform where users can write their own programs to run them on the cloud. It can scale resource better but it requires users to write code with the API provided by the service.

- Software as a Service

  SaaS has the most limited flexibility and the best scalability. It is simply a software that you can access through the internet instead of being installed on your local machine. Such as email service or online work station. Users do not have to worry anything about scalability or management. 
	
### Extract Windows 7 Password

A few weeks ago I had an assignment from my Computer Network Defense class. Creating five accounts in a windows 7 or windows 10 system with passwords of varying strengths. The users should have increasingly more difficult passwords. The passwords should be protected by LMHashes. Then extract the passwords and crack them. 

To finish this assignment, I needed to enable LMHashes, create the accounts and set up passwords, extract the passwords hash file and crack the passwords. 

I do not own a computer with windows system so I used a virtual machine from Oracle Virual Box. I downloaded the iso of IE8-Windows 7 virtual machine from Microsoft official website and then loaded it in Virtual Box. Then I enabled LMHashes with Windows Registry Editor. 

- type “run” in search and then type “regedit” in the window to get in registry editor
- go to HKEY_LOCAL_MACHINE -> SYSTEM -> CurrentControlSet -> Control -> Lsa and set the value of NoLmHash 0

Once LMHashes is enabled, the accounts and passwords are encrypted. The length of password can not be over 15 characters. 

Create 5 accounts and passwords:

username | user1 | user2 | user3 | user4 | user5
------------ | ------------- | ------------- | ------------- | ------------- | ------------- |
password | abc | computer123 | XuMolovesC++ | xumo123!@# | 321XuMo!@#

The encrypted users passwords are stored in a file named SAM under c:\Windows\system32\config directory. The file can not be opened or moved directly. So I needed to access it in another way. I used another virtual machine to boot this windows system and accessed the file through the interface of the other virtual machine. 

Before the next step I need to introduce the IDE Controller of Virtual Box. Usually the hard dist is built into the virtual machine and when a user accesses it, it presents as "real" storage of the machine. The idea of accessing the SAM file without going through the windows operating system is to attach the windows virtual machine to the kali linux as a hard drive. 

I downloaded Download kali-linux iso and I went to storage in settings of Windows 7 virtual machine.  settings -> General -> Basic, change the Version to Other Windows (64 bit). And then I went to Settings -> Storage where I can set up the attibutes of IDE Controller. Set kali-linux as the IDE Primary Master and set the windows 7 as IDE Primary Slave. 

I opened the windows 7 virtual machine and it appeared as the interface of kali-linux. Now the hard disk of the Windows 7 virtual machine is a part of the hard disk of kali linux. I located the SAM file in media/root/Windows 7/Windows/systems32/cinfig. 

I used the terminal of kali linux to run pwdump on the SAM file and put the output in a txt tile named WinHash.txt. 

```pwdump SYSTEM SAM > /root/Desktop/WinHash.txt```

Then I tranfered the WinHash.txt to local computer through email. 

### Amazon EC2

I planned on using John the Ripper to crack the password. Since some passwords were complex and it might have to run for a long time. So I wanted to use cloud service to run it remotely so that I didn't have to keep my own computer running for a long time. I chose to use Amazon EC2 to launch a virtual machine to run the password cracking software. 

Amazon EC2 is a kind of Infrastructure as a Service. It provides different sizes of RAM and computing resource. 
Users can launch a virtual machine with EC2. It provides some ready-to-go operating systems and distributions such as Red Hat, Amazon Linux, Ubuntu, Microsoft Windows Server, etc. It provides a collection of configuration so that users can use it as they desire. 

I used an ubuntu instance on AWS. Configuration was t2.micro, 1 virtual CPU and memory of 1GiB. I created a keypair and named it XuMoKeyPair.pem. 

Process:

First I uploaded the WinHash.txt to the ubuntu virtual machine. 

```scp -I XuMoKeyPair.pem WinHash.txt ubuntu@ec2-54-1-72-1-37.compute_1.amazonaws.com:WinHash.txt```

Then I connected to the virtual machine.

```ssh -I “XuMoKeyPair.pem” ubuntu@ec2-54-172-1-37.compute-1.amazonaws.com```

I installed john the ripper with apt-get.

```sudo apt-get install john```

After john the ripper was installed properly I started cracking the password. 

```john WinHash.txt```

Checked the result once it was finished.

```john WinHash.txt --show```









# Practice

# Dockers and Containers (beginner)

## Why docker? (20min)
Docker is fast
-	Implementing and maintaining a software is faster on Docker
Docker can be adopted quickly
-	Every system, software and function runs the same way on Docker as on its original environment therefore no code changing is needed while transferring them to Docker
Docker has saved software developers and maintainers a lot of time because it is fast and it saves a lot of work during the life cycle of software developing.

## Lab: DevOps Docker Beginners Guide (60min)

What happens when you run Hello World:

When you run the command “docker container run hello-world”, the engine would start trying to find the image with the name hello-world locally. Since the engine couldn’t find it, it would go to the default Docker Registry to keep looking for it. The engine would find the image and run it in a container.

Comparing a virtual machine and a container:

Virtual Machine | Container
------------ | -------------
Hardware Abstraction| Application Abstraction
A virtual machine has a full OS | Multiple containers share OS kernel

Docker images

Commands I learned:
-	docker image pull <imageName> – fetches a certain image and save it
-	docker image ls – shows all images in the system
-	docker container run – runs a container
-	docker container run alpine echo “hello from alpine” – gets the output “hello from alpine”
-	docker container run alpine /bin/sh – runs and then exit a shell
-	docker container ls – shows all the running containers
-	docker container ls -a – shows all the containers you ran

# Cloud Web Apps (intermediate)

## Video: virtualization (15min)
-	Starting from the 1970s, invented by IBM
-	The idea of kernel mode/supervisor mode: run applications on top of OS and make OS have more access to the machine so that applications would not cause the machine to crash
-	Xen virtual machine: open-source and popular
-	Hypervisor: accesses the physical device


## AWS Tutorial: Install a LAMP Web Server on Amazon Linux 2 (40min)
-	Preparation: 
	- a new Amazon Linux 2 instance
	- security group configuration: SSH (port 22), HTTP (port 80), HTTPS (port 443)
	- update software packages ```sudo yum update -y ```
-	Install LAMP and Apache web server
	- install lamp-mariadb10.2-php7.2 and php7.2 Amazon Linux Extras repositories ```sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2```
	- install Apache web server and MariaDB ```sudo yum install -y httpd mariadb-server```
	- start httpd
	- set file permissions to allow user to add, delete and edit files
-	Test the LAMP server:
	- Create a PHP file in the Apache document root. Type the URL of the file in a browser there should be a PHP information page if the server is running correctly and the PHP file was created properly. 

-	Secure the database server:
	- Set a password for the root account
	- Remove the insecure features including anonymous user accounts, remote root login, test database
	- Reload privilege tables

## On your own: compare the performance, functionality and price when serving web content from S3 versus and EC2 VM (10min)
components | S3 | EC2 | comment
------------ | ------------- | ------------- | -------------
performance | Fast and reliable | Manually scalable |
price | $0.023 per GB within first 50 TB $0.022 per GB 50 – 500 TB $0.021 per GB over 500 TB | From $0.025 per GB to $0.10 per GB according to storage type | S3 is a lot cheaper than EC2
functionality | Better for static content | Better for running programs |

## QwikLab: Intro to DynamoDB (30min)
Amazon Dynamo DB is a kind of NoSQL database service which provides both document and key-value data models. 
This lab shows how to create a table in Amazon DynamoDB and enter data into the table. Then query the table and delete it.

Create a table:
-	Each table has to have a Primary Key. It can also have a Sort Key.
Add data to the table:
-	Structure: Data is stored in tables. A table contains items. An item is a collection of attributes.
-	This is how I understand it:

DynamoDB | Other database systems
------------ | -------------
table | table
items | rows
attributes | columns 

Query the table – query or scan
-	Query is much faster than scan
Delete the table

## Deploy a Node.js Web App (80min)
- Tools and technologies we are going to use: 
	- AWS Elastic Beanstalk 
	- Amazon DynamoDB
	- Node.js
	- Express
	- NoSQL database
 
- launch an Elastic Beanstalk Environment with following configuration:
	-	Platform: Node.js
	-	Application code: Sample Code
	-	Others: default settings
- Add permissions to environment’s instances
	-	What are permissions for: when a request comes in the application would access the services with the permissions
	-	The policies for this application: AmazonDynamoDBFullAccess and AmazonSNSFullAccess
- Deploy the sample application
	-	This tutorial provides a source bundle, we only need to download it and upload and deploy it on the Elastic Beanstalk console
	-	It collects contact information of users and  store it in a DynamoDB table
	-	We can add data to it by sign up on the webpage
- Create a DynamoDB table and configure
	-	Set email as the primary key and the type of value is string
	-	Change the minimum instance number from 1 to 2 so that when there is a failure in one of the instance the application can still be available

## Intro to AWS Lambda (30min)
In this lab we learn how to create a serverless application with AWS Lambda and AWS S3.

Background knowledge and terminologies:
-	Lambda is a compute service on which we can build serverless applications. It would provide server management for us. We only need to pay as the actual computing time
-	Blueprints: code templates for some standard functions

Process of the lab and takeaways:

First we create an input bucket and an output bucket in AWS S3 and upload the test picture to the input bucket. Then we create a Lambda function and the trigger. It is a serverless service so it only runs when it is triggered. That is why we need the trigger. We configure it as using Object Created as the event type and the image we just uploaded to input bucket as the object. 

Then we create Thumbnail file for the function which resize the picture and upload it to the output bucket. Then we can test the function by creating an event so that the function would be triggered once we upload a new image to the bucket. 

Monitoring it and looking at the logs can be very helpful for trouble shooting and perfecting our function. On the monitoring console we can know about the innovation times, execution time and the errors generated. 

We can use these information to scale our function to improve it. For example we know the errors it generated then we can create replications for better availability.

## Intro to Amazon API Gateway (70min including looking at some other documents)
Background knowledge:

- A microservice is to break down a large and complex system into independent services so that it is easier to improve availability and make the system easier to maintain.
- API (application programming interface): it defines a collection of functionalities for developers. It shows how the components interact. 
- API Gateway:  a managed service that makes creating, deploying and maintaining APIs easy. 

Process of the lab:
-	Create a lambda function. 
-	Choose API Gateway when add triggers 
-	Test the lambda function

Summary: 

This lab is similar to the previous intro to AWS Lambda lab. The focus is getting a better understanding of some of the components of AWS Lambda and we learn about API Gateway. API Gateway holds APIs together to provide developers more control and make the management a lot easier. We also learn about the concept of micro services in this lab. It is a structure that helps with increasing the availability and scalability of a system.


## Build a serverless web application (180min)

In previous practice of Big Data and Machine Learning I have learnt how to build a serverless real-time application using AWS Lambda, DynamoDB and S3. But this application has involved some new functions of AWS such as Amazon Cognito User Pool and API Gateway. 

#### Process and takeaways 

Web Hosting: 

Amazon S3 is a good choice for storing static content of a website. It is cheap and it provides good performance. I have used Amazon S3 for many times in previous practice so I used a template to build it. 

Manage Users

Tool and Technology

- Amazon Cognito user pool is a very helpful tool for handling authentication. Developers can use it to set up requirements for new users to register. In this lab when a user registered with email address. Amazon Cognito will send a confirmation email to that address with a verification code in it. A user can only sign in after verifying identity. 

Implementation

- Services -> mobile services -> Cognito
- manage your user pools -> create a new user pool -> name it WildRydes -> review defaults -> create pool
- General settings -> app clients -> add an app client -> name the app client WildRydesWebApp -> create app client without generating client secret
- download config.js and modify the IDs -> upload it to S3
- Giddy up -> register -> let's ryde (I used a fake email in this lab so I verified manually)

Serverless Service Backend

Tool and Technology
- Serverless Service is that the server would not always be running. When a request comes in asking for a function, it handles that request in a container that runs the certain function. The same container would be reused if there is another request for the same function. When there is another request that askes for a different function it would open another container for it. The container would be turned off when it is killed or timeout. 

- Amazon Lambda - implement a Lambda function. When a user requests a unicore this function would be triggered

- Amazon DynamoDB - the database 

Implementation: create a DynamoDB table -> create an IAM role -> create a function -> test

RESTful APIs

Tools and Technology

- Amazon API Gateway -- expose the Lambda function as an API which is accessible on the public internet

- Amazon Cognito handles the authentication for the API

Implementation: Create a New REST API -> Create a Cognito User Pools Authorizer -> create a new resource with the API -> create a POST method -> Deploy the API

## build a modern web application -- Mythical Mysfits (300min)

Tools and Technology: 

![Structure Diagram](link-to-image)

