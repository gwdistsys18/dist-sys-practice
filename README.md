# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1
# Docker
## Time spend
### Beginner level
Video: Why Docker? -- 50 min
Lab: DevOps Docker Beginners Guide -- 180 min
### Intermediate Level
Video: What are Containers? -- 100 min



# What is Docker and Why we use Docker

## Time line
**1. Mainframe to PC (90's)**  
  Change from traditional mainframe architecture to a PC distributed architecture.
  
**2. Baremetal to Virtual (00's)**  
Datacenter and server shifted to virtualization for better utilization. Create lots of OSes inside a single piece of hardware.  

**3. Datacenter to cloud (10's)**  
Amazon AWS solution. Start up and shut down quickly from a website.  

**4. Host to container [Serverless] (now)**  
Including serverless or functions as a service.  

Container is lighter than a vertual machine. It does not have its own kernal and virtual hardware.
## Why we need Docker?
**It is all about speed!**  
> Develop Faster  
Build Faster  
Test Faster  
Deploy Faster  
Update Faster  
Recover Faster
  
Without containers, we may have a lot of different types of applications to manage, like front-end, back-end or middle tier. They may have their own dependencies, requirements or enven run in the different OS or cloud. Which will make the development and maintenance of the software become complicated.  
  
Containers provides a consistent environment for development, testing and running. You can package and distribute the software regardless of the OS or the environment.  
  
No code change is needed when shift to docker and docker will help to save hardware resources. You don't need to use many different kinds of OSes for different applications.

## Different between Containers and VMs
The VM is *hardware* abstraction: it runs above physical CPU and RAM of the host. An entire OS runs inside a VM. Typically, it will take more time to start up and more space than containers.  
  
A container is an *application* abstraction: Containers are more lighter and easier to set up. Take less time to start up and less space. So more containers can be run in a host than VMs.

# Lab01: DevOps Docker Beginners Guide

## 1.0 Run a container
```
docker container run hello-world
```

To run this docker container, docker tooks the following steps:
1. Find the image file in the local machine.
2. If the requested docker image file does not exist in the local machine, Docker will try to download it from the docker shop (AKA docker hub).
3. The docker daemon find the image file in the docker hub and pull it.
4. The docker daemon created a new container from that image and runs it.
  
> To pull a image file from the docker hub, you can run this: `docker image pull library/hello-world` (library can be omitted).


## 1.1 Docker Images
We are going to run an **Alpine Linux** container in this section to get familiar with the concept "Docker images".  
  
`docker image pull alpine` Run this to pull alpine from the Docker hub.  
  
`docker image ls` Run this to see all images on your system.

#### docker image pull
Gramma of **docker pull** : `docker image pull [OPTIONS] NAME[:TAG|@DIGEST]`    

For more information, please run `docker image pull --help` in your termination.  

`docker image pull` can be replaced by the command `docker pull`.

#### docker image ls
This is a comman which can list all images in your local machine.  

Gramma of **docker image ls** : `docker image ls [OPTIONS] [REPOSITORY[:TAG]]`    

This will list repository name, its tag, image id, created time and its size. 

## 1.2 Docker container run
Run the container based on the image you dowloaded at section 1.1. To run the container you are going to use the `docker container run` command.  
 
 `docker container run alpine ls -l`
   
 This command will start a new docker container. Gramma of **docker container run** : `docker container run [OPTIONS] IMAGENAME [COMMAND] [ARGS...]`  
   
 `docker container run` can be replaced by `docker run`. They have the same gramma.
   
   Here is what happend after you call `docker container run alpine ls -l`:
   1. The docker client find the image, create the container and then run it.
   2. provide the command `ls -l` to the container which runs the alpine linux.
   3. The container executed the command `ls -l` which gave what you saw on the screen.
   4. After the `ls -l` command finished, the container was shutted down.
   
**It is very important to know that the containers will not be deleted after exited.** The container instance will be saved in your local machine. To see all **RUNNING** containers you are going to use the `docker container ls` command. But notice, this command only shows the running containers. To see all containers including the exited ones, you can use `docker container ls -a` or `docker container ls --all`.  
  
If you want to end a container which is currently running, use the command `docker container kill [CONTAINERID]`  
  
If you want to delete a container instance, use the command `docker container rm [CONTAINERID]`.

## 1.3 Container Isolation
Docker isolate every container instance because of the critical security concept. Even though each docker `container run` command used the same alpine image, each execution was a separate, **isolated** container. Each container has a **separate filesystem** and runs in a **different namespace**; by default a container has **no way of interacting with other containers**.  

Example:  
Run the following commands: 

```
$ docker run -i -t alpine /bin/ash
    /# echo "hello world" > hello.txt
    /# ls
    /# exit
$ docker run alpine ls -l
```
Now you can find that the hello.txt is missing in the output of `docker run alpin ls -l`. This is isolation! This command create a new seperated container instance. These two container instances we created in the above commands have totally seperated and isolated file system and name space. So, you will not see the "hello.txt" file in the second alpine Linux container file system.

## 1.4 Back to the container we created before

The following commands help us find the container which has the "hello.txt" file and help us restart and run commands inside it.

```
$ docker container ls -a
$ docker container start [CONTAINERID]
$ docker container ls
```
By using command `docker container ls` we can see that the contarner started by `docker container start [CONTAINERID]` is still running. We run /bin/ash earlier in this container, this time the ash waits for a command. We can send a commande by using the `docker container exec` command. 

`$ docker container exec [CONTAINERID] [COMMAND]`  

by sending ls to the container we created the "hello.txt" file before, we can see the "hello.txt" file is listed in the output.  

> **Tip**:  Instead of using the full container ID you can use just the first few characters, as long as they are enough to uniquely ID a container. 

## 1.5 Terms

### Images
The file system and configuration of our application which are used to create containers. To find out more about a Docker image,   
### Containers
Running instances of Docker images — containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers, and runs as an isolated process in user space on the host OS. 
### Docker daemon 
The background service running on the host that manages building, running and distributing Docker containers.
### Docker client 
The command line tool that allows the user to interact with the Docker daemon.
### Docker store
Store is, among other things, a registry of Docker images.


# What are containers?
## runtime notion of a container
A sandbox which has its own name space, cgroups to make certain degree of isolation. Process running in a container weill be isolated by the sandbox amd only see other process runs in the same container.   

The container process is completely tied in with the lifecycle of container itself. When a container is started up, a container process is started and when the container process exits, the container ends.

## Image
A binary representaton, a bunch of bits on a filesystem somewhere. Image is defined as a parent-child relationship which means the image is a sort of tree structure with several level of hierarchy. The root of all image is called scratch which is basically an empty filesystem. On top of scratch we may have orther filesystem like the backbone of operation system. And on top of that, there are other functional parts. This is the image hierarchy.  
  
Advantages:  
1. You can share images. Anytime you want to run an application, you only need to pull a branch of the image tree. While the node of this branch can be shared by other applications.
2.  It allows you to concentrate specific things in specific palces and know where they are. For example, if you change a node of the image tree, all other nodes built on top of that node will be impacted. The change will be inherited by everything above the node because of the tree structure.

## Dockerfile

The file that is used to build an docker image. It is a text file start with "FROM:". "FROM" is the parent image where this docker file is inheriting from. And then will be some lines to configure the image that this dockerfile is going to create.  

**We usse dockerfile and docker build to create a docker image, and use the docker image to instantiate a docker container.** We can also build a docker image from a container. When we run a container, we may install and modify something in that container and then we can commit that container as an image and from that image create more containers.

## Tied up all these things
#### Docker registry
A thing that contains all images. You can pull from or push to the registry.
#### Image cach
A cach inside the docker host. When you do a pull from the docker registry, docker will check how many parts of the image you request is already exist in the cach. And then only download those part you don't have yet. Similarly, when you push an image to the docker rigistry, the docker only push what is needed to push.
#### docker client
The client talks to the daemon. help user to manipulate docker host and configure the infrastructure inside the docker host such as network, storage and so on.
#### docker daemon
Expose APIs to the client to make the client able to manipulate docker host.
#### Volume
A persistent area of storage inside the docker host to persist all data beyond the lifecycle of the container.

## Area 2
> Include notes here about each of the links
