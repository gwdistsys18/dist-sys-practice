# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Docker and Containers
> Include notes here about each of the links

-Video: Why docker?(https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)(15min)  
In the video, we can know that docker was released in 2013, as an open-source object by docker company.  
The appearance of docker makes a huge shift in ecosystem.  
The real benefit of using docker is all about speed, develop faster, build faster, test, deploy, update and recover faster!  
By using docker, we can avoid dealing with some diffiult troubles like you have multiple types of applications,   
a lot of different things that all need to work together. Those all have their own dependencies, their own requirement  
even run on different operating systems. It's complicated, but the way the containers do it now is it's consistent across the board.  
It allow you to package the same way regardless of your operating systems and distribute the system without setup.  
It makes a lot of pain problems around the software lifecycle much easier to deal with.  

-Lab: DevOps Docker Beginners Guide(https://training.play-with-docker.com/ops-s1-hello/)(45min)  
In this lab, I have learned about how to run a popular, free, lightweight container   
and explore the basics of how containers work, how the Docker Engine executes and isolates containers from each other.  
Get some basic knowledge about what is images and the basic commands in docker and how to use them.  
. Alpine Linux container: Alpine is a lightweight Linux distribution so it is quick to pull down and run,   
  making it a popular starting point for many other images.  
  docker image pull alpine: The pull command fetches the alpine image from the Docker registry and saves it in our system.   
  docker image ls: You can use the docker image command to see a list of all images on your system.  
  docker container run alpine ls -l: run a Docker container based on this image.  
    When you call run, the Docker client finds the image (alpine in this case), creates the container and   
    then runs a command in that container. When you run docker container run alpine, you provided a command (ls -l),  
    so Docker executed this command inside the container for which you saw the directory listing.   
    After the ls command finished, the container shut down.  
The fact that the container exited after running our command is important, As you will see in a few more steps,   
the echo command ran in a separate container instance. Imagine booting up a virtual machine (VM),   
running a command and then killing it; it would take a minute or two just to boot the VM before running the command.  
A VM has to emulate a full hardware stack, boot an operating system, and then launch your app -   
it’s a virtualized hardware environment. Docker containers function at the application layer   
so they skip most of the steps VMs require and just run what is required for the app.   
Now you know why they say containers are fast!  
  docker container run -it alpine /bin/sh: You are now inside the container running a Linux shell   
  and you can try out a few commands like ls -l, uname -a and others.   
  Exit out of the shell and container by typing the exit command.  
  We can see these container instances using the docker container ls command.   
  The docker container ls command by itself shows you all containers that are currently running.  
  docker container ls -a command: What you see now is a list of all containers that you ran.  
  docker container start <container ID>: We can use this command to tell Docker to run this specific container instance.  
Images - The file system and configuration of our application which are used to create containers.  
Containers - Running instances of Docker images — containers run the actual applications.   
A container includes an application and all of its dependencies. It shares the kernel with other containers,  
and runs as an isolated process in user space on the host OS.  
Docker daemon - The background service running on the host that manages building, running and distributing Docker containers.  
Docker client - The command line tool that allows the user to interact with the Docker daemon.  
Docker Store - Store is, among other things, a registry of Docker images.    
  
-Video: What are Containers?(https://www.youtube.com/watch?v=EnJ7qX9fkcU)(25min)
The container is used to cover a multitude things, is a sandbox of processes.  
sandbox--own namespace, cgroups(restrict what the process able to do).  
Container image: a binary representation, notion of parent-child relationship.  
all of the dependencies pretty much above the kernel are packaged inside of the container.  
you can run any number of different versions of applications all on the single operating system.  

-Video: VMs Versus Containers(https://www.youtube.com/watch?v=L1ie8negCjc)(15min)  
in VMs: the interface between operating system and physical machine   
a virtual hardware layer exists in the virtual infrastructure, is contains NICs, storage interface have to talk to(drives need).  
hypervisor is responsible for interacting with NIC, storage, agents and kernel modules.  
in Container: the docker engine in operating system, operating system dependencies and the application itself-image.  

-Lab: Docker Intro(https://training.play-with-docker.com/beginner-linux/)(1hour)  
know how to clone a repo from github in docker.  
git clone https://github.com/dockersamples/linux_tweet_app  
command to clone the lab’s repo from GitHub (you can click the command or manually type it).  
This will make a copy of the lab’s repo in a new sub-directory called linux_tweet_app
know how to run a single task, interactive ubuntu container and background mysql container in Alpine Linux container.  
start a new container and tell it to run the hostname command.  
The container will start, execute the hostname command, then exit. docker container run alpine hostname  
Docker automatically pulls image from Docker Hub. After the image is pulled, the container’s hostname is displayed  
Docker keeps a container running as long as the process it started inside the container is still running.  
In this case the hostname process exits as soon as the output is written. This means the container stops.  
Containers which do one task and then exit can be very useful.  
You could build a Docker image that executes a script to configure something.  
Anyone can execute that task just by running the container - they don’t need the actual scripts or configuration information. 
You can run a container based on a different version of Linux than is running on your Docker host.  
run an Ubuntu Linux container on top of an Alpine Linux Docker host (Play With Docker uses Alpine Linux for its nodes).  
docker container run --interactive --tty --rm ubuntu bash  
Notice that our host VM is running Alpine Linux, yet we were able to run an Ubuntu container.  
As previously mentioned, the distribution of Linux inside the container does not need to  
match the distribution of Linux running on the Docker host.  
Background containers are how you’ll run most applications.  
docker container run \
 --detach \
 --name mydb \
 -e MYSQL_ROOT_PASSWORD=my-secret-pw \
 mysql:latest
--detach will run the container in the background.  
know how to build images and run a custom application using docker.  
know what is bind mount and how to modify a running website.  
When you’re actively working on an application it is inconvenient to have to stop the container,  
rebuild the image, and run a new version every time you make a change to your source code.  
One way to streamline this process is to mount the source code directory on the local machine into the running container.  
This will allow any changes made to the files on the host to be immediately reflected in the container.  
When you use a bind mount, a file or directory on the host machine is mounted into a container running on the same host.  
Bind mounts mean that any changes made to the local file system are immediately reflected in the running container.  
know how to update and push images.  
To persist the changes you made to the index.html file into the image, you need to build a new version of the image.  
docker image build --tag $DOCKERID/linux_tweet_app:2.0 .will Build a new image and tag it as 2.0  
These images are only stored in your Docker hosts local repository.  
Your Docker host will be deleted after the workshop.  
In this step we’ll push the images to a public repository so you can run them from any Linux machine with Docker.  
Distribution is built into the Docker platform. You can build images locally and push them to a public or private registry,  
making them available to other users.
docker image push $DOCKERID/linux_tweet_app:1.0 will Push version 1.0 of your web app using docker image push.  

-Lab: Doing more with Docker Images(https://training.play-with-docker.com/ops-s1-images/)(1hour10min)
know how to create image in docker: 2ways.
create a image from container, add all the libraries and binaries in it and then commit it in order to create an image.  
Before we create our own image, we might want to inspect all the changes we made.  
Try typing the command docker container diff <container ID> for the container you just created.  
You should see a list of all the files that were added or changed to in the container when you installed figlet.  
Docker keeps track of all of this information for us. This is part of the layer concept we will explore in a few minutes.
we can create a container, add all the libraries and binaries in it and then commit it in order to create an image.  
We can then use that image just as we would for images pulled down from the Docker Store.
create image using dockerfile: We created two files: our application code (index.js) is a simple bit of javascript code  
that prints out a message. And the Dockerfile is the instructions for Docker engine to create our custom container.  
The final result is essentially the same, but with a Dockerfile we are supplying the instructions for building the image,  
rather than just the raw binary files. This is useful because it becomes much easier to manage changes,  
especially as your images get bigger and more complex.
For example, if a new version of figlet is released we would either have to re-create our image from scratch,  
or run our image and upgrade the installed version of figlet.  
In contrast, a Dockerfile would include the apt-get commands we used to install figlet so that we  
- or anybody using the Dockerfile - could simply recompose the image using those instructions.
what is image layers and how to use inspect command to inspect particular details about the image.  
There is something else interesting about the images we build with Docker.  
When running they appear to be a single OS and application. But the images themselves are actually built in layers.  
What if we get a container from Docker Store or another registry and  
want to know a bit about what is inside the container we are consuming?  
Docker has an inspect command for images and it returns details on the container image, the commands it runs, the OS and more.

-Video: VMs Versus Containers Deep Dive(https://www.youtube.com/watch?v=PoiXuVnSxfE)(10min)  
the differences between virtual machine and containers:size, isolation and boot time.  
the size of virtual machine is bigger than the size of container.  
both virtual machine and container are extremely secured, the virtual machine is little securer than container.  
the boot time of virtual machine is much bigger than the boot time of containers.  

-Lab: Docker Networking(https://training.play-with-docker.com/docker-networking-hol/)(1hour15min)  
know about the basic knowledgement about the docker networks.  
how to use the command as well as all of the docker network sub-commands.  
The docker network inspect command is used to view network configuration details.  
These details include; name, ID, driver, IPAM driver, subnet info, connected containers, and more.  
The bridge network is the default network for new containers.  
This means that unless you specify a different network, all new containers will be connected to the bridge network.  
how to initialize a swarm and how to create an overlay network.  
create a server through the overlay network and how to test it.  
clean up the service we created, the containers we started, and finally disable Swarm mode.  

-Lab: Swarm Mode Introduction(https://training.play-with-docker.com/ops-s1-swarm-intro/)(1hour)  
Swarm Mode tells Docker that you will be running many Docker engines and you want to coordinate operations across all of them.  
nitializing Docker Swarm Mode is easy. docker swarm init --advertise-addr $(hostname -i)  
A stack is a group of services that are deployed together:   
multiple containerized components of an application that run in separate instances.  
You could edit files and change the specs if you wanted to make the scale size more permanent.  
docker service scale voting_stack_vote=5  
the number of replicas for the vote service increase to 5 and in a few seconds Swarm will have all of them running.   

-Video: Kubernetes vs Swarm(https://www.youtube.com/watch?v=L8xuFG49Fac)(4min)  
docker swarm: enable user to run a container on a cluster.  
orchestration system manage your container in production.
Kubernetes is an open-source system for docker.  
competition between docker swarm and kubernetes:  
two reasons Kubernetes is better than Swarm: kubernetes is a good way to learn how to use orchestration.  
kubernetes has far more features and is more wildly used

-Video: Kubernetes in 5 Minutes(https://www.youtube.com/watch?v=PH-2FfFD2PU)(5min)  
kubernets cluster services: specific configuration and cluster services will run the configuration in infrastructure.  
worker: is a container host, run cubelet process which is respensible for communicating with the cluster services.  
yaml file: a pod configuration, in a pod can have running containers.  
the cluster services will figure out how to schdule the pods in the environment.  

-Kubernetes(https://kubernetes.io/)(30min)
Kubernetes is an open-source system for automating deployment, scaling, and management of containerized applications.  
Kubernetes Features:
Service discovery and load balancing: No need to modify your application to use an unfamiliar service discovery mechanism.  
Kubernetes gives containers their own IP addresses and   
a single DNS name for a set of containers, and can load-balance across them.  
Automatic binpacking: Automatically places containers based on their resource requirements and other constraints,  
while not sacrificing availability. Mix critical and best-effort workloads in order to drive up utilization  
and save even more resources.  
Storage orchestration: Automatically mount the storage system of your choice,  
whether from local storage, a public cloud provider such as GCP or AWS,  
or a network storage system such as NFS, iSCSI, Gluster, Ceph, Cinder, or Flocker.
Self-healing: Restarts containers that fail, replaces and reschedules containers when nodes die,   
kills containers that don’t respond to your user-defined health check,  
and doesn’t advertise them to clients until they are ready to serve.
Automated rollouts and rollbacks: Kubernetes progressively rolls out changes to  
your application or its configuration, while monitoring application health to   
ensure it doesn’t kill all your instances at the same time. If something goes wrong, Kubernetes  
will rollback the change for you. Take advantage of a growing ecosystem of deployment solutions.
Secret and configuration management: Deploy and update secrets and application configuration   
without rebuilding your image and without exposing secrets in your stack configuration.
Batch execution: In addition to services, Kubernetes can manage your batch   
and CI workloads, replacing containers that fail, if desired.
Horizontal scaling: Scale your application up and down with a simple command,  
with a UI, or automatically based on CPU usage.

## Big Data and Machine Learning
> Include notes here about each of the links  
  
-Video: Hadoop Intro(https://www.youtube.com/watch?v=jKCj4BxGTi8&feature=youtu.be)   
After 2000, data grew quickly, data process needs large memory and fast processors.  
possible solution for growing data: multiple machine(distributed system), challenges of distributed system  
high chances of system failures, limit bandwith, high programming complexity.  
Hadoop: allows for distributed processing of large data sets across clusters of commodity computers.  
four features of hadoop: economical, reliable, scalable and flexible.  

-QwikLab: Analyze Big Data with Hadoop(https://awseducate.qwiklabs.com/focuses/19?parent=catalog)   
know how to use and create an Amazon S3 bucket  
know how to launch an Amazon EMR cluster  


