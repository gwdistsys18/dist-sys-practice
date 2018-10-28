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
3. Docker intro
	-

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

