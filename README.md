# Docker
## Time spend
### Beginner level
Video: Why Docker? -- 50 min  
Lab: DevOps Docker Beginners Guide -- 180 min
### Intermediate Level
Video: What are Containers? -- 100 min  
Video: VMs Versus Containers -- 90min  
Lab: Docker Intro -- 200min  
Lab: Doing more with Docker Images -- 200min  
Video: VMs Versus Containers Deep Dive -- 60 min  

Lab: Docker Networking

[TOC]

# What is Docker and Why we use Docker

## Timeline
**1. Mainframe to PC (the 90's)**  
  Change from traditional mainframe architecture to a PC distributed architecture.
  
**2. Baremetal to Virtual (the 00's)**  
Datacenter and server shifted to virtualization for better utilization. Create lots of OSes inside a single piece of hardware.  

**3. Datacenter to cloud (the 10's)**  
Amazon AWS solution. Start up and shut down quickly from a website.  

**4. Host to container [Serverless] (now)**  
Including serverless or functions as a service.  

The container is lighter than a virtual machine. It does not have its own kernel and virtual hardware.
## Why we need Docker?
**It is all about speed!**  
> Develop Faster  
Build Faster  
Test Faster  
Deploy Faster  
Update Faster  
Recover Faster
  
Without containers, we may have a lot of different types of applications to manage, like front-end, back-end or middle tier. They may have their own dependencies, requirements or even run in the different OS or cloud. Which will make the development and maintenance of the software become complicated.  
  
Containers provide a consistent environment for development, testing and running. You can package and distribute the software regardless of the OS or the environment.  
  
No code change is needed when shift to docker and docker will help to save hardware resources. You don't need to use many different kinds of OSes for different applications.

## Different between Containers and VMs
The VM is *hardware* abstraction: it runs above physical CPU and RAM of the host. An entire OS runs inside a VM. Typically, it will take more time to start up and more space than containers.  
  
A container is an *application* abstraction: Containers are lighter and easier to set up. Take less time to start up and less space. So more containers can be run in a host than VMs.

# Lab01: DevOps Docker Beginners Guide

## 1.0 Run a container
```
docker container run hello-world
```

To run this docker container, docker took the following steps:
1. Find the image file in the local machine.
2. If the requested docker image file does not exist in the local machine, Docker will try to download it from the docker shop (AKA docker hub).
3. The docker daemon finds the image file in the docker hub and pulls it.
4. The docker daemon created a new container from that image and runs it.
  
> To pull an image file from the docker hub, you can run this: `docker image pull library/hello-world` ("library/" can be omitted).


## 1.1 Docker Images
We are going to run an **Alpine Linux** container in this section to get familiar with the concept "Docker images".  
  
`docker image pull alpine` Run this to pull alpine from the Docker hub.  
  
`docker image ls` Run this to see all images on your system.

### docker image pull
The syntax of **docker pull** : `docker image pull [OPTIONS] NAME[:TAG|@DIGEST]`    

For more information, please run `docker image pull --help` in your termination.  

`docker image pull` can be replaced by the command `docker pull`.

### docker image ls
This is a command which can list all images in your local machine.  

The syntax of **docker image ls** : `docker image ls [OPTIONS] [REPOSITORY[:TAG]]`    

This will list repository name, its tag, image id, created time and its size. 

## 1.2 Docker container run
Run the container based on the image you downloaded at section 1.1. To run the container you are going to use the `docker container run` command.  
 
 `docker container run alpine ls -l`
   
 This command will start a new Docker container. The syntax of **docker container run** : `docker container run [OPTIONS] IMAGENAME [COMMAND] [ARGS...]`  
   
 `docker container run` can be replaced by `docker run`. They have the same syntax.
   
   Here is what happens after you call `docker container run alpine ls -l`:
   1. The docker client finds the image, create the container and then run it.
   2. provide the command `ls -l` to the container which runs the Alpine Linux.
   3. The container executed the command `ls -l` which gave what you saw on the screen.
   4. After the `ls -l` command finished, the container was shut down.
   
**It is very important to know that the containers will not be deleted after exited.** The container instance will be saved in your local machine. To see all **RUNNING** containers you are going to use the `docker container ls` command. But notice, this command only shows the running containers. To see all containers including the exited ones, you can use `docker container ls -a` or `docker container ls --all`.  
  
If you want to end a container which is currently running, use the command `docker container kill [CONTAINERID]`  
  
If you want to delete a container instance, use the command `docker container rm [CONTAINERID]`.

## 1.3 Container Isolation
Docker isolates every container instance because of the critical security concept. Even though each docker `container run` command used the same alpine image, each execution was a separate, **isolated** container. Each container has a **separate filesystem** and runs in a **different namespace**; by default, a container has **no way of interacting with other containers**.  

Example:  
Run the following commands: 

```
$ docker run -i -t alpine /bin/ash
    /# echo "hello world" > hello.txt
    /# ls
    /# exit
$ docker run alpine ls -l
```
Now you can find that the hello.txt is missing in the output of `docker run alpine ls -l`. This is isolation! This command creates a new separated container instance. These two container instances we created in the above commands have totally separated and isolated file system and namespace. So, you will not see the "hello.txt" file in the second alpine Linux container file system.

## 1.4 Back to the container we created before

The following commands help us find the container which has the "hello.txt" file and help us restart and run commands inside it.

```
$ docker container ls -a
$ docker container start [CONTAINERID]
$ docker container ls
```
By using command `docker container ls` we can see that the container started by `docker container start [CONTAINERID]` is still running. We run /bin/ash earlier in this container, this time the ash waits for a command. We can send a command by using the `docker container exec` command. 

`$ docker container exec [CONTAINERID] [COMMAND]`  

by sending `ls` to the container we created the "hello.txt" file before, we can see the "hello.txt" file is listed in the output.  

> **Tip**:  Instead of using the full container ID you can use just the first few characters, as long as they are enough to uniquely ID a container. 

## 1.5 Terms

### Images
The file system and configuration of our application which is used to create containers. To find out more about a Docker image,   
### Containers
Running instances of Docker images — containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers and runs as an isolated process in user space on the host OS. 
### Docker daemon 
The background service running on the host that manages the building, running and distributing Docker containers.
### Docker client 
The command line tool that allows the user to interact with the Docker daemon.
### Docker store
The store is, among other things, a registry of Docker images.


# What are containers?
## runtime notion of a container
A sandbox which has its own namespace, cgroups to make a certain degree of isolation. A process running in a container will be isolated by the sandbox and only see other process runs in the same container.   

The container process is completely tied in with the lifecycle of the container itself. When a container is started up, a container process is started and when the container process exits, the container ends.

## Image
A binary representation, a bunch of bits on a filesystem somewhere. An image is defined as a parent-child relationship which means the image is a sort of tree structure with several levels of hierarchy. The root of all image is called scratch which is basically an empty filesystem. On top of scratch, we may have other filesystems like the backbone of the operating system. And on top of that, there are other functional parts. This is the image hierarchy.  
  
Advantages:  
1. You can share images. Anytime you want to run an application, you only need to pull a branch of the image tree. While the node of this branch can be shared by other applications.
2.  It allows you to concentrate specific things in specific places and know where they are. For example, if you change a node of the image tree, all other nodes built on top of that node will be impacted. The change will be inherited by everything above the node because of the tree structure.

## Dockerfile

The file that is used to build a Docker image. It is a text file start with "FROM:". "FROM" is the parent image where this docker file is inheriting from. And then will be some lines to configure the image that this dockerfile is going to create.  

**We use dockerfile and docker build to create a Docker image, and use the docker image to instantiate a docker container.** We can also build a Docker image from a container. When we run a container, we may install and modify something in that container and then we can commit that container as an image and from that image create more containers.

## Tied up all these things
### Docker registry
A thing that contains all images. You can pull from or push to the registry.
### Image cache
A cache inside the docker host. When you do a pull from the docker registry, docker will check how many parts of the image you request already exist in the cache. And then only download those part you don't have yet. Similarly, when you push an image to the docker registry, the docker only push what is needed to push.
### docker client
The client talks to the daemon. help the user to manipulate docker host and configure the infrastructure inside the docker host such as network, storage and so on.
### docker daemon
Expose APIs to the client to make the client able to manipulate docker host.
### Volume
A persistent area of storage inside the docker host to persist all data beyond the lifecycle of the container.

# Virtual Machine vs. Container

## VM
![Virtual Machine Architecture](https://github.com/PerryApple/dist-sys-practice/blob/master/VM.jpg?raw=true)

This is the architecture of the virtual machine. Between the virtual machine operating system and the physical infrastructure, there is a hypervisor and virtual machine interface. 

### Virtual machine
The OS which is running inside the virtual machine talks to a virtual hardware layer. The virtual machine provides a limited number of NICs, storage and other resources to the operating system. This makes the guest OS pretty simple.  
  
Also, you can size your virtual machine depending on the application workload and how big the guest OS is. You don't need to use all the resources provided by the physical infrastructure.

### Hypervisor
It is responsible for interacting with all different types of **NICs** from all different types of hardware. As well as the **storage, agents that monitor physical hardware, and kernel modules**.

## Container
![container](https://github.com/PerryApple/dist-sys-practice/blob/master/Container.jpg?raw=true)
The docker engine is loaded in the OS. One big benefit of containers is it can pack up dependencies the application needs from the OS in one container. The OS which runs containers is simple, because of all OS dependencies are packed up in the Docker container. Unlike the VM, you don't need to install and config all dependencies the application needs in the operating system. Moreover, only one basic OS is needed, and you can run all sorts of containers above it. This saves a lot of resources.

## Combination of VM and container
![VM&Container](https://github.com/PerryApple/dist-sys-practice/blob/master/VM&Container.jpg?raw=true)
Load the hypervisor technology into the basic operating system. By doing this, the basic OS will see all resources provided by the physical infrastructure. A better strategy is having a hypervisor and virtual machine between the physical infrastructure and the basic operating system. The docker host operating system (AKA the basic OS) will interact with the virtual machine level and the hypervisor will mask all the other hardware the OS not needed.
