# Distributed Systems Practice

Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## **Table of Contents**

> All elapsed time contains material studying and note writing.

* [Docker and Containers](#Docker-and-Containers)
  * [Beginer Level](#Beginner-Level-mastery-of-Docker)
  * [Intermediate Level](#Intermediate-Level-mastery-of-Docker)
    * [Container](#Container)
    * [Networkding and Orchestration](#Networking-and-Orchestration)
  * [Bring it all together](#Bring-it-all-together)

* [SDN and NFV](#SDN-and-NFV)
  * [Beginer Level](#Beginner-Level-mastery-of-SDN)

## **Docker and Containers**

### **Beginner Level mastery of Docker**

1. ***Video: Why Docker?*** -- elapsed time: 20 mins
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

2. ***Lab: DevOps Docker Beginners Guide*** -- elapsed time: 40 mins

    * **Run first container**
        ```shell
        docker container run hello-world
        ```

        When a docker container command is typed, the docker engine would try to find the image with input name. If fails, it would look for a image from docker registry with the name. Then engine create the image.

    * **Docker images**
        * Just like Git workflow, user can *pull, push* a container image with command like:

            ```shell
            docker container pull [CONTAINER_NAME]
            ```

            ```shell
            docker container push [CONTAINER_NAME]
            ```

        * *Run command*
            * Using run command, will excute the container. If there are more commands follows by, them will be executed in the called container's terminal.
            * The default behavior of it is exit after excute followed command. We can change this by using flags such as [-it]

        * *List command*
            ``` shell
            docker container ls
            ```

            ls commmand will list all containers that are running. Using [-a] flag, a list of containers that we ran will be displayed. We can observe that different called containers was ran in different container instance, even they were called with same image.

    * **Docker Isolation**
        * If we create a file inside a container, there is no way for accessing it outside of the container. All container has its own namespace and context. This is container isolation.

### **Intermediate Level mastery of Docker**

#### **Container**

1. ***Video: What are Containers?*** --elapsed time: 25 mins

    * **Containers runtime definition**: a sandobx for a process--where a process has its namespace and Cgroups. Container lifecycle is coupled with container process.

    * **Image**: Images are binary data. Could be arranged in a image tree structure hierarchy such that 1) a image node can be shared, 2) descendant of a image will be affected by their parent image.

    * **Docker file** is used to tie container abstraction and image together. A docker file is an environment in a textfile starting with "FROM" indicating its parent image. There are any number of configurtion to create a specific docker image, such that can instaniate a container.

    * **Docker host**:
        * Using a *registry* which contains snapshot of images, a docker host can pull and push needed images.

        * With a *image cache*, a docker host does not need to handle whole image hierarchy but needed image node. There could be replication inside of the cache.

        * *Docker client* communicate with *demnon* inside of docker host though API, enabling container management actions like pull, create, run and commit.

        * Client can handle *network/storage configuration*. User can port forwarding and create/assign containers' network in network configration. In storage configuration, if user need to persist data beyond life circle of container, he can create a volume for storage.

2. ***Video: VMs Versus Containers*** --elapsed time: 15 mins

    |             | VM                                                                                                                                                                                                                                                   | Container                                                                                                                                                                                                                                       |
    |-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | Description | Lays between physical hardware and operating system.                                                                                                                                                                                                 | Lays between application layer and operating system                                                                                                                                                                                             |
    | **Application** layer| Needs lots of dependencies to run                                                                                                                                                                                                                    | Dependencies from OS could be packaged up as a docker file                                                                                                                                                                                      |
    | **OS** layer          | Has virtual hardware layer.  Permutation is small in VM, total number of drivers is small.  Require some configuration of dependency for loading and automation. | A docker engine embedded in the operating system. |
    | *VM* layer         | Has limited number of network interfaces(NICs), storage interfaces.  Can scale at demand.                                                                                                                                                      | (Optional)Can minimize amount of dirver and technologies.                                                                                                                                                           |
    | *Hypervisor* layer | Interact with physical hardware, like hardware NIC, hardware storage.  Have agents that monitor RAID card and hardwares in hypervisor.  Have kernel modules.                                                     | (Optional) Can mask all hardware interface for VM, and container host.                                                                                                                                                                |
    | **Physical hardware**   | \                                                                                                                                                                                                                                                    | \                                                                                                                                                                                                                                               |

3. ***Lab: Docker Intro*** --elapsed time: 35 mins

    * **Run docker containers**
        User can run containers that have different application running, including single task container, interactive container and background container. Using coressponding flag in run command can make it.
        * *Default*:

            ``` shell
            docker container run [FLAG] [CONTAINER_NAME] [TASK]
            ```

        * *Interactive* flag:

            ``` shell
            docker container run --interactive [FLAG] [CONTAINER_NAME] [TASK]
            ```

        * *Background* flag:

            ``` shell
            docker container run --detach [FLAG] [CONTAINER_NAME] [TASK]
            ```

    * **Package and run a custom app** using Docker
        With a dockerfile, user can package customized application as a docker image.

        * *Dockerfile syntax*
            * *FROM* specifies the base image to use as the starting point for this new image you’re creating. For this example we’re starting from nginx:latest.

            * *COPY* copies files from the Docker host into the image, at a known location. In this example, COPY is used to copy two files into the image: index.html. and a graphic that will be used on our webpage.

            * *EXPOSE* documents which ports the application uses.

            * *CMD* specifies what command to run when a container is started from the image. Notice that we can specify the command, as well as run-time arguments.

        * *Build with dockerfile*
            ```shell
            docker image build [FLAG] [...]
            ```
            Use the command, user would create a new docker image using the instructions in the dockerfile.

    * **Modify a running application**
        * *Bind mount*
            If we are modifing source code on a running system, it would be nightmare to stop the container, rebuild the image and test new version everytime. 

            ``` shell
            docker container run \
            --detach \
            --publish 80:80 \
            --name linux_tweet_app \
            --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html \
            $DOCKERID/linux_tweet_app:1.0
            ```

            In the above example, user can use bind mount to start an application with [--mount] flag. It enables mounting source code directory into a running container. The container will react to every change immediately.

        * *Modify source and test*
            Let us make change to the source file naming it as [linux_tweet_app:2.0].

            ``` shell
            docker container run \
            --detach \
            --publish 80:80 \
            --name linux_tweet_app \
            $DOCKERID/linux_tweet_app:2.0
            ```

            User can test new version by changing file name.

        * *Store image in Docker Hub*
            Docker provides a system called Docker Hub for user to manage their images with version control. It is pretty like Github system workflow.

             ``` shell
             docker image push [$DOCKERID]/[FILE_NAME]
             ```

             With push command after login, user can push the assigned image to Docker Hub.

4. ***Lab: Doing more with Docker Images*** --elapsed time: 40 mins

    * **Image creation from a container**
        User can create a image from a existing stopped container with commit command
        ```shell
        docker container commit [CONTAINER_ID]
        ```

    * **Image creation using a Dockerfile**
        User can create a image using a Dockerfile. It has serval configuration, including FROM, RUN COPY WORKDIR, and CMD. After writing Dockerfile, user can create a image directly using run command
        ```shell
        docker container run [IMAGE_NAME]
        ```

    * **Image layers**
        After user modified the application running in the container, he can rebuild a new image to test modification. The interesting part during the build procedure is it says "Using cache".
        Because docker image has hierarchy, some of replicated image are stored in Docker cache. Docker will recognize difference between new created image between existing ones so that it will use cached version instead of going through all procedure again.

    * **Image Inspection**
        ```shell
        docker image inspect [IMAGE_NAME]
        ```
        The command allows user to inspect hierarchy tree of a docker image.

5. ***Video: VMs Versus Containers Deep Dive*** --elapsed time: 15 mins

    |                     | VM                                                                                                                                                                                                                                                                                                                        | Container                                                                                                                                                                                                                                                                                                                                                                       |
    |---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | **Size**                | 1. All in a disk image, including kernel+Init system, userspace programs, and applications.   2. Size is based on the size of user space and application. 3. Range from hundreds of megabytes to tens of gigabytes.                                                                                                       | 1. Size mainly depends on applications in the container. Range from tens of megabytes to gigabytes  2.Smallest: applications can be well containerized--all data are static binary without OS dependency(e.g Go language programs)  3. Largest: applications need userspace tool, a base container could be used to contain application containers  (e.g Ubuntu base container) |
    | **Isolations/Security** | 1. Boundary exists. VM is like a sandbox.  2. Attackers need to break through from application to OS so that can break the fence.                                                                                                                                                                                         | 1. Not insecure but secure on the kernel that it is running on.  2. Attackers need to break kernel bugs. It is possible but rare.                                                                                                                                                                                                                                               |
    | **Boot time**           | Serval start-up time would be added up, including two sections:  1. System check section(3-4secs): x86 post + EFI/BIOS boot/check + kernel boot + Init startup  2. Process startup section(500ms) 3. Improvement: a. Use EFI instead of BIOS b. Use modern Init system. These can bring startup time closer to container. | 1. Set up sandbox: no time, because it is kernel operation.  2. Run process(500ms)                                                                                                                                                                                                                                                                                              |                                                                                                                   |

#### **Networking and Orchestration**

1. ***Lab: Docker Networking*** --elapsed time: 45 mins

    * **Bridge Networking**

        * *Bridge* is default network.

            We can connect to Internet from a container using the bridge network which is associated with Linux bridge driver. The default behavior is assigning all new containers to the bridge network. So we can connect a new container directly once it is created.

        * User can *map contain's port to container host's port*. This could be done by using [-p] flag when create a container.
            ```shell
            docker run --name [CONTAINER_NAME] -d -p [HOST_PORT]:[CONTIANER_PORT] nginx
            ```

    * **Overlay Networking**

        * *Swarm* could be used for orchestration.

            ```shell
            docker swarm init --advertise-addr $(hostname -i)
            ```
            With the above command, we can create a swarm manager. Then we can add a worker from another container with the token.
            ```shell
            docker swarm join --token [TOKEN] [MANAGER_IP]
            ```

        * *Overlay Network*:

            Users can define their own network based on the swarm network, which is called overlay network. Overlay network could be created by the command:
            ```shell
            docker network create -d overlay [OVERLAYNET_NAME]
            ```
            Then we can create service that uses the network.
            ```shell
            docker service create --name [SERVICE_NAME] --network [OVERLAYNET_NAME] --replicas [REPLICATION_NUMBER] [APPLICATION_NAME]
            ```

2. ***Lab: Swarm Mode Introduction*** --elapsed time: 20 mins

    * **Swarm Architecture**

        After initilated Docker Swarm Mode, we can view its structure via following command:
        ```shell
        docker node ls
        ```
        There would be managers and workers. The number of *managers* woule usually be 3,5 or 7 because quorum status requirement. They can also be worker. *Wokers* would execute assigned task but cannot be manager in same time.  
    * **Deploy a stack**
        * A *Stack* is a group of services that are deployed together. User can use a plaintext file to define a stack, which usually named as a .yml file. We can delopy a stack in a manager's terminal
            ```shell
            docker stack deploy --compose-file=[.ymlFILE_NAME] [STACK_NAME]
            ```
        * CheckWe check *info of a stack* by running
            ```shell
            docker stack ls # simply list number of services in the stack

            docker stack services [STACK_NAME] # detail of each services in the stack

            docker service ps [SERVICE_NAME] # detail of each tasks in the service
            ```
        * *Stack, Service, and Tasks*

            We can observe that there are services and tasks in the structure of Swarm stack. *Service* are a stack component, including a container image, number of replicas, ports and update policy. *Tasks* are atomic unit of a service and scheduling in Docker. One container instance per task.

    * **Scaling an application**

        Two methods of scaling--automation via Docker's API, and manual via edit .yml file or typing terminal command:
        ```shell
        docker service scale [STACK_NAME]=[SCALING_NUMBER]
        ```

3. ***Video: Kubernetes vs Swarm*** --elapsed time: 5 mins

    |             | Swarm                                                    | Kubernetes                                            |
    |-------------|----------------------------------------------------------|-------------------------------------------------------|
    | Description | A built-in orchestration system in docker             |  A popular orchestration system for docker by Google  |
    | Features    | Run a docker in a cluster Redoplyments with no down-time | Much more features                                    |
    | Popularity  | Simpler than Kubernetes Good for beginner to learn       | Most of real world project                            |

4. ***Video: Kubernetes in 5 Minutes*** --elapsed time: 15 mins
    * **Architectural component**:

        * *Kubernetes cluster services*

            User feed the cluster services a specific configuration. And cluster services will run the configuration in infrastructure. This component has a set of API that takes charge of communication.

        * *Woker* is a container. It has kuberlet process that runs for communicating with kubernetes services.

    * **Use case**:

        * *Feed* desired state file(.yaml file) to kubernetes cluster services. It is a deployment file containing two fundanmental parts:1)Pod. There could be a running container. Thus, it needs to specify container image(s) and 2)Replica specify the number of needed image.

        * Kubernetes cluster services will try to *schedule* feeding Pod and checking. If one of a worker *die*, the kubernetes cluster services will reschedule new place for instantiating lost Pod and Replica.

5. ***Learn more about Kubernetes on your own***
    I followed serval tutorials in Kubernetes' documation.
    * 

6. ***Install Docker on a cluster of EC2 VMs and use Kubernetes to orchestrate them***

### **Bring it all together**

In the AWS Tutorial: Break a Monolith Application into Microservices, I followed instructions

## **SDN and NFV**

### **Beginner Level mastery of SDN**

1. ***Video: Introduction to SDN***
    * **Primary Goal**
        The main goal of SDN is for the network to be open and programmable. If a specific network behavior is required, users should be able to develop and install application for the purpose.

    * **3 layer model of OS and SDN**

        |        |                                         OS model                                        |                                                                              SDN model                                                                             |   |   |
        |--------|:---------------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------:|---|---|
        | North  |                       Application--Customize OS for users' demand                       |                                                    Network Application--Satisfy user's needs but network related                                                   |   |   |
        | Center |     OS--Manage access from applications to underlying hardware, using core services.    |                                   Network OS(SDN controller)--Interfaces with network nodes and provides programmable interface.                                   |   |   |
        | South  | Hardware--Handled by OS.  Typical components are CPU, storage, memory and network card. | Network forwarding device--Receive and handle packets, update counters.  Actions includes dropping packets, modifying packet headers and sending packet via ports. |   |   |

    * **Packet Flow**
        * *On arrival*: a packet arrives forwarding device, it would parse header then either already knows what to do or queries the network controller.

        * *In middle*: network operating system handle queries from south, letting netapplications that running on it determine action to the packet.

        * *At last*: Network operating system translate order down to forwarding device. They would cache instructions as well.

    * **Layer details**
        * *Forwarding device*

            It could be hardware switch that supports programmable interface with higher performance, or software switch with better flexibility.

        * *Southbound Interface*

            There are many types of information that needs to be communicated. Typically, we use 1) OpenFlow as protocol to handle packet, 2) OVSDB protocol to manage network device configuration and so on.

        * *Network operating system*

            Runs with core services, like topology, inventory, statistics service, and host tracking.

        * *Application Interface*

            SDN controller provides simplified abstraction of infrastructure(a single large switch) for applications. It could use Java API. Northbound interface is RESTful interface. This area is lacking standardization.

    * **Avaiability and scalability**
        An SDN controller is logically cntralized ranther than physically centralized. Such that it may avoid network failure result by single controller failure, and avoid scaling limation.

        * *Cluster/Teaming*
            Use a cluster of system to balance workload.

        * *Seperation based on regions*
            Use regional SDN controller to handle traffic in the region. Controllers communicate via East/West Protocol.

    * **SDN vs traditional networks**

        |      | Traditional Network                                                                           | SDN                                                                                       |
        |------|-----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
        | Pros | \                                                                                             | 1. No needs to handle distributed protocol 2. No needs to configure policies in all nodes |
        | Cons | 1. Proprietary locked box--control is coupled to data 2. Each node is configured individually | SDN controller is very complex                                                            |

2. ***Tutorial: Using the OpenDaylight SDN Controller with the Mininet Network Emulator***