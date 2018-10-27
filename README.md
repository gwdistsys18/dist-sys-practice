# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Docker and Containers
### What is container
A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. Each container can have its own distribution but must share the same host kernel.

### Difference between containers and VM
One of the characteristics of a virtual machine is that it provides complete isolation in terms of having its own processes, networking, users, etc., which are separate from the host system and other guest systems that may be running alongside it and not visible on the host system or vice-versa. Furthermore, virtual machines can be built to whatever specification is desired with packages pre-installed and configured, of any number of operating systems and operating system vender variants and saved as an image.

How containers differ from virtual machines is that a guest operating system is not installed, and usually consists only the application code and when run, only run the necessary process(es) that one uses the container for. This is because containers are made possible using kernel features of the host operating system and layered file system instead of the aforementioned emulation layer required to run virtual machines. How containers are similar to virtual machines is that they also are stored as images, though a big difference is that container images are much smaller and more portable and feasible to use than virtual machine images for the aforementioned reasons of not requiring an operating system installation as part of the image.

<img src="https://github.com/zhuo95/dist-sys-practice/blob/master/VM_contianer.png">

#### advantages of containers
* Platform independence: Build it once, run it anywhere
* Effective isolation and resource sharing: containers run on the same server and use the same resources, they do not interact with each other
* Docker instances are lighter-weight
* Offer the possibility of horizontal scaling
* Containers are ultra-consistent



### What is docker
Docker is all about speed. if you don't have containers today, you need to deal with multiple types of applications which may have their own dependencies. Then you need to run them on developer machines and production. It's so complicated.

Containers allow you to package same way, run and test same way regardless of OS and setups.

A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

### Docker Architecture
##### Clent
You could describe Docker as a client server application. The daemon is the server, and the CLI is 1 of many clients. There’s also a number of third party clients.

##### Docker Host
- Docker deamon
    
The Docker daemon is a service that runs on your host operating system. It currently only runs on Linux because it depends on a number of Linux kernel features, but there are a few ways to run Docker on MacOS and Windows too.


The Docker daemon itself exposes a REST API. From here, a number of different tools can talk to the daemon through this API.


- Containers

A container is a runtime instance of an image--what the image becomes in memory when executed (that is, an image with state, or a user process). 

- Images

An image is an executable package that includes everything needed to run an application--the code, a runtime, libraries, environment variables, and configuration files.

<img src="https://github.com/zhuo95/dist-sys-practice/blob/master/architecture.png">

##### Registry
A place to find and download Docker images.

### Docker Command Line
|command      | function
|-------------|----------------
|docker pull  |get images
|docker build | build images
|docker images| list all images
|docker run   | run container
|docker ps    |list all running containers
|docker container exec |allows you to run a command inside a container.




### Docker image

#### Image creation from a container
Let’s start by running an interactive shell in a ubuntu container:
```
docker container run -ti ubuntu bash
```
<font color="#CC3A5C">-t</font>: Allocate a pseudo-TTY

<font color="#CC3A5C">-i</font>: Keep STDIN open even if not attached

start a stopped container: ```docker container start ```, stop a running container: ```docker container stop```, get into a container: ```docker attach id ``` or ```docker exec -it id bash```(exit will not make container stop) 

for a real world application where you had just installed several packages and run through a number of configuration steps the process could get cumbersome and become quite error prone. Instead, it would be easier to create an image you can share with your team.

To start, we need to get the ID of this container using the ls command (do not forget the -a option as the non running container are not returned by the ls command).
```
docker container ls -a
```
Before we create our own image, we might want to inspect all the changes we made. Try typing the command
```
docker container diff <container ID> 
```
for the container you just created. You should see a list of all the files that were added or changed to in the container when you installed figlet. Docker keeps track of all of this information for us. This is part of the layer concept we will explore in a few minutes.

Now, to create an image we need to “commit” this container. Commit creates an image locally on the system running the Docker engine. Run the following command, using the container ID you retrieved, in order to commit the container and create an image out of it.

```
docker container commit CONTAINER_ID
```
That’s it - you have created your first image! Once it has been commited, we can see the newly created image in the list of available images.

```
docker image ls
```
you will see like this:
```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
<none>              <none>              a104f9ae9c37        46 seconds ago      160MB
ubuntu              latest              14f60031763d        4 days ago          120MB
```
<img src="https://github.com/zhuo95/dist-sys-practice/blob/master/image_creation.png">


#### Image creation using a Dockerfile

Instead of creating a static binary image, we can use a file called a Dockerfile to create an image. The final result is essentially the same, but with a Dockerfile we are supplying the instructions for building the image, rather than just the raw binary files. This is useful because it becomes much easier to manage changes, especially as your images get bigger and more complex.

Dockerfiles are powerful because they allow us to manage how an image is built, rather than just managing binaries.

We will use a simple example in this section and build a “hello world” application in Node.js.

creat a file called index.js
```
var os = require("os");
var hostname = os.hostname();
console.log("hello from " + hostname);
```
Create a file named Dockerfile and copy the following content into it
```
FROM alpine
RUN apk update && apk add nodejs
COPY . /app
WORKDIR /app
CMD ["node","index.js"]
```
##### docker file:
* FROM: specifies the base image to use as the starting point for this new image you’re creating. For this example we’re starting from nginx:latest.
* COPY: copies files from the Docker host into the image, at a known location. In this example, COPY is used to copy two files into the image: index.html. and a graphic that will be used on our webpage.
* EXPOSE: documents which ports the application uses.
* CMD: specifies what command to run when a container is started from the image. Notice that we can specify the command, as well as run-time arguments.

build our first image out of this Dockerfile and name it hello:v0.1:
```
docker image build -t hello:v0.1 .
```
We then start a container to check that our applications runs correctly:
```
docker container run hello:v0.1
```

### Docker networking

#### Network drivers

Docker’s networking subsystem is pluggable, using drivers. Several drivers exist by default, and provide core networking functionality:

- bridge : The default network driver. If you don’t specify a driver, this is the type of network you are creating. Bridge networks are usually used when your applications run in standalone containers that need to communicate.
- host: For standalone containers, remove network isolation between the container and the Docker host, and use the host’s networking directly. host is only available for swarm services.
- overlay: Overlay networks connect multiple Docker daemons together and enable swarm services to communicate with each other.
- macvlan: Macvlan networks allow you to assign a MAC address to a container, making it appear as a physical device on your network. The Docker daemon routes traffic to containers by their MAC addresses. Using the macvlan driver is sometimes the best choice when dealing with legacy applications that expect to be directly connected to the physical network, rather than routed through the Docker host’s network stack.
- none: For this container, disable all networking. Usually used in conjunction with a custom network driver. none is not available for swarm services.

#### bridge networks
In terms of Docker, a bridge network uses a software bridge which allows containers connected to the same bridge network to communicate, while providing isolation from containers which are not connected to that bridge network. 

Differences between user-defined bridges and the default bridge
- User-defined bridges provide better isolation and interoperability between containerized applications.
- User-defined bridges provide automatic DNS resolution between containers.
- Containers can be attached and detached from user-defined networks on the fly.
- Each user-defined network creates a configurable bridge.
- Linked containers on the default bridge network share environment variables.

##### Manage a user-defined bridge

Use the ```docker network create```  command to create a user-defined bridge network. Use the ```docker network rm```  command to remove a user-defined bridge network.
```
$ docker network create my-net
```

##### Connect a container to a user-defined bridge

When you create a new container, you can specify one or more ```--network ``` flags. This example connects a Nginx container to the my-net network. It also publishes port 80 in the container to port 8080 on the Docker host, so external clients can access that port. Any other container connected to the my-net network has access to all ports on the my-nginx container, and vice versa.

```
$ docker create --name my-nginx \
  --network my-net \
  --publish 8080:80 \
  nginx:latest
```

To connect a running container to an existing user-defined bridge, use the ```docker network connect ```  command.

```
$ docker network connect my-net my-nginx
```

If you do not specify a network using the ```--network flag```, and you do specify a network driver, your container is connected to the default bridge network by default. Containers connected to the default bridge network can communicate, but only by IP address, unless they are linked using the legacy ```--link```  flag.


##### Enable forwarding from Docker containers to the outside world
By default, traffic from containers connected to the default bridge network is not forwarded to the outside world. To enable forwarding, you need to change two settings. These are not Docker commands and they affect the Docker host’s kernel.

1.Configure the Linux kernel to allow IP forwarding.
```
$ sysctl net.ipv4.conf.all.forwarding=1
```

2.Change the policy for the iptables FORWARD policy from DROP to ACCEPT.
```
$ sudo iptables -P FORWARD ACCEPT
```

#### overlay networks
The overlay network driver creates a distributed network among multiple Docker daemon hosts. 


##### Create an overlay network
Create a new overlay network called “overnet” by running ```docker network create -d overlay overnet```. Use the docker network ls command to verify the network was created successfully. Use the ```docker network inspect <network> ``` command to view more detailed information about the “overnet” network. 

##### Create a service
Now that we have a Swarm initialized and an overlay network. it’s time to create a service that uses the network.
```
docker service create --name myservice \
--network overnet \
--replicas 2 \
ubuntu sleep infinity
```

#### access from outside

if you want to run some web applications in the container. To allow external access to these applications, port mapping can be specified with the <font color="#CC3A5C" >-p<font> parameters.

use ``` docker container ls ```  to see the mapping relations between host port and container port, you can use ``` ip:hostPort:containerPort ```  to assign the mapping address, for example ``` $ docker run -d -p 127.0.0.1:5000:5000 training/webapp python app.py ```



### Swarm Mode Introduction for IT Pros

#### Docker Compose and Docker Swarm Mode
* Compose is used to control multiple containers on a single system. Much like the Dockerfile we looked at to build an image, there is a text file that describes the application: which images to use, how many instances, the network connections, etc. But Compose only runs on a single system so while it is useful, we are going to skip Compose1 and go straight to Docker Swarm Mode.

* Swarm Mode tells Docker that you will be running many Docker engines and you want to coordinate operations across all of them. Swarm mode combines the ability to not only define the application architecture, like Compose, but to define and maintain high availability levels, scaling, load balancing, and more. With all this functionality, Swarm mode is used more often in production environments than it’s more simplistic cousin, Compose.

swarm:

A host running Docker can proactively initialize a Swarm cluster or join an existing Swarm cluster, so that the host running Docker becomes a node of a Swarm cluster. nodes can be classfied into manager node and worker node.

<img src="https://github.com/zhuo95/dist-sys-practice/blob/master/swarm.png">

- Task:

A task is the smallest unit in a Swarm, it's a container. 

- Service:

A Service is the collection of tasks, it defines the attributes of tasks, there are two modes of services. 

	- replicated services
	- global services

<img src="https://github.com/zhuo95/dist-sys-practice/blob/master/service.png">

Stack

A stack is the collection of services.stack file is a yaml file, it defines one or more services and the eviroment arguments, number of containers ...

<img src="https://github.com/zhuo95/dist-sys-practice/blob/master/service_stack_task.png">

#### initialize a new Swarm
```
docker swarm init --advertise-addr $(hostname -i)
```
Run a docker node ls to verify that both nodes are part of the Swarm. The ID and HOSTNAME values may be different in your lab. The important thing to check is that both nodes have joined the Swarm and are ready and active.

To add a worker to this swarm, run the following command:
```
docker swarm join --token
```
#### Show Swarm Members
```
docker node ls
```









## Area 2
> Include notes here about each of the links