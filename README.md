# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 Docker
### Beginner
1. Why Docker - 10 min
	- This video discussed the trend of advancements in computer science
	it acknowledged that Docker and containerization in general is a
	trend that many people are moving towards due to it's ease in setup
	and the speed associated with spinning up a new container.

2. DevOps Docker Beginners Guide - 45 min
	- This tutorial started with a few simple commands and explained what
	docker is doing when those commands are run.
	- This tutorial then uses a lightweight version of linux to run some
	more basic commands in while continueing to explain Docker infrastructure
	further.
	- The tutorial helps to further solidify my understanding of the
	differences between VMs and containers. Primarily the focus is on
	the speed with which a contianer can be spun up and killed. Fast
	enough to run a single command and get an output within a reasonable
	amount of time.
	- Security is inforced through the separate instances of contianers.
	although n contiars can be run using the same instance they all have
	isolation ensure because they are executing in different contexts
	while sharing the same image.
	- Docker speed and isolation can be beneficial for app testing. This
	is an interesting idea, using a container to test changes to an
	application while preserving a running context.

### Intermediate
1. What are Containers? - 18 min
	- At a base level containers are isolation mechanisms for processes
	to give them their own namespace and address space.
	- Containers are typically one process per container
	- The container's lifecycle is coupled with the process lifecycle
	- A container image is a binary representation of a container 
	- Container images can have a hierarchy with parent child relationships
	- Containers can share images which allows for consolidation of binaries
	- Nodes that are high up on the image tree can be updated and after
	pushing that change it is inherited to all of the children of that node
	- Dockerfiles inherit from image files, to create a container image
	- Images can be created from a container, setup can happen and then
	be committed to an image
	- All docker dependencies are packaged within the container, this is
	why it's called a container because it's entirely contained.
	- Docker uses an image tree to track what's needed to be fetched
	from the docker store
	- Volumes persist data beyond the lifecycle of the container

2. VMs Versus Containers - 8 min
	- Hypervisor has to be extremely complex to support level of
	abstraction the VM expects
	- Dependencies are backed into containers, in a VM this has to be
	handled at the operating system level. Containers are entirely
	user level execution, and VMs need the OS/kernel to make smart 
	decisions about how to abstract the hw.
	- VMware employees like to defend virtualisation 

3. Docker intro - 30 min
	- Containers share a kernel so it needs to be the same on a system
	that's running multiple containers
	- Containers have multiple use cases, running a single command,
	running something in the background and existing as an interactive
	shell
	- When configuring a container that will eventually be exported as
	an image interactive containers can be useful
	- Docker files are sort of like the spec for how to build the image
	and eventually the container
	- Building and launching a website feels pretty cool inside of a demo
	- Container deployability and speed are clearly demonstrated in this 

4. Doing More With Docker Images - 45 min
	- Docker images can be created from an existing machine that has any
	amount of customization on it
	- Saving the state of a docker container in a image is as easy as
	writing the command "commit". This can then be used to create any
	number of additional images with the same packages and config
	- A Dockerfile seems like the best way to build a container
	- Dockerfiles track changes really well while images are just a
	bunch of binary data representing some state.

5. VMs Versus Containers Deep Dive - 9 min
	- Containers while they contain all of the dependencies needed to
	run an application are far smaller than an equivalent VM
	- Containers are less secure than a VM because containers are as
	secure as the containr sandbox and the kernel 
	- VMs are far slower to boot up an application than a container
		* A VM needs POST->kernel->init->process 
		* A container needs sandbox->process

6. Docker Networking - 45 min
	- Docker networking setup seems to be entirely through the Docker
	network command.
	- Networks attached to Docker containers have drivers and a per
	network scope
	- Setting a container to spin and then networking into it to then
	interact and then make changes
	- I'm not sure I see the point on the same machine but I guess if
	you're running your contianer in someone else server this is useful
	- Using swarm to orchestrate networking seems useful
	- Initializing a swarm is startlingly easy
	- Adding nodes to a swarm is as simple as pasting in a generated
	join command. This clearly demonstrates the ease of using an integrated
	orchestration tool
	- Building a testing services in this swarm is very simple and continues
	to display how useful it is to have swarm built in
	- The only disadvantages this shows to kubernetes is that I think
	you can do more with kubernetes it just takes longer to setup

7. Swarm Mode Instruction - 30 min
	- Again this demonstrates how convenient it is to have swarm be built
	buy docker and integrated
	- A stack in the context of Docker Swarm is a collection of services
	that are deployed together. Like a development stack
	- Both Docker Swarm and kubernetes use .YAML files to define the
	structure of their system management

8. Kubernetes VS. Swarm - 4 min
	- Comparison of orchestration systems
	- Swarm is Dockers version of kubernetes and since its build in
	it is simpler than kubernetes

9. Kubernetes - 5 min
	- Cluster services helps to manage a cluster
	- Workers are container hosts with a "kublet" process
	- Yaml spec for config about cluster
		* pod config - group of containers running the same image
		* replica - how many of this pod
	- Cluster services manages scheduling the right number of pods
	according to the spec
	- This is across any number of workers this is because workers
	can have multiple containers
	- Cluster services also handles when workers go down

10. Kubernetes++ - 60 min
	- Kubernetes clusters can now be launched using a voice command to
	the google assistant
	- Still so new to the point that we don't have a set way of doing things
	- You can use kubernetes build triggers to build an instance of something
	when a commit is made to master on a git repo
	- This is crazy for development, pushing to a repo builds and pushes to a
	website that reflects changes
	- If build passes and test passes changes are reflected
	- The yaml file is checked out automatically from the infrastructure repo
	and is updated to reflect the new updates
	- <https://www.youtube.com/watch?v=kOa_llowQ1c>
	- <https://www.youtube.com/watch?time_continue=4&v=H06qrNmGqyE>

11. Docker in Cluster of EC2 Instances using Kubernetes to Orchestrate - 60 min
	- Amazon provides a service called Elastic Container Service(ECS) this is
	what eventually is fed a docker image and serves as the docker container
	- ECS is typically setup as a cluster, the process is straightforward
	if default configuration is assumed
	- ECS instances use a task definition from amazon that defines which
	docker image to use for container configuration
	- Using ECS amazon provides elastic load balancing which isn't needed
	for this project but very useful in real world applications
	- The basics of interacting with a cluster are verified using a key pair
	similar to EC2 generation and access
	- KOPS is a somewhat simple to use open source tool for installing
	kubernetes on a cluster of EC2 instances
	- <https://medium.com/containermind/how-to-create-a-kubernetes-cluster-on-aws-in-few-minutes-89dda10354f4>
	

### Bring it all together
1. This module goes through putting a monolith application in a container
	then deploying that container
	- This module then breaks the monolith into microservices without any
	downtime
	- Each of the pieces of this process are addressed and explained in
	short. Starting with containers the tutorial explains why they're
	useful in this situation
	- This tutorial requires more access than a standard amazon educate
	account provides so I needed to make a personal account for this module
	- This module is multistep and hands off compared to the others
	- Setting up a containerized version of an app requires first building
	a docker image to use for the container
	- The first large step is to deploy a large application inside of a
	container
		* First step is to build a cluster using the image created earlier
		* Build a stack(not the data structure) 
		* Setup and orchestration .yaml file
	- Next once the cluster is deployed it must have it's task set to
	the application to be run
	- Setting up a load balancer is the next important step
		* Setting a target group is needed to route traffic to containers
		in the cluster
		* Setting the listener is needed to handle requests to the load
		balancer
	- The next portion of the module focusses on pulling the application
	a piece at a time
	- After building a docker image and tagging it in the repo contianers
	can be built to the spec
	- Setting up a cluster using the spec provided was also a simple task
		* This involved building a new stack and using the provided .yaml
		file to orchestrate at a basic level
	- Deploying the monolith definitely took some doing, breaking into
	microservices shouldn't be too bad because the way this application
	was built it allows for it to be broken up. Some apps aren't architected
	to support containerization and distribution
	- Advantages of isolation into microservices inside of containers
		* Crashes are isolated, the entire system doesn't have to go down
		* If a container becomes compromised it cannot affect the rest of
		the system
		* If a portion of the system needs to scale to account for new needs
		it can easily do so without constraining the rest of the system
		* This one is not intuitive, development speed is greatly increased
		dependencies across services are almost entirely abstracted away from
		the developer. A dev can work and and test their service entirely
		seperate from the rest of the system
	- The work of breaking an application into microservices is not difficult
	a lot of steps but all fairly simple
	- After all of the tasks are generated linking them all together takes
	a bit of work but AWS makes this easier with listener generation wizards


## Area 2 Cloud Web Apps
### Beginner
1. AWS: Launch A VM - 15 min
	- Starting a EC2 instance seems fairly straight forward. 
	- Download a key pair and use the public url to ssh in.

2. Lab: Intro to S3 - 30 min
	- This lab was slightly more involved than the first.
	- Creating an S3 instance and interacting with it is
	faily intuitive but this lab made it very explicit.
	- Setting up the instance to view the image was simple,
	I anticipate creating a bucket policy will be more involved.
	- As I expected creating a bucket policy required a little more
	leg work, although the policy generator that amazon provides
	is quite useful.

### Intermediate
1. Video: Virtualization - 10 min
	- Virtualization is what allows to processing time to be bought and
	soled like in cloud computing and distributed computing.
	- IBM created a virtual machine to support more OSes on their desktops
	- VMWare: Software Virtualizaiton that helps to isolate crashes in apps
	to provide redundancy in the case of a crash.
	- The idea of rings are used to separate the level of privilege in an os.
	- When an OS running in user space attempts to execute a privileged operation
	this is cought by some sort of VM management portion of the base os that
	can serve to emulate the operation and serve what the OS in user space
	accepts as a response to the call that was made and cought.
	- Some ISAs are designed to be virtualized but x86 is not which makes
	the ability to virtualize x86 machines even more impressive.
	- The Xen hypervisior is smaller than a standard VM monitor.
	- An OS operating in domain 0 executes privileged instruction for the
	guest OS but is not technically a part of the hypervisor which is what
	allows the HV to be so small.
	- Software emulation of instructions is not fast and has an overhead
	for the protection switches that happen.
	- Virtualization support now exists in Intel processors so HW can take
	some of the work away from the software helping to improve performance
	of the virtual machine.
	- This helps companies that can't or won't update the OS that they use
	but want to use new hardware or unsupported software.

2. Install a LAMP Web Server on Amazon Linux 2 - 30 min
	- LAMP stands for Linux, Apache, MySQL, and PHP
	- Installing and running is a simple as setting up an AWS Linux2 instance
	and installing a LAMP Maria DB
	- By default MariaDB comes installed with some features that are great
	for testing but should be removed to ensure a secure systems when this
	eventually moves to production.

3. S3 VS. EC2 VM - 30 min
	- S3 advantages are that it was built for storage. The instance exists
	to host and deliver web content. This means in terms of complexity it
	would take more effort to turn an EC2 instance into an acceptable server.
	- Setting up an S3 is comparable to setting up an EC2 but when an S3
	is done being setup it is ready to provide fast media hosting, the same
	cannot be said about the EC2 more work is required to have even close
	to the support and speed of the S3.
	- This comparison comes down to the complexity of setup, the serving
	of web content that is media heavy an S3 is gonna be the ideal choice.
	- If the website that you want to setup requires some involvement in
	the configuration of the VM or additional packages to be installed
	then maybe the EC2 is an easier choice, it's much more flexible than
	the S3.

4. Introduction to DynamoDB - 20 min
	- DynamoDB is a fully managed noSQL database that can be used for a
	variety of applications.
	- This service from Amazon is managed at the level of tables not
	entire instances like S3 or EC2
	- Creating a table is as simple as entering fields and selecting
	a primary key which is crucial to identifying a tuple in a relational
	database.
	- In dynamoDB tuples are referred to as items and tables can have
	any number of items in them
	- The concept of a sortkey exists in DynamoDB and if an item has
	a sortkey is must be provided upon insert of that item.
	- The sortkey is a field separate from the primary key used to
	sort the items in a table.
	- DynamoDB has two way to find items in a table scan and query:
		* Query: Uses a primary key and occasionally the sortkey to
		find a tuple. This is usually very fast.

5. Deploy a Scalable Node.js Web App - 60 min
	- AWS has it's own JavaScript Node.js SDK this allows for easy
	integration to existing AWS services like a DynamoDB
	- An application running on AWS elastic beanstalk can use either
	a DynamoDB table within it's runtime environment or an external
	table also hosted by AWS.
	- Amazon's Elastic Beanstalk environment can be configured to
	support application that aren't Node.js
	- An Elastic Beanstalk Environment is comprised of the following:
		* A standard EC2 with configuration to run a specific kind of 
		web application
		* Instance Security Group this limits access to port 80
		* Load Balancer this is used to distribute incoming requests
		* Loab Balancer Security Group, this is used to limit load
		balancer access to port 80
		* Auto Scaling Group, this monitors the need for rebuilding
		or adding additional instances to the EC2
		* S3 bucket used for storing application related data
		* CloudWatch Alarms, monitor load on instances and notify
		the manager if load is too high or low on any give instance
		* CloudFormation stack, management tool for distributing
		configuration changes amongst instances related to the elastic
		beanstalk.
	- The above mentioned auto scaling group and the CloudWatch alarms
	work together to scale the application only when the CloudWatch
	alarms detect the need for scaling. 
	- Updating the application to link it to a DynamoDB table is as
	simple as updating the application configuration file and letting
	the CloudFormation stack to the rest.

6. Intro to AWS Lambda - 30 min
	- Lambdas are event driven meaning they only execute code when
	an event has been recieved.
	- Using the simple example of a serverless image thumbnail application
		* First an image is uploaded to an S3 bucket
		* The bucket then serves an object created event to the lambda
		* The lambda then fetches the object using the event to id it
		* The image is finall rendered by the lambda function
	- Lambdas have extensive logging support varying from duration of
	execution to the numbers of throttles that occured.

7. Introduction to Amazon API Gateway - 40 min
	- What is a microservices architecture
		* Developing an application as a suite of small services that
		all have their own processing and communicate through light
		weight mechanisms
		* These managable lightweight services are easy to improve
		and scale as needed. Instead of scaling the entire application
		scale as needed.
	- API stands for Application Programming Interface
		* A set of defined ways to interact with a system using
		things that resemble function calls.
	- RESTful APIs 
		* Allows for a stateless server. This lends itself really
		well to the idea of a lambda function using API calls as events
	- Amazon API Gateway, allows us to map GET, PUT, and POST functions
	to a backend within AWS in this case Lambda functions.

8. Build a Serverless Web Application - 120 min
	- In this tutorial we use an S3 bucket to host our web app. The
	data hosted on the S3 will eventually be available upon requests
	made to the Amazon API Gateway.
	- Amazon Cognito is a tool to manage acces to an application or
	specific media or pages on an AWS instance. This is what we use
	to allow uses to create a login with a password.
	- The S3 bucket configuration needs to be updated to support
	the user group created by all of the prebaked sign up sheet
	from Amazon Cognito
	- Next the backend is built to be serverless using AWS Lambda
	functions to service all calls made to the system. In this case
	all calls to the API will serve as events for the lambdas
	- The first thing a Lambda does upon receiving an event is
	store it in the related table for events in DynamoDB
	- Next after testing Lambda function making sure they spin
	when asked and do what was requested the API needs to link
	the calls made to the backend itself.
	- The Amazon API Gateway helps us to map the pre-existing
	components to eachother, calls to the API will trigger
	lambda function execution as well as S3 page delivery
	and media changes.

### Bring it all Together
	Build a Modern Web Application
1. Build a Static Website
	- This website will use an AWS S3 bucket to host it's static content
	- Amazon Cloud 9 is an in browser IDE helpful for writing and debugging
	code in the browser. 
	- Amazon S3 buckets are configured to hold data but not specifically
	website data. This means before you can host a website on an S3 instance
	it must be configured.
	- The configuration for an S3 includes setting up the registered DNS
	name of the bucket as well as establish the appropriate bucket policy
	- Bucket policies are a form of access control. In the case of a website
	the idea of access control comes down to which users can see what content
2. Host Application on a Web Server
	- This website will have a modern microservices backend this means
	that instead of a monolithic application it will be distributed to
	various nodes in a cluster probably with a load balancer to hand out
	the work to be done.
	- AWS Fargate is a deployment option of Amazon ECS which stands for
	Elastic Container Service.
	- Fargate abstracts the details of managing a cluster by providing
	a load balancer and a cluster of nodes.
	- Fargate is ideal of PaaS, mobile and web platforms because it is
	optimized to service long running processes like microservices
	- A Fargate ECS will scale automatically and completely abstracts
	cluster management and configuration. This allows the application
	developer not to get cought up in the weeds of configuration
	- A serverless architecture can be delivered in a variety of ways
	one of which being Fargate another popular method is using Amazon
	Lambda functions. These serve better to act as microservices for
	a data or event driver architecture.
	- Amazon VPC stands for Virtual Private Cloud this is fully 
	customizable isolated portion of the cloud to host services in.
	- Amazon CloudFormation Templates serve to collect network and
	security in a bundle to be deployed and synchronized together.
		* Amazon VPC
		* Two NAT Gateways
		* DynamoDB VPC Endpoint
		* Security Groups
		* IAM Roles
	- Listed above are the core parts of a CloudFormation Template
	these serve as the networking backbone of the application as
	well as provide some security inherint in AWS systems.
	- Flask is a micro web framework written in Python and used in
	this example to help provide the API definitions for the app.
	- A CI/CD pipeline allows for Continuous Integrating and
	Continuous Delivery.
	- This means that when updates are made to the code base in this
	case the Flask app they are push and distributed to the rest of
	the system without having to manually update every piece.
3. Store System Information
	- 

## Area 3 Big Data and Machine Learning
### Beginner
1. Hadoop Intro - 20 min
	- Data is growing so rapidly that our previous solutions for handling
	more data no longer work.
	- The idea of distributed systems helps to improve the solution from
	buying more machines to using a group of machines in an intelligent 
	way.
	- When using a distributed system to help process large amounts of
	data throughput increases greatly but at the tradeoff of having a
	higher chance of failure by the introduction of more machines into
	the system. Another problem introduced by distrubuted sytems is the
	need to synchronization and the inability to guarantee that at any
	give time data is not consistent accross multiple machines.
	- Hadoop claims to offer solutions to the challenges faced by distributed
	systems. Being able to handle these challenges means that a person
	can have the benefits of more computing power without the inherint
	drawbacks of distribution.
	- Hadoop runs on commodity hardware and uses multiple copies of data
	to ensure redundancy.
	- Hadoop completely reverses the way data is processed. A central
	program distributes the data amongst the system and performs 
	processing on the data where it is store instead of having the
	data sent to the program it brings the program to the data.
	- The Hadoop ecosystem:
		* HDFS: Storage layer, streaming access to fs data and authentication
		* HBASE: Stores data in HDFS non-relational DB, high throughput
		* Sqoop: Imports and Exports data to and from relationals DBs
		* Flume: Collects event data and transfers it to HDFS
		* Spark: Data processing component, cluster computing processing
		* Map Reduce: Original Hadoop processing engine, fault tolerant
		* Pig: Open source high level data flow system
		* Impala: SQL Engine, interactice analysis with low latency
		* Hive: Abstraction layer similar to impala but better for ETL ops
		* Cloudera Search: Near-real-time access no skills required
		* Oozie: Coordinating map-reduce workflows from other apps
		* HUE: User level interaction with previousls mentioned components
	- These tools help to abstract the map reduce writing portion of development
	away from the user. One of the problems with distributed systems is that
	they require complex code to preform well. This helps to solve that
	problem by not making the user write the code.
	- A lot of the problems introduced by distribution are solved by these
	components. They make writing the code for these systems easier and
	provide levels of fault tolerance otherwise lost on large distributed
	systems.
	- The four steps of big data processing:
		* Ingest: Scoop and Flume transfer data to Hadoop
		* Processing: HDFS->Hbase->Map Reduce||Spark
		* Analyze: Pig, Hive and  Impala
		* Access: Hue or Cloudera Search

2. Analyze Big Data with Hadoop - 45 min
	- Amazon EMR: Is a platform to help support big data processing
	services like Hadoop.
		* Consist of EC2 instances organized in a cluster
		* There are master nodes, core nodes, and task noes.
		* The master node is responsible for distributing work to
		be done by the the worker nodes.
		* Core nodes store data using HDFS
		* Task Nodes do not use HDFS and are optional
	- Creating an Amazon EMR Cluster
		* EMR is designed to serve as a platform for distributed big
		data processing.
		* EMR Clusters are reliable and scalable, leveraging AWS easily
		scalable architecure.
		* Using EMR you can select multiple FS backends including HDFS
		as well as Amazon's own distributed FS
		* The available Data Processing frameworks are the same the
		two available for Hadoop like map reduce and spark

## Blog Post
### Containers: Why do we have them? What can I put in them? How do I make one?
	- What is virtualization in brief
		* Virtualization is emulating hardware for an operating system.
		Originally it was designed to allow OSes to run on HW they wouldn't
		typically support. Virtualization is done at both the hardware and
		software levels. An operating running in a virtual machine is 
		typically referred to as a guest os. When the guest OS makes calls
		down to the hardware instead of allowing the hardware to answer
		the call is caught and handled buy some sort of manager. In many
		cases this is referred to as the VMM or VM manager. The VMM is
		responsible for fielding these calls made by the guest os and
		responding to them in a way that the guest OS expects. 
	- how do containers do this differently 
		* Containers are slightly different than virtual machines in that
		they all need to run on the same kernel. A kernel in this case is
		similar to the VMM it will handle the interaction with the hardware
		abstracting away all of the system calls. Using a virtual machine
		the kernel being run on is almost irrelevant. A linux kernel can
		run a windows vm and a windows kernel can support a linux vm. This
		interoperability is why VMs are used in some cases. The flexibility
		provided by a VM is ideal for many companies and applications.
		There are some drawbacks to this flexibility and ability to have
		an extremely custom system and the most prevalent is the time to
		boot. A VM running on a non native environment like linux running
		on windows will be slow to boot and in some cases slow to run.
		This is where docker comes in. Docker provides the ability to
		spin up containers far faster than any other VM. This comes with
		the tradeoff of less customization. A docker container can only
		run on a kernel of the same type. A type like windows or linux.
		Windows containers are capable of running on a windows kernel
		and linux containers are capable of running on a linux kernel.
		Docker claims to provide support for linux containers on a
		Windows kernel but this is just a wrapper around preexistting 
		kernel features in linux. Docker sacrifices some customization
		options and configurations for fast boot and fast use.
		Below are some diagrams comparing VMs to Containers:
		FIXME DIAGRAMS
	- What can you use a container for with examples
		* Containers are used for a variety of reasons but many companies
		have adopted them and now rely on them for everyday use. The
		examples on Dockers website help to highlight some of the reasons
		to switch to docker and provide some examles of companies that
		have made the switch.
		* ADP
		* GSK
		* PayPal
	
	- How do I setup a basic docker application
	- 




 
