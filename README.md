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




### Lab: docker image

#### Image creation from a container
Let’s start by running an interactive shell in a ubuntu container:
```
docker container run -ti ubuntu bash
```
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


### Swarm Mode Introduction for IT Pros

#### Docker Compose and Docker Swarm Mode
* Compose is used to control multiple containers on a single system. Much like the Dockerfile we looked at to build an image, there is a text file that describes the application: which images to use, how many instances, the network connections, etc. But Compose only runs on a single system so while it is useful, we are going to skip Compose1 and go straight to Docker Swarm Mode.

* Swarm Mode tells Docker that you will be running many Docker engines and you want to coordinate operations across all of them. Swarm mode combines the ability to not only define the application architecture, like Compose, but to define and maintain high availability levels, scaling, load balancing, and more. With all this functionality, Swarm mode is used more often in production environments than it’s more simplistic cousin, Compose.





## Area 2
> Include notes here about each of the links