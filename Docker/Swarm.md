# Swarm

For real applications IT users and app teams need more sophisticated tools. Docker supplies two such tools: **Docker Compose** and **Docker Swarm Mode**. The two tools have some similarities but some important differences:

- **Compose** is used to control multiple containers on a single system. Much like the *Dockerfile* we looked at to build an image, there is a text file that describes the application: which images to use, how many instances, the network connections, etc. But *Compose* only runs on a single system so while it is useful, we are going to skip Compose and go straight to *Docker Swarm Mode*.
- **Swarm Mode** tells Docker that you will be running many Docker engines and you want to coordinate operations across all of them. Swarm mode combines the ability to not only define the application architecture, like Compose, but to define and maintain high availability levels, scaling, load balancing, and more. With all this functionality, *Swarm mode* is used more often in production environments than it’s more simplistic cousin, Compose.

## What is swarm

a swarm consists of multiple Docker hosts which run in swarm mode and act as managers and workers.

## How swarm works: Nodes and Services

###How Nodes Work

There are two types of nodes: managers and workers. 

**Manager nodes** handle cluster management tasks: maintaining cluster state, scheduling services, and serving swarm mode HTTP API endpoints. The managers maintain a consistent state of the swarm and services running on it, using an implementation of the Raft algorithm.

Running multiple manager nodes allows you to take advantage of swarm mode’s fault-tolerance features. However, adding more managers does not mean increased scalability or higher performance. In general, the opposite is true. Docker recommends implementing an odd number of manager nodes. 

A three-manager swarm tolerates a maximum loss of one manager without downtime. A five-manager swarm tolerates a maximum simultaneous loss of two manager nodes. In general, an N manager cluster will tolerate the loss of at most (N-1)/2 managers. When managers fail beyond this threshold, services continue to run, but you need to create a new cluster to recover.

**Worker nodes** are also instances of Docker Engine whose sole purpose is to run containers. Worker nodes require at least one manager node to function. 

By default, all managers are also workers. In a single manager node cluster, you can run commands like `docker service create` and the scheduler places all tasks on the local Engine. To prevent a manager node from executing tasks, set the availability for a manager node to `Drain`. 

You can promote a worker node to be a manager by running docker node promote. For example, you may want to promote a worker node when you take a manager node offline for maintenance. You can also demote a manager node to a worker node using node demote.

###How Services Work

Services allow you to deploy an application image to a Docker swarm. Examples of services include an HTTP server, a database, or other software that needs to run in a distributed environment. The basic definition of the service includes a container image to run, and commands to execute inside the running containers. 

- **Service options** – when you create a service, you can specify the port to publish for external access, an overlay network for the service to connect to other services in the swarm, CPU and memory restrictions, a rolling update policy, and number of replicas of the image to run in the swarm.
- **Services, scheduling and desired state** – when you deploy the service to the swarm, the service definition is the desired state for the service. For example, the desired state might be running three instances of an HTTP listener, with load balancing between them. The swarm manager schedules a replica task on three Docker Engines in the swarm, each of which runs a container with an HTTP listener. If one of these instances fails, the manager recognizes the desired state is not fulfilled, schedules another replica task, and spawns a new container to bring the number of listeners back to three. 
- **When tasks fail** – if a task in a Docker swarm fails, it is not recovered or restarted. The orchestrator simply removes the container related to the failed tasks, and creates a new task to replace it according to the desired state specified by the service.
- **Pending services** – a service is pending if there aren’t currently nodes available in the cluster to run its tasks. For example, this might happen if all the nodes in the cluster are paused or Drained (defined as manager nodes which may not act as worker nodes). You can also specify constraints on a service, such as minimal memory of 100 GB on a node. If no nodes have this amount of memory, the service will be pending until a node joins the swarm that satisfies the requirement. 
- **Replicated vs. global services** – a replicated service specifies a number of identical tasks you want to run. For example, you decide to deploy an HTTP service with three replicas, each serving the same content. A global service is a service that runs one task on all the nodes in the swarm, with no pre-specified number of tasks/nodes. Each time you add a node to the swarm, the same task is run on it. For example, a typical global service is a monitoring agent or an anti-virus scanner.

![](https://training.play-with-docker.com/images/ops-swarm-arch.svg)

![](https://training.play-with-docker.com/images/ops-swarm-stack-service-task.svg)

## The application

`docker swarm init --advertise-addr $(hostname -i)` can initialize a **Swarm Manager**. 

Run a docker node ls to verify that both nodes are part of the Swarm. The ID and HOSTNAME values may be different in your lab. The important thing to check is that both nodes have joined the Swarm and are ready and active.

To add a worker to this swarm, run the following command: `docker swarm join —token`

`docker node ls` could show swarm members.

##Pros & Cons

###Pros

- **Runs at a faster pace:** When you were using a virtual environment, you may have realized that it takes a long time and includes the tedious procedure of booting up and starting the application that you want to run. With Docker Swarm, this is no more a problem. Docker Swarm removes the need to boot up a full virtual machine and enables the app to run in a virtual and software-defined environment quickly and helps in DevOps implementation.
- **Documentation provides every bit of information:** The Docker team stands out when it comes to documentation! Docker is rapidly evolving and has received great applause for the entire platform. When version gets released at a short interval of time, some platform doesn’t maintain/take care to maintain documentation. But docker swarm never compromises with it. If in case the information only applies to the certain versions of a docker swarm, the documentation makes sure that all information is updated.
- **Provides simple and fast configuration:** One of the key benefits of Docker Swarm is that, it simplifies the matter. Docker Swarm enables the user to take their own configuration, put it into a code and deploy it without any hassle. As Docker Swarm can be used in various environments, requirements are just not bound by the environment of the application.
- **Ensures that application is isolated:** Docker Swarm takes care that each container is isolated from the other containers and has its own resources. Various containers can be deployed for running the separate application in different stacks. Apart from this, Docker Swarm cleans app removal as each application runs on its own container. If the application is no longer required, you can delete its container. It won’t leave any temporary or configuration files on your host OS.
- **Version control and component reuse —** With Docker Swarm, you can track consecutive versions of a container, examine differences or roll-back to the preceding versions. Containers reuse the components from the preceding layers which makes them noticeably lightweight.

#### ###Cons

- **Docker is platform dependent:** Docker Swarm is a Linux agonistic platform. Although Docker supports Windows and Mac OS X, it utilizes virtual machines to run on a non-Linux platform. An application which is designed to run in docker container on Windows can’t run on Linux and vice versa.
- **Doesn’t provide storage option:** Docker Swarm doesn’t provide a hassle-free way to connect containers to storage and this is one of the major disadvantages. Its data volumes require a lot of improvising on the host and manual configurations. If you’re expecting Docker Swarm to solve the storage issues, it may get done but not in an efficient and user-friendly way.
- **Poor monitoring:** Docker Swarm provides the basic information about the container and if you are looking for the basic monitoring solution than *Stats command* is suffice. If you are looking for the advanced monitoring than Docker Swarm is never an option. Although there are third-party tools available like CAdvisor which offers more monitoring. It is not feasible to collect more data about containers in real-time with Docker itself