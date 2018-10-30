# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1: Docker and Containers
> Include notes here about each of the links

* Video: why docker
    There was really very little useful information in this video.  
    The author spoke a lot about how everyone should be learning containers, and that they are the wave of the future.  
    He didn't say very much about what they are.  
    He had a lot of anecdotes about docker inc and their mascots and their yearly party.  He did a good job convincing me that containers are an in-demand skill.  

* Lab
    This was a really interesting lab.  There were two useful parts two it: first, I learned basic docker CLI syntax, and second, it gave me a good idea of what a container is a useful abstraction for, and what design decisions it supports.  As far as the CLI syntax, it went over downloading and managing images, as well as the different options when using `docker container run`.  
    As for the design decisions around docker, the most meaningful idea
    that I took away was the VMs are for multiplexing hardware and splitting resources efficiently.  In this way, it abstracts the hardware.  Containers exist to abstract applications.  Their virtualization is important, but more importantly is the fact that they let you programmatically deal with environments and sandboxed applications running on any hardware.  



* What is a container
    This video began by describing docker, and more generally containers, at three different abstraction levels.  You can think of a container as a sandboxed process with its own environment.  If you are thinking about runtimes, this is the useful abstraction.  You can also think about a container as an image in a tree.  You can commit some changes to a branch in the tree.  In this way, you can use the same distributed version control that you may be used to with git to reason about versioning of applications as well as code.  Finally, you can think of an application as a dockerfile.  This lets you 'program' your container.  By specifying exactly the dependencies in a dockerfile, you can define a container.  It is cool to think about executables and applications as nothing but a configuration file that generates them.  

    He spent the second half of the video talking about how the docker engine works, and accomplishes these three abstractions.  He specifically talked about network and storage configuration, and how the docker host deals with this.  He also talked about how you can use volumes or networking to deal with state, while containers have no state to themselves.  

* VMs vs Containers
    This video talks about how VMs and containers work very similarly, but accomplish entirely different tasks.  
    * The API level of the virtual machine is below the client OS.  The virtual machine hypervisor provides an abstraction for the devices and hardware of the machine.  
    * The API between the VM and the hypervisor is very simple because it will just provide a generic driver for each of the devices, but the API between the hypervisor and the real hardware is very complicated because it must deal with any host hardware.  
    * Containers take a different tradeoff.  The applications are written to be linked with their own dependencies into one container image.  This means that the host operating system does not need to multiplex the hardware among multiple VMs that each think that they are running on hardware.  The docker engine allows the application to run in the same way as a normal process.  
    * The benefit is that the host operating system does not need to be more complicated than the hypervisor.  The operating system already has kernel drivers to run on physical hardware.  
* Docker intro
    * This lab expanded on the previous dev-ops lab.  Rather than describe how Docker works, it talked through a few ways to use it.  Most of the syntax that it taught was also taught during the dev-ops lab, but in this one, it taught how to make a background docker process, in this case to run a database.  
* Doing more with docker images
    * This lab provided much more information about using dockerfiles and the docker CLI to compose containers.  One of the benefits of docker that I did not know about is that you can stay up to date with branches.  I assumed that with containers like VMs, the most common way to update their software was to write a daemon or job to ssh into them, and manually pull from repos to keep them up to date.  Because docker images are composed of parent images, you can just update the dockerfile to keep your containers up to date.  When ubuntu or alpine or whatever parent you have is patched, docker store will get a new version of the image.  To update, all you need to do is track the updated image.  
    * This lab also covered the CLI syntax for committing changes to a container, writing a docker file from scratch, and creating a new docker image from an existing one with changes.  
* Advanced Deep Dive
    * VMs vs containers
    * The three aspects that will be compared are size, isolation, and boot time
    * Containers can (and often do) run within VMs.  
    * Often containers are smaller, for binaries that require very little from the hardware.  For example, go compiles to static binaries that use very few operating system libraries, so there is nearly no overhead to containerizing applications.  In other cases, if you require many OS properties, a container may be similarly sized.  
    * Isolation is generally better on virtual machines, because there are more layers of emulation.  Not only will an attacker need to escape the virtual process's sandbox, but also the hypervisor layer which emulates EFI and bios, in order to see other VMs running on the system.  
    * Using modern tools like EFI and system which begins processes in parallel, starting VMs can be close in startup time to containers.  However containers do not need to emulate hardware bootup, so they are slightly faster.  
* Lab Docker Networking
    * Prior to this lab, I did not know that the docker engine provided useful tools for setting up virtual and physical network connections. 
    * The bridge network is created by default for all containers, and it allows communication between the host and all of the containers that are created (unless specified that a container should not be on the bridge network), along with the ability to ping the outside world.  
    * The docker CLI and dockerfiles system make it easy to programmatically connect containers, as well as to map host and container ports.  In this lab, we ran NGINX within a container and mapped the host port 80 to the docker 8080 port.  
    * Docker swarm mode allows you to control many docker instances of the same application programmatically.  For instance, you can automatically scale up the application to deal with a large workload, and deploy a service to an entire swarm.  
    * The steps to doing this are, create a swarm, and tell nodes to join The Swarm.  Next, you want to create an overlay network across the swarm.  Finally, you create a service and pass it to the network to be executed by the swarm.  
    * I am thinking that for my final project for this class, I may want to use swarms for scalable backend applications.  
* Docker Swarm vs Kubernetes
    * Swarm and kubernetes are orchestration tools.  
    * Swarm is a bit simpler and build into docker
    * Kubernetes is built by Google, and can be used for docker as well as other virtualization container tools
    * Kubernetes is much more widely used and has many more features.  
* Kubenetes in 5 minutes
    * kubernetes cluster services
    * enforce desired state management
    * we want to give a specific state to kubernetes cluster services, and it will make sure that every docker has the same state
    * The application state is stored in a deployment .yaml file
    * pod is the smallest unit in kubernetes, specifies one or more images running with some work
    * can compose pods and specify the number of pods
    * The yaml file is passed to cluster services schedules the replication of podes as specified in the config files.  
    * The scheduler deals with adding new replicas and if some die, they bring new ones up.  
* Learn on my own, and using AWS
    * I decided to deploy kubernetes on an ec2 VMs.  I built a docker file with the key value server that we made for project two.  I made another docker file with the key value client for project two.  
    * I made a kubernetes deployment with three pods.  Two pods were clients and one was a server, with both clients talking to the one server.  
* Breaking apart a monolith
    * I had issues with this.  The docker.io cli, which I installed as the lab instructed and the amazon cli were incompatible.  The Amazon CLI created docker commands that used out of date syntax.  Eventually, I figured that out.  Amazon also told me that the same credentials that work to login to my personal console, and to login to the classroom, are not correct to log in to the console from the classroom.  I solved this by using the Github student pack credits.  Eventually, I found an error where the AWS repo had symlinks in the dockerfile that docker was not able to parse.  I was not able to figure out this issue.  
    * I read through the code in the repo and the instructions for the lab.  It seems like an interesting project, but I was not able to get it up and running.  I don't think the lab is up to date with the most recent aws CLI.  

## Area 2: Cloud Web Apps
> Include notes here about each of the links

Cloud Web Apps
* AWS LAB

    * In this lab you learn how to spin up a new EC2 instance and access it.  It talks you through how you get the permision to log into the virtual machine, as well as how to configure it with different hardware.  

* qwiklab: S3

    * This lab talks you through how to us the amazon S3 service.  S3 is great for hosting static documents that will be requested often but not often changed.  
    * In this lab we created a bucket in S3, and uploaded an image to it.  
    * For the image to be servable, you need to change the access permissions.  This happens through a bucket policy which we implemented. 
    * Finally, we used S3's versioning to upload a new image to the bucket.  Versioning lets you keep track of changes to the documents that you server, but only ever serves the most recent upload.  
