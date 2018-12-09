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
	- This module goes through putting a monolith application in a container
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

### Bring it all Together

## Area 3 Big Data and Machine Learning
### Beginner
1. Hadoop Intro
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






 
