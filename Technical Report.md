# Hello Docker

<div align=center>

![Docker](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-12-09%2018.42.57.png?raw=true)

</div>

<div align=center>

```Docker: Build, Ship, and Run Any App, Anywhere```

</div>

I heard about the name of Docker not long after it was released. 
At that time, I didn't have any specific concepts about distributed systems, so I didn't go deep into Docker.
This semester I chose the course distributed system from [Prof. Tim Wood](https://faculty.cs.gwu.edu/timwood/). 
I was once again exposed to Docker, a cute blue whale, during class and after class.
This Technical Report briefly summarizes some of the important concepts involved in Docker. 

## What's Docker

Docker is written in GO and uses several features of the Linux kernel to provide its functionality. 
Docker lets you manage CPU, memory, network and disk resources just like managing virtual machines. 
Docker is an open platform for rapid development, distribution, and deployment of applications. 
It provides an abstraction at the operating system level and isolates the application's dependencies on the infrastructure (operating system, etc.). 
At the same time, Docker solves the consistency of production, testing, and deployment environments.

Docker provides containers (loosely coupled and isolated environments) to package and run applications. 
Good security and isolation allow us to run multiple containers on a single host. 
Because the container is a load that runs directly in the kernel of the host machine and does not require an additional hypervisor (such as a virtual machine that requires a VMware hypervisor), 
the container is said to be lightweight (This is one of our final exam questions :) ).

## Docker Engine

<div align=center>

![Docker Engine](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/docker%20engine.png?raw=true)

</div>

As you can see from the figure, 
the client uses the docker CLI (command line tool) to interact with the docker daemon (docker daemon) through the Docker REST API. 
The docker daemon is responsible for creating and managing Docker objects (such as images, containers, networks, and storage volumes).

## Docker's Application Scenario

<div align=center>

![8 Dockers Use Case](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/docker%20application.png?raw=true)

</div>

**Deliver Applications Quickly and Consistently**

Docker streamlines the development cycle by using a container that provides applications and services to provide a standardized working environment. 
Containers are very useful in continuous integration and continuous development (CI/CD).

Consider the following example scenario:

* Developers write code locally and share their work with colleagues using Docker containers.

* Developers use Docker to push applications into the test environment and perform automated and manual tests. 
When developers find errors, they can fix them in the development environment and redeploy them to the test environment for testing and verification.

* Once the test is complete, pushing the fix to the customer is as simple as pushing the updated image to the production environment.

**Responsive Deployment and Scaling**

Docker's portability and lightweight features also make it easy to dynamically manage workloads, expanding and shrinking applications and services in real-time as demanded.

**Run Multiple Workloads on a same Hardware**

Docker's lightweight and fast-running features allow us to do more with fewer resources and maximize the use of computer resources. 
Docker is ideal for high-density environments and small to medium-sized deployments.

##  Architecture of Docker

<div align=center>

![Docker Architecture](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/docker%20arch.png?raw=true)

</div>

As we can see from the figure, Docker is a C/S architecture. 
The client interacts with the Docker daemon through the REST API, which pulls the image from the Registry (the repository, such as DockerHub), builds, runs, and distributes the container.

## Docker VS Vitual Machine

First, Docker is a container management technology, not a virtualization technology. 
It is fundamentally different from the virtual machines we know:

<div align=center>

![Docker And VM](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/VM_vs_Docker.png?raw=true)

</div>

As you can see from the above figure, Docker is based on the Docker engine to share the hardware resources of the host, using the container to provide a stand-alone operating environment to run the application. 
The VM is based on the Supervisor (virtual hypervisor) using virtual machine technology to provide isolated virtual machines, providing operating environment on the virtual machine's operating system. 
While both provide good resource isolation, it's clear that Docker's virtualization overhead is lower.


<div align=center>

| Characteristic | Container | VM |
| :------| :------ | :------ |
| Start up | Second level | Minute level |
| Hard disk usage | ~MB | ~GB |
| Performance | Close to native | Worse than |
| System support | Stand-alone support for thousands of containers | Tens of |

</div>

## Core terminology

Below we will focus on some of the core terms that Docker involves: Registry, Image, Container, Stack, Service, and Swarm.

**Registry**

The Docker Registry is used to store Docker images. For example, Docker's official [Docker Hub](https://hub.docker.com/) is an open repository. 
Above we can find the image we want. Of course, we can also create a private mirror warehouse.

When we execute the ```Docker pull``` or ```Docker run``` command, if there is no required image locally, then an image will be downloaded from the repository (typically DockerHub). 
Docker executes the run method to get a container, and the user performs various operations in the container. 
Docker executes the commit method to convert a container into a mirror. 
Docker pushes the local image to the repository using commands such as login and push. 
This image can be used on other machines or servers to generate a container to run the corresponding application.
In addition, we can perform mirroring transactions in the [Docker Store](https://store.docker.com/).

**Image**

The image is self-reading and is used to create Docker containers.
We can commit ourselves to our own image after making some additional custom changes based on an image. 
You can also use Dockerfile to build our own image. Docker uses mirror layering technology, and each instruction in the Dockerfile is created as a layer in the image.

**Container**

The container is the most important concept in docker. 
Container is a running instance of mirror. It is an isolated, resource-controlled portable runtime environment, which contains the operating system, the programs that need to run, the dependencies of running programs, and the environment variables, etc. 
We can create a container for the specified image through ```docker run <image>```, which will attach a read-write layer to the image when the container is created. 
We can connect the container to one or more networks and attach storage to it, or create a new image based on its current state. 
Docker uses namespace technology to achieve isolation between containers. 
Changes to the container are temporary, and when the container is stopped, the corresponding changes are lost. 
We can persist the storage by mounting the volume.

**Docker Swarm**

Docker Swarm is the name of Docker's standalone native clustering tool. 
Docker Swarm clusters multiple Docker hosts and exposes them as a single virtual Docker host.

**Service**

Through the service we can do a good job of container expansion. 
By default, the service is load balanced between all working nodes under Swarm. 
In Docker we define, run, and extend services by writing ```docker-compose.yml```.

**Stack**
A Stack is a group of interrelated services that share dependencies and can be coordinated and scaled together. 
A single Stack can define and coordinate the functionality of the entire application.

This is my first time writing a technical report in the form of a blog. I hope I can do better in the future.

## References

[Docker Offcial Documents](https://docs.docker.com/engine/docker-overview/)

[Docker glossary](https://docs.docker.com/glossary/)





