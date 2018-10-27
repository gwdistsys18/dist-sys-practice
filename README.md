# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 Docker
### Beginner
1. Why Docker
	- This video discussed the trend of advancements in computer science
	it acknowledged that Docker and containerization in general is a
	trend that many people are moving towards due to it's ease in setup
	and the speed associated with spinning up a new container.
2. DevOps Docker Beginners Guide
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

## Area 2 SDN and NFV
> Include notes here about each of the links
### Beginner
1. Introduction to SDN
	- Use layers to provide increased control of packet flow.
	- IEEE survey paper is useful.
	- Allows for a network to be open and programmable.
	- Operating System Model
		* Operating System, middle man with core services
		* South of OS, hardware low level
		* North of OS, applications higher level
		* NOS or Network Controller == Operating System
		* Network forwarding devices == South of OS HW
		* Network applications == North of OS Apps
	- Packet processing, use network forwarding device to decide what to
	do upon reciept of a packet. Contact the SDN controller if already
	seen packet.
	- Controller can interact with forwarding devices and provide an
	abstraction of the whole network to network applications.
	- Forwarding Devices
		* Programmable HW switches
		* Software Switches 
	- Network OS (SDN Controller)
		* Topology, inventory, statics services
		* Host Tracking
	- Network applications
		* REST interface
		* Eventually could be standardized
	- Can have multiple SDN controllers on one network this allows for
	thurough partitioning of a system
	- SDN Controller is usually duplicated many times to allow for load
	balancing to help provide availability. Controllers can also be 
	separated by regions.
	- Control Plane and Data Place
		* Control plane communicates and send instructions to data plane
		* Data plane directly handles packet processing using instructions
		from the control plane
	- SDN allows for these two planes to be separated and have multiple
	control planes be unified to help minimize configuration errors.
	This removes distributed protocols because the controller is logically
	centralized.

