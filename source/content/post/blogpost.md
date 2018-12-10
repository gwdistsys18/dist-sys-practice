---
title: "Containers"
date: 2018-12-07T22:59:23+07:00
draft: false
type: "post"
cover: "/dist-sys-practice/img/cover.jpg"
---

# What are Containers?

## A small taste

A container is a software that packages software and code with all of it's dependencies. This allows an application to run from one environment to another seemlessly. Popularized in 2013, a Docker container image is lighter than a VM, is standalone and can execute everything you need to run an application: code, runtime, system tools, system libraries and settings.

![Docker Container](dist-sys-practice/img/docker_container.png)

There are various form of containers (lmctfy, Turbo, Docker, ROCKET, among others), but in this entry we will mostly focus on Docker's version. Dockers is developed primarly for Linux. This is due to the fact that Linux provides very powerfull resource isolation that do not involved a full hypervisor. It leverages the use of tools such as cgroups, kernel namespaces and a union-capable file system (OverlayFS), these are mostly provided by the Linux Kernel.
The isolation comes from the kernel namespace, allowing for isolation of an application view of the operating environment (Process trees, network, user ID's and mounted file systems) and through the use of cgroups, this limits the amount of memory usage as well as CPU, essentially isolating multiple userspace instances. What you need to know is that it limits, accounts and isolates resources.

Key word in this explanation is Kernel. Is other words you can create as many conrainers as you desire as long as they share the same kernel. This allows us to have a container running different distributions of Linux and seamlessly work with each other. this means that a Ubuntu instance, a Fedora instance and Mint instance can run together. Recently Microsoft allowed the usage of Docker Windows containers, this in theory allows the usage of Windows with Linux instances. But in reality, the OS will launch a fully fledged Windows Image in a Virtual Machine (Hyper-V or Oracle's VitualBox).

![Docker Windows](dist-sys-practice/img/docker_windows.png)

## Virtual Machines Vs Containers

The main difference between VM's and Containers lies in the isolation. A VM isolates the underlying Hardware, this will inherently will make image bigger given that the hypervizor needs to have the tools to interact with different hardware. From network interface cards (NICs), Memory, Periferals and even the processor and registers.
Containers are an abstraction at the application layer. Each container shares the kernel and runs isolated in user space. Typical size is MBs.
Virtual Machines (VM's) are an abstraction of the physical hardware. They require a hypervisor to manage the resources and allows multiple VMs to run a single machine. Each VM has a copy of the operating system, the necessary libraries and such. They also have a large overhead during boot and have a size in the GBs
A Container virtualizs the operating system, specifically the Kernel, instead of the hardware. This removes a lot of the overhead from having to interact with the underlying hardware, leave it to the Kernel that is designed to interact with it. Addtionally, this makes the containers lightweight and portable.
The main reason lies in that containers use regular system call and not a hypercall or such.
The beauty lies in the fact that you can combine both concepts and have a very flexible application that is modular and performant. This is what cloud services use to provide container usage (AWS, Azure, IBM Cloud).

![VmandContainers](dist-sys-practice/img/vmandcontainers.png)

# Docker container componenets

Docker software stack consist of 3 main components:

- Software: The Docker daemon, know as `dockerd`, is a process that manages Docker containers and handles container objects. We could say that the deamon is the brains of the operation, always listeing for request via the Docker Engine API. If the daemon is the "server", there is a need for a "client" to make these requests. The Docker client, called `docker`, is reponsible for the command-line interface or Cli, that allows users to interact with the Docker daemon. The idea is to be able to specify a container, usually a Dockerfile, and the daemon is resposible to understand what file has and produce the image accurately over different machines. If you have trouble understanding the daemon, it's responsible for example to use the TCP/IP network stack on a particular container.

- Objects: The object are the foundation of a Docker application. There are 3 outstanding classes:
    + Container: It'a well defined unit that encapsulates the environment in which the application is runned. It's managed through the CLI or Docker API
    + Image: It's a read-only template from which containers are built. Images are used to store applications and are the prefered method of distribution.
    + Services: It's what allows scalability. It permits contrainer to be run across multiple Docker daemons. This is whay is behind the "swarm". Multiple containers talking to each other through the Docker API.

- Registries: Are a repository for the images. Think of it as Github with Git version control API. You can "Pull"/"Push" images. They can be Public / Private. The 2 main registries are Docker Hub and Docker Cloud.

The Docker software are has tools:

- Docker Compose: It's a tool that defines and runs multi-container applications. It uses YAML files, similar to AWS JSON files, to configure the application services (defined above), as well as the creation and initialization of the container. The CLI `docker-compose` allows users to run commands in multiple container simultaneously (building, scaling, starting, stopping, etc).
- Docker Swarm: This is what makes Docker container so powerfull in the world of cloud and distributive computing. The idea was alluded earlier. The concept is to turn manmy Docker engines into one that interact through the Docker API. Each deamon is called a node and interact through the `docker node` CLI. This command0line interface allows us to add/remove nodes for example. The service uses the idea of Workers and Managers. Managers maintain the cluster state, schedule services and serve the API endpoints. Workers only execute containers and run jobs. It's important to note that a Manager node is a worker node. By this, it's suggested to not shcedule any jobs on the Manager.

![DockerSwarmDiagram](disy-sys-practice/img/dockerswarm.png)

# Kubernetes

It is important to talk a bit about Kubertes. An open-source container-orchestration system for automating deployment, scaling and mangemetn of containerized applications. Kubernetes is an alternative to Docker Swarm. It's sold as  a production-ready, enterprise-grade, self-healing system.
Swarm uses a lo of tools that regular Docker containers use. So that brings simplicity to the system. Kubernetes, on the other hand, has it's own command-line interface that is incompatible with Docker 1-1. Kubernetes is more complex than Docker swarm because of the API's it has. But it's a more robust, modular and all-in-one solution. Pods provide an easier organization compared to the only service / micro-service based Swarm. 

### Links:

- [Kubernetes vs Docker Swarm: What's the Diffrence?](https://thenewstack.io/kubernetes-vs-docker-swarm-what's-the-difference/)
- [Kubernetes Tutorial](https://kubernetes.io/docs/tutorials/kubernetes-basics/)

# Containers and Amazon Web Services

Amazon Web Services, know as AWS, offers various services and tool on their cloud services for operation with containers. These services debuted in November 2014.
These services are the Amazon Elastic Container Service (ECS) and Amazon Elastic Container Registry (ECR):

- Amazon Elastic Container Service is a highly scalable, high-performance container orchestration service. It supports Docker as it's container image and services. ECS allows for an user to easely run and scale containerized applications. This is due to the fact that there is no need to manage any orchestration software such as Kubernetes or Docker Swarm. Amazon offers an easy API, CLI and Web interface to manage these. You can even use Amazon Fargate to deploy containers without worrying about the underlying infraestructure aka an EC2 instance. Additionally, you can still use your containers to run micro-services or long heavy applications. 

- Amazon Elastic Container Registry is a fully-manged Docker container registry that lives in the cloud. It is identical to the Docker Cloud or Docker Hub. ECR allows for near seamless interaction with ECS, given that the mangement of the container repositories is on AWS servers. Futhermore, the ECS integration allows for on demand images to scale when needed without worrying about the underlying architecture (registy). The ECR CLI allows usage with the Docker CLI `aws ecr get-login --no-include-email --region [region]` would provide the login for the Docker CLI and by using tags you can mark the location on the destination registry. `docker push` with the tag is enough to push the image to the AWS ECR instance. 

### Links:

- [Elastic Container Registry](https://aws.amazon.com/ecr)
- [Elastic Container Service](https://aws.amazon.com/ecs)

There are many more details that I either didn't go over or that I briefly mentioned. This entry was designed to give the reader an easy way to understand what containers are and a basic understanding on what services and tools are at their disposal. If you are curious, I would recommend doing some Quicklab assignments on basic Docker usage as well as more robust AWS tutorials that give you an idea on how to use the AWS service. If you don't know where to start Dr. Wood's Distributive Systems course at GWU has a very good tutorial [links](https://gwdistsys18.github.io/learn/docker/) where you can learn more about Containers, Docker, VM's, Kubernetes and Amazon Web Services.
