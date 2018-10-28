# Distributed Systems Practice

Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Table of Contents

>All elapsed time contains material studying and note writing.

* [Docker and Containers](#Docker-and-Containers)
  * [Beginer Level](#Beginner-Level-mastery-of-Docker)
  * [Intermediate Level](#Intermediate-Level-mastery-of-Docker)
    * [Container](#Container)
    * [Networkding and Orchestration](#Networking-and-Orchestration)

* [SDN and NFV](#SDN-and-NFV)
  * [Beginer Level](#Beginner-Level-mastery-of-SDN)

## Docker and Containers

### **Beginner Level mastery of Docker**

1. Video: Why Docker? -- elapsed time: 10 mins for video, 10 mins for readme file structure
    * Docker is an opensource project released in 2013. It is a shift in frastructure that will affect whole IT related asepct.
    * Recap:
      * 90's: Mainframe to PC
      * 00's: Beramental to Virtual
      * 10's: Datacenter to Cloud
      * Now: Host to Container (Serverless)
    * Migration is hard. But Docker is focused on the migration experience because it was created for developer but system administers.
    * Fastest growing technology.
    * Docker make whole ecosystem of IT faster.
    * Applications runs in different enviorments. Docker allow users to get rid of different enviorments.
    * Docker frees maintains resources such that engineers have more time to innovate.

2. Lab: DevOps Docker Beginners Guide -- elapsed time: 30 mins

### **Intermediate Level mastery of Docker**

#### Container

1. Video: What are Containers? --elapsed time: 25 mins

    * **Containers runtime definition**: a sandobx for a process--where a process has its namespace and Cgroups. Container lifecycle is coupled with container process.

    * **Image**: Images are binary data. Could be arranged in a image tree structure hierarchy such that 1) a image node can be shared, 2) descendant of a image will be affected by their parent image.

    * **Docker file** is used to tie container abstraction and image together. A docker file is an environment in a textfile starting with "FROM" indicating its parent image. There are any number of configurtion to create a specific docker image, such that can instaniate a container.

    * **Docker host**:
      * Using a *registry* which contains snapshot of images, a docker host can pull and push needed images.

      * With a *image cache*, a docker host does not need to handle whole image hierarchy but needed image node. There could be replication inside of the cache.

      * *Docker client* communicate with *demnon* inside of docker host though API, enabling container management actions like pull, create, run and commit.

      * Client can handle *network/storage configuration*. User can port forwarding and create/assign containers' network in network configration. In storage configuration, if user need to persist data beyond life circle of container, he can create a volume for storage.

2. Video: VMs Versus Containers --elapsed time: 15 mins

    |             | VM                                                                                                                                                                                                                                                   | Container                                                                                                                                                                                                                                       |
    |-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | Description | Lays between physical hardware and operating system.                                                                                                                                                                                                 | Lays between application layer and operating system                                                                                                                                                                                             |
    | Application layer| Needs lots of dependencies to run                                                                                                                                                                                                                    | Dependencies from OS could be packaged up as a docker file                                                                                                                                                                                      |
    | OS layer          | Has virtual hardware layer.  Permutation is small in VM, total number of drivers is small.  Require some configuration of dependency for loading and automation. | A docker engine embedded in the operating system. |
    | VM layer         | Has limited number of network interfaces(NICs), storage interfaces.  Can scale at demand.                                                                                                                                                      | (Optional)Can minimize amount of dirver and technologies.                                                                                                                                                           |
    | Hypervisor layer | Interact with physical hardware, like hardware NIC, hardware storage.  Have agents that monitor RAID card and hardwares in hypervisor.  Have kernel modules.                                                     | (Optional) Can mask all hardware interface for VM, and container host.                                                                                                                                                                |
    | Physical hardware   | \                                                                                                                                                                                                                                                    | \                                                                                                                                                                                                                                               |

3. Lab: Docker Intro
4. Lab: Doing more with Docker Images
5. Video: VMs Versus Containers Deep Dive --elapsed time: 15 mins

    |                     | VM                                                                                                                                                                                                                                                                                                                        | Container                                                                                                                                                                                                                                                                                                                                                                       |
    |---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | Size                | 1. All in a disk image, including kernel+Init system, userspace programs, and applications.   2. Size is based on the size of user space and application. 3. Range from hundreds of megabytes to tens of gigabytes.                                                                                                       | 1. Size mainly depends on applications in the container. Range from tens of megabytes to gigabytes  2.Smallest: applications can be well containerized--all data are static binary without OS dependency(e.g Go language programs)  3. Largest: applications need userspace tool, a base container could be used to contain application containers  (e.g Ubuntu base container) |
    | Isolations/Security | 1. Boundary exists. VM is like a sandbox.  2. Attackers need to break through from application to OS so that can break the fence.                                                                                                                                                                                         | 1. Not insecure but secure on the kernel that it is running on.  2. Attackers need to break kernel bugs. It is possible but rare.                                                                                                                                                                                                                                               |
    | Boot time           | Serval start-up time would be added up, including two sections:  1. System check section(3-4secs): x86 post + EFI/BIOS boot/check + kernel boot + Init startup  2. Process startup section(500ms) 3. Improvement: a. Use EFI instead of BIOS b. Use modern Init system. These can bring startup time closer to container. | 1. Set up sandbox: no time, because it is kernel operation.  2. Run process(500ms)                                                                                                                                                                                                                                                                                              |                                                                                                                   |

#### Networking and Orchestration

1. Lab: Docker Networking
2. Lab: Swarm Mode Introduction
3. Video: Kubernetes vs Swarm --elapsed time: 5 mins

    |             | Swarm                                                    | Kubernetes                                            |
    |-------------|----------------------------------------------------------|-------------------------------------------------------|
    | Description | A built-in orchestration system in docker             |  A popular orchestration system for docker by Google  |
    | Features    | Run a docker in a cluster Redoplyments with no down-time | Much more features                                    |
    | Popularity  | Simpler than Kubernetes Good for beginner to learn       | Most of real world project                            |

4. Video: Kubernetes in 5 Minutes --elapsed time: 15 mins
    * **Architectural component**:

      * **Kubernetes cluster services**. User feed the cluster services a specific configuration. And cluster services will run the configuration in infrastructure. This component has a set of API that takes charge of communication.

      * **Woker** are container host. It has kuberlet process that runs for communicating with kubernetes services.

    * **Use case**:

      * *Feed* desired state file(.yaml file) to kubernetes cluster services. It is a deployment file containing two fundanmental parts:1)Pod. There could be a running container. Thus, it needs to specify container image(s) and 2)Replica specify the number of needed image.

      * Kubernetes cluster services will try to *schedule* feeding Pod and checking. If one of a worker *die*, the kubernetes cluster services will reschedule new place for instantiating lost Pod and Replica.

5. Learn more about Kubernetes on your own
6. Install Docker on a cluster of EC2 VMs and use Kubernetes to orchestrate them

## SDN and NFV

### **Beginner Level mastery of SDN**

1. Video: Introduction to SDN
    * Primary Goal
        The main goal of SDN is for the network to be open and programmable. If a specific network behavior is required, users should be able to develop and install application for the purpose.

    * 3 layer model of OS and SDN
        1. OS: manage access from applications to underlying hardware, using core services.
        2. Hardware: handled by OS, such as CPU, storage, memory and network.
        3. Application: customize OS for users' demand.
        4. Network OS/SDN controller: interfaces with network nodes and provides programmable interface.
        5. Network forwarding device: receive and handle packets, update counters. Actions includes dropping packets, modifying packet headers and sending packet via ports.
        6. Network Application: satisfy user's needs but network related.

    * Layer details
    * Packet walkthrough example
    * Avaiability and scalability
    * SDN vs traditional networks

2. Tutorial: Using the OpenDaylight SDN Controller with the Mininet Network Emulator