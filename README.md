# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Docker and Containers
### Beginner Level

****

* [Video: Why Docker?](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)

Time: 20 min.

This video covers the whys and whats of how the Docker got started, what problems it solves and why should we be learning it.
Learning docker is really important, like the author said, containers are the nextonce-in-a-decade shift in infrastructure and process that make or break you.

**What is Docker:** 
Docker is a computer program that performs operating-system-level virtualization, also known as "containerization".

**Key points:**

1). Yet unlikes previous shifts, like mainframe to PC, Baremetal to virtual and Datacenter to cloud, Docker is focused on the migration experience. 

2). To answer why do we need docker and what is the real benefit, Docker is all about speed and covers the entire lifecycle of software managment.

3). Comtainers reduce the complexity. It allows us to package the same way regardless of our perating systems. It allows us to distribute the software regardless of the setup it. It allows us to run and test the software everywhere we are running it.

4). Docker is freeing up a lot of those rasks of the maintenance of stuff and allowing us to get more of our time to innovate. 

5). Docker is the core essence that you need to understand first but once you've moved beyond that you are probably need to use other tools for filling the gaps in your toolset.

****

* [Lab: DevOps Docker Beginners Guide](https://training.play-with-docker.com/ops-s1-hello/)

Time: 90min

In this lab we will run a popular, free, lightweight container and explore the basics of how containers work, how the Docker Engine executes and isolates containers from each other. 

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-26%2012.54.04.png?raw=true)

Concepts in this exercise:
*Docker engine, Containers & images, Image registries and Docker Store (AKA Docker Hub)* and *Container isolation.*

* *Images* - The file system and configuration of our application which are used to create containers. To find out more about a Docker image, run ```docker image inspect alpine```. 

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-26%2000.06.46.png?raw=true)

In the demo above, I used the ```docker image pull``` command to download the **alpine** image. When I executed the command ```docker container run hello-world```, it also did a ```docker image pull``` behind the scenes to download the **hello-world** image.

* *Containers* - Running instances of Docker images — containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers, and runs as an isolated process in user space on the host OS. I created a container using ```docker run``` which you did using the alpine image that you downloaded. A list of running containers can be seen using the ```docker container ls``` command.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-26%2000.31.29.png?raw=true)

* *Docker daemon* - The background service running on the host that manages building, running and distributing Docker containers.

* *Docker client* - The command line tool that allows the user to interact with the Docker daemon.

* *Docker Store* - Store is, among other things, a registry of Docker images. You can think of the registry as a directory of all available Docker images. You’ll be using this later in this tutorial.

****

### Intermediate Level

*Containers Part*:

* [Video: What are Containers?](https://www.youtube.com/watch?v=EnJ7qX9fkcU) 

Time: 30min

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-26%2022.22.01.png?raw=true)

A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-26%2022.23.28.png?raw=true)

Container images become containers at runtime and in the case of Docker containers - images become containers when they run on Docker Engine. Available for both Linux and Windows-based applications, containerized software will always run the same, regardless of the infrastructure. Containers isolate software from its environment and ensure that it works uniformly despite differences for instance between development and staging.

****

* [Video: VMs Versus Containers](https://www.youtube.com/watch?v=L1ie8negCjc) 

Time: 15min

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2001.53.49.png?raw=true)

Both containers and VMs have benefits and drawbacks, and the ultimate decision will depend on your specific needs, but there are some general rules of thumb.

* VMs are a better choice for running apps that require all of the operating system’s resources and functionality, when you need to run multiple applications on servers, or have a wide variety of operating systems to manage.

* Containers are a better choice when your biggest priority is maximizing the number of applications running on a minimal number of servers.

| **VMS** | **Containers** |
| :------: | :------: |
| Heavyweight | Lightweight |
| Limited performance | Native performance |
| Each VM runs in its own OS | All containers share the host |
| Hardware-level virtulization | OS virtualization |
| Startup time in minutes | Startup time in milliseconds |
| Allocates required memory | Requires less memory space |
| Fully isolated and hence more secure | Process-level isolation, possibly less secure |

With the current state of virtualization technology, the flexibility of VMs and the minimal resource requirements of containers work together to provide environments with maximum functionality.

****

[Lab: Docker Intro](https://training.play-with-docker.com/beginner-linux/#Task_0)

Time: 60 min

**Task 1: Run some simple Docker containers**

There are different ways to use containers. These include:
1. **To run a single task:** This could be a shell script or a custom app.
2. **Interactively:** This connects you to the container similar to the way you SSH into a remote server.
3. **In the background:** For long-running services like websites and databases.

 **Run a single task in an Alpine Linux container**
 
![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2019.46.52.png?raw=true)

Containers which do one task and then exit can be very useful. You could build a Docker image that executes a script to configure something. Anyone can execute that task just by running the container - they don’t need the actual scripts or configuration information.

 **Run an interactive Ubuntu container**

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2019.56.55.png?raw=true)

Interactive containers are useful when you are putting together your own image. You can run a container and verify all the steps you need to deploy your app, and capture them in a Dockerfile.

 **Run a background MySQL container**

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2020.04.23.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2020.12.27.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2020.16.05.png?raw=true)

Background containers are how you’ll run most applications

**Task 2: Package and run a custom app using Docker**

In this step, we’ll learn how to package your own apps as Docker images using a Dockerfile. The Dockerfile syntax is straightforward. In this task, we’re going to create a simple NGINX website from a Dockerfile.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2021.49.14.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2021.51.17.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2021.52.59.png?raw=true)

**Build a simple website image**

**Task 3: Modify a running website**

When you’re actively working on an application it is inconvenient to have to stop the container, rebuild the image, and run a new version every time you make a change to your source code.

One way to streamline this process is to mount the source code directory on the local machine into the running container. This will allow any changes made to the files on the host to be immediately reflected in the container.

We do this using something called a bind mount.When you use a bind mount, a file or directory on the host machine is mounted into a container running on the same host.

**Start our web app with a bind mount and Modify the running website****

Start the web app and mount the current directory into the container.

Bind mounts mean that any changes made to the local file system are immediately reflected in the running container. Even though we’ve modified the index.html local filesystem and seen it reflected in the running container, we’ve not actually changed the Docker image that the container was started from.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2021.59.25.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2022.02.25.png?raw=true)

**Update the image**

To persist the changes you made to the index.html file into the image, you need to build a new version of the image.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2022.14.58.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2022.15.12.png?raw=true)

**Push your images to Docker Hub**

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2022.18.40.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2022.20.11.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2022.20.51.png?raw=true)

My newly-pushed Docker images

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2022.22.30.png?raw=true)

****

[Lab: Doing more with Docker images](https://training.play-with-docker.com/ops-s1-images/)

Time: 60min

* *Layers* - A Docker image is built up from a series of layers. Each layer represents an instruction in the image’s Dockerfile. Each layer except the last one is read-only.

* *Dockerfile* - A text file that contains all the commands, in order, needed to build a given image. The Dockerfile reference page lists the various commands and format details for Dockerfiles.

* *Volumes* - A special Docker container layer that allows data to persist and be shared separately from the container itself. Think of volumes as a way to abstract and manage your persistent data separately from the application itself.

We will start with the simplest form of image creation, in which we simply commit one of our container instances as an image. Then we will explore a much more powerful and useful method for creating images: the Dockerfile.

We will then see how to get the details of an image through the inspection and explore the filesystem to have a better understanding of what happens under the hood.

**Image creation from a container**

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2022.50.06.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2022.54.22.png?raw=true)

we can create a container, add all the libraries and binaries in it and then commit it in order to create an image.  We can then use that image just as we would for images pulled down from the Docker Store. 

**Image creation using a Dockerfile**

Instead of creating a static binary image, we can use a file called a Dockerfile to create an image. The final result is essentially the same, but with a Dockerfile we are supplying the instructions for building the image, rather than just the raw binary files. This is useful because it becomes much easier to manage changes, especially as your images get bigger and more complex.

We will use a simple example in this section and build a “hello world” application in Node.js.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2023.37.05.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2023.40.32.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2023.45.54.png?raw=true)

What just happened? We created two files: our application code (index.js) is a simple bit of javascript code that prints out a message. And the Dockerfile is the instructions for Docker engine to create our custom container. This Dockerfile does the following:

* Specifies a base image to pull FROM - the alpine image we used in earlier labs.

* Then it RUNs two commands (apk update and apk add) inside that container which installs the Node.js server.

* Then we told it to COPY files from our working directory in to the container. The only file we have right now is our index.js.

* Next we specify the WORKDIR - the directory the container should use when it starts up

* And finally, we gave our container a command (CMD) to run when the container starts.

With a Dockerfile we can specify precise commands to run for everyone who uses this container. Other users do not have to build the container themselves once you push your container up to a repository (which we will cover later) or even know what commands are used. The Dockerfile allows us to specify how to build a container so that we can repeat those steps precisely everytime and we can specify what the container should do when it runs. There are actually multiple methods for specifying the commands and accepting parameters a container will use, but for now it is enough to know that you have the tools to create some pretty powerful containers.

**Image layers**

Docker has an inspect command for images and it returns details on the container image, the commands it runs, the OS and more.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2023.54.25.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-28%2023.55.53.png?raw=true)

Docker Enterprise Edition includes private Trusted Registries with Security Scanning and Image Signing capabilities so you can further inspect and authenticate your images. In addition, there are policy controls to specify which users have access to various images, who can push and pull images, and much more.

Another important note about layers: each layer is immutable. As an image is created and successive layers are added, the new layers keep track of the changes from the layer below. When you start the container running there is an additional layer used to keep track of any changes that occur as the application runs. This design principle is important for both security and data management. If someone mistakenly or maliciously changes something in a running container, you can very easily revert back to its original state because the base layers cannot be changed. Or you can simply start a new container instance which will start fresh from your pristine image. And applications that create and store data can store their data in a special kind of Docker object called a volume, so that data can persist and be shared with other containers. 

****

[Video: VMs Versus Containers Deep Dive](https://www.youtube.com/watch?v=PoiXuVnSxfE)

Time: 15 min

Virtual machines and containers differ in several ways, but the primary difference is that containers provide a way to virtualize an OS so that multiple workloads can run on a single OS instance. With VMs, the hardware is being virtualized to run multiple OS instances. Containers’ speed, agility, and portability make them yet another tool to help streamline software development.

****

*Networking and Orchestration Part*

[Lab: Docker Networking](https://training.play-with-docker.com/docker-networking-hol/)

Time: 45min

**Section #1 - Networking Basics**

The ```docker network``` command is the main command for configuring and managing container networks. ```docker network ls``` command can view existing container networks on the current Docker host. Each network gets a unique ```ID``` and ```NAME```. The ```docker network inspect``` command is used to view network configuration details. 

**Section #2 - Bridge Networking**

Every clean installation of Docker comes with a pre-built network called **bridge**. Verify this with the ```docker network ls```. The ***bridge*** network is the default network for new containers. This means that unless you specify a different network, all new containers will be connected to the ***bridge*** network. Create a new container by running ```docker run -dt ubuntu sleep infinity```. The port mapping is actually port address translation (PAT).

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-29%2016.17.32.png?raw=true)

**Section #3 - Overlay Networking**

Create a new overlay network called “overnet” by running ```docker network create -d overlay overnet```. Use the docker network ls command to verify the network was created successfully. Use the ```docker network inspect <network>``` command to view more detailed information about the “overnet” network. After having a Swarm initialized and an overlay network, we can create a service that uses the network.

```
docker service create --name myservice \
--network overnet \
--replicas 2 \
ubuntu sleep infinity
```
 
Overlay networks connect multiple Docker daemons together and enable swarm services to communicate with each other. Macvlan networks can assign a MAC address to a container, making it appear as a physical device on your network. The Docker daemon routes traffic to containers by their MAC addresses. Using the macvlan driver is sometimes the best choice when dealing with legacy applications that expect to be directly connected to the physical network, rather than routed through the Docker host’s network stack.

****

[Lab: Swarm Mode Introduction](https://training.play-with-docker.com/ops-s1-swarm-intro/)

Time: 45 min

* **Compose** is used to control multiple containers on a single system. Much like the Dockerfile we looked at to build an image, there is a text file that describes the application: which images to use, how many instances, the network connections, etc.

* **Swarm Mode** tells Docker that you will be running many Docker engines and you want to coordinate operations across all of them. Swarm mode combines the ability to not only define the application architecture, like Compose, but to define and maintain high availability levels, scaling, load balancing, and more. With all this functionality, Swarm mode is used more often in production environments than it’s more simplistic cousin, Compose.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-29%2017.32.53.png?raw=true)

![]()

Docker Swarm can easily and quickly scale your application’s services up and down as needs require. Using only a couple of commands enables you to deploy a stack of services using Docker Swarm Mode to orchestrate the entire stack, all maintained in the simple, human readable Docker Compose file format.


> Include notes here about each of the links

## Area 2
> Include notes here about each of the links
