**Docker and Containers**

# Table of contents
1. [Why Docker?](#docker)
2. [DevOps Docker Beginners Guide](#guide)


<a name="docker"></a>
# Why Docker? 
### What is docker?
* Docker is a computer program that performs operating-system-level virtualization and is used to run containers.
  * What is container?
    * A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

### Docker is focused on the migration experience (20 mins)
* Docker is all about speed
![](https://s3.amazonaws.com/hadoop357/docker.PNG)
* Containers Reduce Complexity. Package all of the '?'.
* 80% MAINTENANCE, 20% INNOVATION, we use docker to reduce the maintenance and complexity drains budgets.
* e.g1 Paypal
   * 18 Month project (long)
   * Migrated 700+ apps (multi platform)
   * Now 150,000 containers (need management)
   * 50% dev productivity boost (benefit from docker)
* e.g2 MetLifte
   * 70% reduction in VM costs
   * 67% fewer CPU's (contrainer is light)
   * 10x average CPU utilization (management)
   * 66% cost reduction
 
<a name="guide"></a>
# DevOps Docker Beginners Guide 

### Concepts
	* Docker engine
	* Containers & images
	* Image registries and Docker Store (AKA Docker Hub)
	* Container isolation
	
### docker container run hello-world
![](https://s3.amazonaws.com/hadoop357/hello_world.PNG)

### Docker Image
* Some Commands:
	* docker image pull alpine
		* The pull command fetches the alpine image from the Docker registry and saves it in our system. In this case the registry is Docker Store.
	* docker image ls
	* docker container run alpine ls -l
![](https://s3.amazonaws.com/hadoop357/Docker_detail.PNG)
	* docker container run -it alpine /bin/sh
		* Running a Linux shell inside the container.
	* docker container ls -a
		* list all containers that you ran.
![](https://s3.amazonaws.com/hadoop357/DockerInstance.PNG)

### Container Isolation

* Even though each docker container run command used the same alpine image, each execution was a separate, isolated container. Each container has a separate filesystem and runs in a different namespace; by default a container has no way of interacting with other containers, even those from the same image.

* In every day work, Docker users take advantage of this feature not only for security, but to test the effects of making application changes. Isolation allows users to quickly create separate, isolated test copies of an application or service and have them run side-by-side without interfering with one another. In fact, there is a whole lifecycle where users take their changes and move them up to production using this basic concept and the built-in capabilities of Docker Enteprise.
![](https://s3.amazonaws.com/hadoop357/DockerIsolation.PNG)
![](https://s3.amazonaws.com/hadoop357/DockerExec.PNG)

### Terminology
* Images - The file system and configuration of our application which are used to create containers. To find out more about a Docker image, run docker image inspect alpine. In the demo above, you used the docker image pull command to download the alpine image. When you executed the command docker container run hello-world, it also did a docker image pull behind the scenes to download the hello-world image.
* Containers - Running instances of Docker images — containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers, and runs as an isolated process in user space on the host OS. You created a container using docker run which you did using the alpine image that you downloaded. A list of running containers can be seen using the docker container ls command.
* Docker daemon - The background service running on the host that manages building, running and distributing Docker containers.
* Docker client - The command line tool that allows the user to interact with the Docker daemon.
* Docker Store - Store is, among other things, a registry of Docker images. You can think of the registry as a directory of all available Docker images. You’ll be using this later in this tutorial.


