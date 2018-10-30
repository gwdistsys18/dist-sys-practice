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

Lab: Docker Networking  -- 220min

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

# Lab02: Docker Intro

## Single task container
This could be a shell script or a custom app.  

For example `$ docker container run alpine hostname` will run an alpine container and output its hostname. Then the container will exit as long as the command `hostname` executed successfully.  

Containers which do one task and then exit can be very useful. You could build a Docker image that executes a script to configure something. Anyone can execute that task just by running the container - they don’t need the actual scripts or configuration information.

## Interactive container
This connects you to the container similar to the way you SSH into a remote server.  

Using command `$ docker container run -i -t --rm ubuntu bash` to run a container and access its shell. In this command, we give the `docker run` three parameters. 
> `-i` tells the container you want an interactive session.  
> `-t` tells the container to allocate a pseudo-tty.  
> `--rm` tells the docker host to remove the container when it's done executing.  

And bash will be the first process the container runs (PID 1).  

run command `cat /etc/issue` in the container to see the distribution of Linux inside the container.  

Run `exit` to leave the shell session and exit the container. Then run `cat /etc/issue` outside the container (in the docker host VM) to check the distribution of Linux of the docker host VM.  

You will find the distribution of Linux inside the container does not need to match the distribution of Linux running on the Docker host.  

But, notice **you can only run a Linux container on a Docker host with a Linux kernel.** For example, Linux containers cannot run directly on Windows Docker hosts. Also, a Windows container needs to run on a Docker host with a Windows kernel.

> You can commit a container to make an image from it - but you should avoid that wherever possible. It’s much better to use a repeatable Dockerfile to build your image.


## Background container
For long-running services like websites and databases.  
  
Run `docker run --detach --name MyDB -e MYSQL_ROOT_PASSWORD=secretpass mysql:latest` to start up a MySQL container runs in the background. We give three parameters to the `docker run` command:  
> `--detach` will run the container in the background.  
> `--name MyDB` will name the container as "MyDB".  
> `-e` will use an environment variable to specify the root password.  

Run `docker container ls` you can see that the MySQL container is running in the background.  

You can check what happened to your docker containers by running the built-in command `docker container logs [CONTAINERID or NAME]` and check what processes are running inside a container by running `docker container top [CONTAINERID or NAME]`  

> **Notice: Network traffic cannot reach containers from the host unless ports are explicitly published!**

You can use `docker exec` or `docker container exec` to run a command inside a specific container.  

Run  
`docker container exec -i -t [CONTAINERID or NAME] mysql --user=root --password=$MYSQL_ROOT_PASSWORD --version`   
or   
`docker container -i -t exec [CONTAINERID or NAME] sh`  
to access an interactive shell inside the container and then run  
`mysql --user=root --password=$MYSQL_ROOT_PASSWORD --version`  
to check the MySQL version.

Run `exit` to leave the interactive shell session.

## Package and run a custom app using Docker

### Dockerfile 
```
 FROM nginx:latest

 COPY index.html /usr/share/nginx/html
 COPY linux.png /usr/share/nginx/html

 EXPOSE 80 443     

 CMD ["nginx", "-g", "daemon off;"]
```

> FROM specifies the base image of the new image, the starting point.  
COPY indicates files that need to be copied from the docker host to the new image.  
EXPOSE defines what ports the application uses.  
CMD specifies what command to run when a container is started from the image.

### Build an image from a dockerfile
`docker image build` helps to build a new image. use `--tag` to define the name of the image. `.` tells docker to use the current directory as the build context.  

`docker image build --tag <DOCKERID>/[IMAGE CUSTOM NAME]:[TAG] .`  
**For example:** `docker image build --tag perryapple/linux_tweet_app:1.0 .`  

> **Notice: the image name can only have lowercase letters and digits!**

### Publish port
Use `--publish host_port:container_port` to map a host's port and a container's port when creating a container. Messages to the host's port will be relayed to the container's port. Vice versa.  

### gracefully and ungracefully stop of a container
`docker container rm --force CONTAINERID` will ungracefully shut down and remove a container permanently.  

However, `docker container stop` or `docker container kill` will gracefully stop a container and leave it on the host. Use `docker container rm` to remove it permanently.

## Modify a running website
### bind mount
Use `--mount` flag to mount the current directory on the host into a target file inside the container when running a `docker container run` command. `--mount` is followed with several K-V pairs separated by ",". For example: `--mount type=bind,src="$(pwd)",target=/usr/share/nginx/html`.  
> `type` can be `bind`,`volume`,`tmpfs`.  
`source` is the path to the file or directory on the Docker daemon host. May be specified as `source` or `src`. `$(pwd)` represents the current path.  
`destination` takes as its value the path where the file or directory is mounted in the container. May be specified as `destination`, `dst`, or `target`.  

When you use a bind mount, a file or directory on the host machine is mounted into a container running on the same host. Any changes made to the local file system are immediately reflected in the running container.  


Although you may modify some files in the local filesystem and it reflected in the running container. Or modified some file directly in the running container. You’ve not actually changed the Docker image that the container was started from.

## Update the image
To persist the changes you made to the running container into the image, you need to build a new version of the image. When you run `docker image build` again, docker will only modify the portion of the image that changed.  

> `docker image ls` will list all images in the docker host.  

We can run version 1.0 and 2.0 at the same time. But, two containers cannot map to the same port on a single Docker host. And each container should have a unique container name.

## Push images
`docker image ls -f reference="$DOCKERID/*"`. `-f` applies a filter to the output based on conditions provided. This command will list the images stored in your local repository.  

Docker Hub is the default public registry for Docker images.

Steps to push images:
1. Login to the Docker Hub  
`docker login`
2. Push an image  
`docker image push [IMAGE PATH]:[TAG]`  
(`docker image push $DOCKERID/linux_tweet_app:1.0`)

# Lab03: Doing More With Docker Images
## Commit containers
If you modified and configured a container and want to share it with others. You can simply **commit** that container to create an image. `commit` will create a new image locally, so you need to `push` it to the Docker registry.  

Steps to commit a container
1. `docker container ls -a`. List all containers in your host and find the container id which you want to commit.
2. `docker container commit [CONTAINERID]` to commit a specific container.
3. `docker image ls` to list all images in your local host and the image you just create from a container has the repository and the tag "<none>".
4. `docker image tag [IMAGEID] [REPOSITORYNAME]` to assign a name to the image you just created with image id you get from the previous step.

> You can use `docker container diff [CONTAINERID]` to see the difference between the current container files and its original files.

## Create images from Dockerfile
Dockerfile can make the management of changes easier, especially when the image gets bigger and more complex. Dockerfile allows us to manage how an image is created, rather than the binaries. And Dockerfile is just a simple text file. So, almost any version control system can be used to manage Dockerfiles over time.

Steps to create an image from a dockerfile:
1. Create a dockerfile
2. Edit the dockerfile, add files and dependencies you need in your image.
3. Built the image by using `docker image build -t [IMAGENAME]:[TAG]`.

For more information about Dockerfile, see Lab02.

## Image Layers

Use `docker image history [IMAGEID]` to check the list of intermediate container images that were built along the way to creating the final image. The concept of the layer is very important, It means When we make a change to our application, it may only affect a single layer!  

When we build a new image with some layers we used before, those layers may in the cache. If Docker recognized that some layer of the building image is in the cache, it will simply use a cached version of those layers instead of pulling it again from the Docker store.

## Image Inspection
If we have an image and want to know some details of it, we can use `docker image inspect [IMAGENAME]` to get details of an image. Information in an image may include: 
> the layers the image is composed of  
the driver used to store the layers  
the architecture / OS it has been created for  
metadata of the image  
.....

The image information is in JSON format, we can use filters to inspect particular details we want to check.   
For example: `docker image inspect --format "{{ json .RootFS.Layers}}" alpine`  to see all the layers in a image.  

All the layers are immutable. New layers in a new image will keep track of the changes from the layer below. And we you run a container, there will be a layer to keep track of all the changes that happen as the application runs. This helps us to easily find mistakes and revert back to the original state. The base layers cannot be changed.  

Containers can store their data persistently in a special kind of Docker object called a **Volume**.

## Terminology
**Layers** - A Docker image is built up from a series of layers. Each layer represents an instruction in the image’s Dockerfile. Each layer except the last one is read-only.  

**Dockerfile** - A text file that contains all the commands, in order, needed to build a given image. The Dockerfile reference page lists the various commands and format details for Dockerfiles.  

**Volumes** - A special Docker container layer that allows data to persist and be shared separately from the container itself. Think of volumes as a way to abstract and manage your persistent data separately from the application itself.

# Lab04: Docker Networking 

## The Docker network command
### --help

The `docker network` command is the main command for configuring and managing container networks. You will see all of the docker network subcommands after you run this command. The subcommand includes create new networks, list all existing networks, inspect a network, remove some networks, and connect or disconnect to another container.  

### List networks

`docker network ls` will list all existing container networks on the current Docker host.  each network gets a unique `ID` and `NAME`. Each network is also associated with a single driver. You can use `ID` or `NAME` to identify a network.  

### Inspect a network

The `docker network inspect` command is used to view network configuration details. These details include; name, ID, driver, IPAM driver, subnet info, connected containers, and more.  

The syntax of this command is `docker network inspect [NETWORK]`. You can use both network id or network name to identify a network.

### List network driver plugins
The `docker info` will display a lot of information about a Docker installation including the network driver plugins.  

You can find the network plugins under the `Plugins: Network:` section.

## Bridge Networking
### Basic
Every Docker host has a pre-built network called **bridge** The bridge network is associated with the bridge driver. Although they have the same name they are not the same. The locally scoped network only exists on this Docker host.  

All networks created with the bridge driver are based on a Linux bridge.

### Connect a container
The bridge network is the **default** network for all new containers.  

Steps to connect a container to the bridge network: 
1. Run a new container `docker run -dt ubuntu sleep infinity`. This command will run a new ubuntu container in the background and make it sleep forever. As no network was specified on the `docker run` command, the container will be added to the *bridge* network.  
2. Run `docker ps` to see the details of all running containers.
3. Run `docker network inspect bridge` to check the detail of the bridge network. The information of container connected to the bridge network can be found under the `Containers` section.

### Test network connectivity
The IP address of containers can be found in the output of `docker network inspect [NETWORK]` command. Run `ping -c5 [IPv4 Address]` to send packets to the container. 
> `ping -c5 [Address]` will send 5 packets to the destination.
  
  
The result shows that the Docker host can ping the container over the bridge host. And the container can also connect to the outside world via bridge network.

### Configure NAT for external connectivity
NAT stands for **"Network Address Translation"**  

To map the host port 8080 to the container port 80 for a nginx container, use the command `docker run --name web1 -d --publish 8080::80 nginx`.  
> `--publish [host prot]:[container port]` will map the host port to the container port.

> If you start a new container from the official NGINX image without specifying a command to run, the container will run a basic web server on port 80.  

Review the container status and port mappings by running `docker ps`. port mapping -`0.0.0.0:8080->80/tcp` is shown. That means all messages sent to the host port 8080 will be sent to the container port 80 by the host.

## Overlay Networking
### Swarm
Swarm is a cluster of Docker Engines. Docker has a built-in tool called *swarm mode* to manage swarms.  

To initialize a docker swarm, run `docker swarm init [OPTIONS]`. For example: `docker swarm init --advertise-addr $(hostname -i)` to initialize a swarm manage node listening to the IP address returned by the $(hostname -i).  

A docker node can join the swarm by running `docker swarm join`. There are two kinds of nodes, the worker and the manager. A node can join to the swarm as worker or manager based on the token it passes to `docker swarm join`. The token can be displayed by using `docker swarm joint-token [NODE TYPE]`. The NODE TYPE can be "worker" or "manager".  

Run `docker node ls` to list all nodes in the swarm. **NOTE: Basically, all command of the swarm needs to be run in the manager nodes.**

### Create an overlay network.
`docker network creates -d overlay overnet` will create an overlay network named "overnet". The parameter `-d` specified the type of the network to create. Could be "bridge" or "overlay".  

Use `docker network ls` to list all networks in the docker host.  
> Network `ingress` and `docker_gwbridge` were created automatically when the Swarm cluster was created.  

The `overnet` network is not created in other nodes in the swarm cluster because **Docker only extends overlay networks to hosts when they are needed**.

### Create a service
`docker service` is a command to manage services.  

Run `docker service create [OPTIONS] IMAGE [COMMAND] [ARG...]` to create services. For example `docker service create --name myservice --network overnet --replicas 2 ubuntu sleep infinity` to create 2 tasks based on image Ubuntu using network “overnet” and "myservice" as the service's name.  
> `--name` Service name  
`--network` Network attachments.  
`--replicas` Number of tasks  
For more OPTIONS of `docker service create` command see <a href="https://docs.docker.com/engine/reference/commandline/service_create/#usage"> Docker docs. </a>  

   
Run `docker service ls` in the manager node to list all services currently runs.  

Run `docker service ps [Service ID]` in the manager node to list the tasks of one or more services. Filtering and formatting can be applied to this command.  
> `$ docker service ps -f "node=manager1" redis`  
`$ docker service ps --format "{{.Name}}: {{.Image}}" top`

`docker network inspect` will show detailed information about a network and only details of services/tasks which are running on the local host will be shown.  

Nodes in the same swarm cluster can communicate with each other through the network.

### Service VIP
Run `ping -c5 [service name]` inside a bash can ping a service by its name. The return IP address is the service's virtual IP address.  

Run `docker service inspect [Service name]` will see details of the service. The virtual IP address is listed at the bottom.

### Clean up  
`docker service rm [Service name]` can remove services.  

Run `docker swarm leave --force` in a swarm node to leave the swarm.
