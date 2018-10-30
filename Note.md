#video:why docker? (20min)

Docker is an open source object, release in 2013.

The most great thing that docker has is higher speed. We can do faster develop by using docker.

But, docker is not good at deal difficult problem, like multitype application.

-
#Lab: DevOps Docker Beginners Guide (80min)

I learned some basic operating about docker.
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/WechatIMG1.png?raw=true)

Images - The file system and configuration of our application which are used to create containers. 

Containers - Running instances of Docker images.
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/WechatIMG2.png?raw=true)

Alpine - lightweight Linux distribution so it is quick to pull down and run, making it a popular starting point for many other images.
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/WechatIMG3.png?raw=true)

docker container start "container ID": pattern.

-

#Video: What are Containers? (35min)

 Containers are isolated from each other and bundle their own tools, libraries and configuration files; they can communicate with each other through well-defined channels. All containers are run by a single operating system kernel and are thus more lightweight than virtual machines. Containers are created from "images" that specify their precise contents. Images are often created by combining and modifying standard images downloaded from public repositories.
 
-

**Video: VMs Versus Containers** (20min)

Both VMs and container is good choice for build your project.

* container is lightweight, VMs is Heavyweight.
* VMs works between the phyiscal infrastructure and OS layer, container works between the OS and your app.

-

#Lab: Docker Intro （55min）
###Task1: Run some simple Docker containers

There are different ways to use containers. These include:

* To run a single task: This could be a shell script or a custom app.
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/WechatIMG4.png?raw=true)

* Interactively: This connects you to the container similar to the way you SSH into a remote server.
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/WX20181029-194711@2x.png?raw=true)

* In the background: For long-running services like websites and databases.
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/WX20181029-195157@2x.png?raw=true)

###Task 2: Package and run a custom app using Docker

Build a simple website image
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/docker%20t3-1.png?raw=true)
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/docker%20t3%20-%202.png?raw=true)

###Task 3: Modify a running website

* Start our web app with a bind mount
* Modify the running website
* Update the image
* Push your images to Docker Hub

-

#Lab: Doing more with Docker Images (100min)

* Image creation from a container
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/doing%20more%201.png?raw=true)
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/doing%20more%202.png?raw=true)

* Image creation using a Dockerfile

   *Dockerfile* - Docker can build images automatically by reading the instructions from a Dockerfile. A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. 
   
-

#Lab: Docker Networking (90min)

###Section #1 - Networking Basics
* Step 1: The Docker Network Command
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn%201.png?raw=true)
* Step 2: List networks
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn2.png?raw=true)
* Step 3: Inspect a network
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn3.png?raw=true)
* Step 4: List network driver plugins
 ![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn4.png?raw=true)

###Section #2 - Bridge Networking
* Step 1: The Basics
 ![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn5.png?raw=true)
* Step 2: Connect a container
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn6.png?raw=true)
* Step 3: Test network connectivity
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn7.png?raw=true)
* Step 4: Configure NAT for external connectivity
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn8.png?raw=true)

###Section #3 - Overlay Networking
* Step 1: The Basics
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn9.png?raw=true)
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn10.png?raw=true)
* Step 2: Create an overlay network
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn11.png?raw=true)
Create a new overlay network won't display/created in second host.
* Step 3: Create a service
 ![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn12.png?raw=true)
we created service here 
"docker network inspect" only shows containers/tasks running on the local node.
* Step 4: Test the network
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn13.png?raw=true)
* Step 5: Test service discovery
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/dn14.png?raw=true)

-

#Lab: Swarm Mode Introduction
* **Cluster management integrated with Docker Engine**: Use the Docker Engine CLI to create a swarm of Docker Engines where you can deploy application services. You don’t need additional orchestration software to create or manage a swarm.
* **Decentralized design**: Instead of handling differentiation between node roles at deployment time, the Docker Engine handles any specialization at runtime. You can deploy both kinds of nodes, managers and workers, using the Docker Engine. This means you can build an entire swarm from a single disk image.
* **Declarative service model**: Docker Engine uses a declarative approach to let you define the desired state of the various services in your application stack. For example, you might describe an application comprised of a web front end service with message queueing services and a database backend.
* **Scaling**: For each service, you can declare the number of tasks you want to run. When you scale up or down, the swarm manager automatically adapts by adding or removing tasks to maintain the desired state.
* **Desired state reconciliation**: The swarm manager node constantly monitors the cluster state and reconciles any differences between the actual state and your expressed desired state. For example, if you set up a service to run 10 replicas of a container, and a worker machine hosting two of those replicas crashes, the manager creates two new replicas to replace the replicas that crashed. The swarm manager assigns the new replicas to workers that are running and available.
* **Multi-host networking**: You can specify an overlay network for your services. The swarm manager automatically assigns addresses to the containers on the overlay network when it initializes or updates the application.
* **Service discovery**: Swarm manager nodes assign each service in the swarm a unique DNS name and load balances running containers. You can query every container running in the swarm through a DNS server embedded in the swarm.
* **Load balancing**: You can expose the ports for services to an external load balancer. Internally, the swarm lets you specify how to distribute service containers between nodes.
* **Secure by default**: Each node in the swarm enforces TLS mutual authentication and encryption to secure communications between itself and all other nodes. You have the option to use self-signed root certificates or certificates from a custom root CA.
* **Rolling updates**: At rollout time you can apply service updates to nodes incrementally. The swarm manager lets you control the delay between service deployment to different sets of nodes. If anything goes wrong, you can roll-back a task to a previous version of the service.
![](https://training.play-with-docker.com/images/ops-swarm-arch.svg)
![](https://training.play-with-docker.com/images/ops-swarm-stack-service-task.svg)

-

#Kubernetes (110min)
* Kubernetes is an open-source system for automating deployment, scaling, and management of containerized applications.

| Kubernets   |      Swarm     |
|----------|:-------------:|
| Applications can be deployed using a combination of pods, deployments, and services (or “microservices”). A pod is a group of co-located containers and is the atomic unit of a deployment. A deployment can have replicas across multiple nodes. A service is the “external face” of container workloads and integrates with DNS to round-robin incoming requests.  |  Applications can be deployed as services (or “microservices”) in a Swarm cluster. Multi-container applications can specified using YAML files. Docker Compose can deploy the app. Tasks (an instance of a service running on a node) can be distributed across datacenters using labels. Multiple placement preferences can be used to distribute tasks further, for example, to a rack in a datacenter. |
| Each application tier is defined as a pod and can be scaled when managed by a deployment, which is specified in YAML. The scaling can be manual or automated. Pods can be used to run vertically integrated application stacks such as LAMP (Apache, MySQL, PHP) or ELK/Elastic (Elasticsearch, Logstash, Kibana), co-located and co-administered apps such as content management systems and apps for backups, checkpoint, compression, rotation, snapshotting. | Services can be scaled using Docker Compose YAML templates. Services can be global or replicated. Global services run on all nodes, replicated services run replicas (tasks) of the services across nodes. For example, A MySQL service with 3 replicas will run on a maximum of 3 nodes. Tasks can be scaled up or down, and deployed in parallel or in sequence. | 
| Auto-scaling using a simple number-of-pods target is defined declaratively using deployments. CPU-utilization-per-pod target is available. Other targets are on the roadmap. | Not directly available. For each service, you can declare the number of tasks you want to run. When you manually scale up or down, the Swarm manager automatically adapts by adding or removing tasks. |
|The deployment controller  supports both “rolling-update” and “recreate” strategies. Rolling updates can  specify maximum number of pods unavailable or maximum number running during the process. | At rollout time, you can apply rolling updates to services. The Swarm manager lets you control the delay between service deployment to different sets of nodes, thereby updating only 1 task at a time.|
|With the release of 1.6, Kubernetes scales to  5,000-node clusters. Kubernetes scalability is benchmarked against the following Service Level Objectives (SLOs):|According to the Docker’s blog post on scaling Swarm clusters, Docker Swarm has been scaled and performance tested up to 30,000 containers and 1,000 nodes with 1 Swarm manager.|

-
#AWS Tutorial: Break a Monolith Application into Microservices （forever... ）

**record**
* 383544123906.dkr.ecr.us-east-1.amazonaws.com/guan 
1. Install application. - Docker, AWS CLI, Atom.
2. Clone repo from  https://github.com/awslabs/amazon-ecs-nodejs-microservices.
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/aws1.png?raw=true)
3. Build and Push docker image.  
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/aws4.png?raw=true)
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/aws5.png?raw=true)
*remember '.' is very important!*   
4. creat a ECS cluster.
 ![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/aws2.png?raw=true)
 ![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/aws3.png?raw=true)
5. checking cluster.  

*task table*
![task table](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/aws6.png?raw=true). 
*instance table*. 
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/was7.png?raw=true)
6. Write a task Definition
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/aws8.png?raw=true)
7. Configure the Application Load Balancer: Target Group. 

	VPC: vpc-06277877ad4593027

 
	