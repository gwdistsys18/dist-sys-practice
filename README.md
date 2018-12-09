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

Logical interpretation of how stacks, services and tasks are inter-related:

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-29%2017.41.17.png?raw=true)

Docker Swarm can easily and quickly scale your application’s services up and down as needs require. Using only a couple of commands enables you to deploy a stack of services using Docker Swarm Mode to orchestrate the entire stack, all maintained in the simple, human readable Docker Compose file format.

****

**Kubernetes**

Time: 35min

**Pros of Kubernetes:**

* Based on extensive experience running Linux containers at Google. Deployed at scale more often among organizations. Kubernetes is also backed by enterprise offerings from both Google (GKE) and RedHat (OpenShift).

* Can overcome constraints of Docker and Docker API.

* Autoscaling based on factors such as CPU utilization.

* Largest community among container orchestration tools. Over 50,000 commits and 1200 contributors.

* Does not have as much experience with production deployments at scale.

* Limited to the Docker API’s capabilities.

* Services can be scaled manually.

* Smaller community and project. Over 3,000 commits and 160 contributors. 

**Cons of Kubernetes:**

* Uses a separate set of tools for management, including kubectl CLI.

* Deployment is simpler and Swarm mode is included in Docker Engine.

* Integrates with Docker Compose and Docker CLI – native Docker tools. Many of the Docker CLI commands will work with Swarm. Easier learning curve.

**Kubernetes vs Swarm:**

* Open source projects. Anyone can contribute using the Go programming language.

* Various storage options.

* Networking features such as load balancing and DNS.

****

**Install Docker on a cluster of EC2 VMs and use Kubernetes to orchestrate them**

Time: 120 min

* Login to your AWS console and generate access keys. 

* To install AWS CLI by using ```brew install awscli``` and Install kops by using ```brew install kops```.

* Create a new IAM user and grant following permissions:

```
AmazonEC2FullAccess
AmazonRoute53FullAccess
AmazonS3FullAccess
AmazonVPCFullAccess
IAMFullAccess
```

* Configure the AWS CLI by providing the Access Key, Secret Access Key and the AWS region that you want the Kubernetes cluster to be installed by using ```aws configure```

* Create an AWS S3 bucket for kops to persist its state.

```
bucket_name=imesh-kops-state-store
aws s3api create-bucket \
--bucket ${bucket_name} \
--region us-east-1
```

* Enable versioning for the above S3 bucket```aws s3api put-bucket-versioning --bucket ${bucket_name} --versioning-configuration Status=Enabled```.

* Provide a name for the Kubernetes cluster and set the S3 bucket URL.

```
export KOPS_CLUSTER_NAME=imesh.k8s.local
export KOPS_STATE_STORE=s3://${bucket_name}
```

* Create a Kubernetes cluster definition using kops by providing the required node count, node size, and AWS zones.

* create the Kubernetes cluster on AWS by executing kops update command```kops update cluster --name ${KOPS_CLUSTER_NAME} --yes```

* Execute the validate command to check its status and wait until the cluster becomes ready.

Once the above process completes, kops will configure the Kubernetes CLI (kubectl) with Kubernetes cluster API endpoint and user credentials.


****

*Bring it all together part*:

[AWS Tutorial: Break a Monolith Application into Microservices](https://aws.amazon.com/cn/getting-started/projects/break-monolith-app-microservices-ecs-docker-ec2/?nc1=h_ls)

Time: 120 min

Traditional monolithic architectures are hard to scale. As an application's code base grows, it becomes complex to update and maintain. Introducing new features, languages, frameworks, and technologies becomes very hard, limiting innovation and new ideas.

Following the instruction of the URL.

**Build the Docker Image**

Run the following command: ```aws ecr get-login --no-include-email --region us-east-1```

Copy this entire output, paste, and run it in the terminal. Login Succeeded.

**Create the Repository**

Create a Amazon Elastic Container Registry (Amazon ECR) and save the link.

**Push image**

Run the following command under the ```/amazon-ecs-nodejs-microservices/2-containerized/services/api``` to build and tag the image:

```
docker build -t api .
docker push [account-id].dkr.ecr.[region].amazonaws.com/api:latest
```

**Deploy the Monolith**

```
aws cloudformation deploy \
   —template-file infrastructure/ecs.yml \
   —region <region> \
   —stack-name BreakTheMonolith-Demo \
   —capabilities CAPABILITY_NAMED_IAM
```

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-29%2023.44.09.png?raw=true)

**Break the Monolith into micro service**

**Why Microservices?**

* Isolation of Crashes

* Isolation for Security

* Independent Scaling

* Development Velocity

Steps:

* Create three different repositories under ECS repositories.

* Under local environment (where git repo is cloned), run three command that create 3 different images. 

* Tag images that just build.

* Push them to the corresponding repository.


**Deploy Microservices**

* Write task definition for each post, users, threads service. 

* Configure the four application balance load as previous section. Same setting during the configuration process.

* Edit listener using “Insert Rule”. Insert rules for each service. 

* Deploy each service on Amazon ECS console. 

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-29%2023.57.48.png?raw=true)

Deploy Monolith application and break it into microservices shows how Docker images can be built and deploy services onto a cloud platform. It is very fast, duplicable, and efficient. The convenience is quietly needed when there is a large amount of servers are required to deploy same services. 

****

## Big Data and Machine Learning

### Beginner Level

****

[Video: Hadoop Intro](https://www.youtube.com/watch?v=jKCj4BxGTi8&feature=youtu.be)

Time: 20min

Challenges of Distributed Systems that Hadoop can solve include high chances of system failure, limit on bandwidth and high programming complexity. Hadoop is a framework that allows for distributed processing of large data sets across clusters of commodity computers using simple programming models. The four key characteristics of Hadoop are economical, reliable, scalable and flexible. There are 12 components of the Hadoop ecosystem and each part has its own role. And there are four stages of  big data processing. They are ingest processing analyze and access.

****

[QwikLab: Analyze Big Data with Hadoop](https://awseducate.qwiklabs.com/home?locale=en)

Time: 50min

In this lab, I know that Amazon EMR not only can support powerful Hadoop tools, but also can manage service effictively to run Apache Hadoop and Spark to process massive data. During deploying a fully functional Hadoop cluster by lauching an Amazon EMR cluster, I learnt that HiveQL is a SQL-like scipting language for data warehousing and analysis. And I find that the advantage of hive is that the learning cost is low, and the simple MapReduce statistics can be quickly realized by the SQL-like statement. It is not necessary to develop a dedicated MapReduce application, which is very suitable for statistical analysis of the data warehouse.

****

### Intermediate Level

*Data Storage part*:

[QwikLab: Intro to S3](https://awseducate.qwiklabs.com/focuses/30?parent=catalog)

Time: 45min

According to this quicklab, I know that Amazon S3 is storage for the Internet. I can use Amazon S3 to store and retrieve any amount of data at any time, from anywhere on the website.

**Task 1: Create a Bucket**

In this task I create an Amazon S3 Bucket and I know enery object in Amazon S3 is stored in a bucket.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-29%2023.12.32.png?raw=true)

**Task 2: Upload an Object to the Bucket**

An object can be any kind of file: txt, photo, video, etc. After adding an object to Amazon S3, I can set permissions to control access to the object.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-29%2023.14.42.png?raw=true)

**Task 3: Make Your Object Public**

I configure permissions on my objects so that it is publucly accessible.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-29%2023.15.39.png?raw=true)

**Task 4: Create a Bucket Policy**

Bucket policy can be used to control access to a whole bucket or to specific directories within a Bucket.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-29%2023.23.23.png?raw=true)

**Task 5: Explore Versioning**

We can use versioning to preserve, retrieve, and restore every version of every object stored in Amazon S3 Bucket.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-29%2023.27.06.png?raw=true)

****

[QwikLab: Intro to Amazon Redshift ](https://awseducate.qwiklabs.com/focuses/28?parent=catalog)

Time: 45min

Task1: Launch an Amazon Redshift Cluster.

The node type determines the CPU, RAM, storage capacity, and sorage drive type for each node. The role grants permission for Amazon Redshift to read data from Amazon S3.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-12-06%2022.40.42.png?raw=true)

Task2: Launch Pgweb to Communicate with your Redshift Cluster

Amazon Redshift can be used via industry-standard SQL. Pgweb can provide a friendly interface to Redshift. 

Task3: Create a Table 
Create a table in Redshift through executing SQL commands. 

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-12-06%2022.57.14.png?raw=true)

Task4: Load Smaple Data from Amazon S3

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-12-06%2023.08.17.png?raw=true)

Task5: Query Data
Query the data using SQL select statements and queries.

Challenge: write a query for these requirements.

```
SELECT firstname, lastname
FROM users
WHERE liketheatre AND likeclassical AND lastname = 'Smith';
```
![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-12-06%2023.09.34.png?raw=true)

Amazon Redshift handles large scale data sets and database migrations.Redshift differs from Amazon's other hosted database offering, Amazon RDS, in its ability to handle analytic workloads on big data data sets stored by a column-oriented DBMS principle.

****

*Big Data Analytics part*:

[Video: Short AWS Machine Learning Overview](https://www.youtube.com/watch?v=soG1B4jMl2s)

Time: 10min

There are three layers of the machine learning stack in AWS. Experts who are comfortable building and training their own machine learning models can take advantage of AWS’s Framework & Interfaces layer. Developers and data scientists can leverage AWS’s ML Platforms layer using Amazon SageMaker to build, train, and deploy machine learning models without having specialized expertise in ML or having to think about the infrastructure like you would at the Framework & Interface layer. Developers who want to make calls to APIs to add machine learning services to their applications without building and training their own models can take advantage of the Application Services layer. Simply call APIs to perform image processing, voice recognition, video processing, speech synthesis, or other machine learning services.

[AWS Tutorial: Analyze Big Data with Hadoop](https://aws.amazon.com/getting-started/projects/analyze-big-data/?trk=gs_card)

Time: 60min

From this project lab, I learnt that with EMR File System (EMRFS), Amazon EMR gives Hadoop the ability to directly access data stored in Amazon S3, just like when using an HDFS file system. In a cluster, I can use HDFS or Amazon S3 as a file system. Amazon S3 is most commonly used to store input and output data and intermediate results stored in HDFS. 

Hadoop MapReduce is an open source programming model for distributed computing. The Map function maps data to a series of key-value pairs called intermediate results. The Reduce function summarizes these intermediate results, applies other calculations, and produces the final output. There are several frameworks available for MapReduce, such as Hive that automatically generate Map and Reduce programs.

Here are some details to note when we launch a cluster using the Quick cluster configuration page in the Amazon EMR console.

* Logging can only be enabled when we create the cluster and the setting can't be changed later. 

* Some Amazon EMR features and applications may not be available when using earlier Amazon EMR release versions, so recommend to use the latest release version whenever possible.

* Terminate the Cluster and Delete the Bucket are important. 

Traditional big data solutions are not desirable when the amount of data rises above the processor's processing limit. Hadoop uses MapReduce algorithm to run programs, and data is placed in parallel processing on different CPU nodes. In short, Hadoop can run programs on computer clusters, which can realize complex statistical analysis of huge data.

****

[QwikLab: Intro to Amazon Machine Learning](https://awseducate.qwiklabs.com/focuses/27?parent=catalog)

Time: 60min

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/overview.png?raw=true)

From this lab, I find I can create multiple models from a single datasource, which is useful when evaluating whether the parameters used to create one model perform better or worse than the parameters used to create a second model. Evaluating the performance of a model is a key step in the process, and it is not uncommon to iterate over several models before landing on the one that generate the most accurate predictions.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-12-08%2000.28.57.png?raw=true)

There is a critical step to evaluate the model. The datasource used to create the model is actually split into two different data sets. The first, which consists of 70% of the data, is used to train the model. The second, which consists of 30% of the data, is used to evaluate the model.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-12-08%2000.45.23.png?raw=true)

While it might seem counterintuitive, you actually do not want to see the model correctly predict the target values 100% of the time. This is because it could be a sign that the model is over-fitted, which means that instead of generalizin, the model is just memorizing the dataset used to train it.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-12-08%2000.47.53.png?raw=true)

At task 5, I know that there are two ways to generate predictions from an ML model: batch mode and real-time mode. In batch mode, I can define a new datasource consisting of the obervations for which you want to generate predictions. And the second way to generate predictions is in real-time. This is the approach as the predictions I want to generate are based on information being submitted through the web application. To do this we must enable real-time predictions for our model.

It is worth mentioning that a datasource does not store a copy of your input data. Instead, it stores a reference to the Amazon S3 location where your input data resides. If you move or change the Amazon S3 file, Amazon ML cannot access or use it to create a ML model, generate evaluations, or generate predictions.

****

[AWS Tutorial: Build a Machine Learning Model](https://aws.amazon.com/getting-started/projects/build-machine-learning-model/?trk=gs_card)

Time: 30min

Step 1: Prepare Your Data. At this step, I find getting the data and ensuring that the data has the correct format is the first step in machine learning.

Step 2: Create a training datasource. In order to create a datasource, what we need to provide are the Amazon S3 location of your data and permission to access the data; the schema, which includes the names of the attributes in the data and the type of each attribute and the name of the attribute that contains the answer that you want Amazon ML to learn to predict, the target attribute.

Here, a new concept has emerged, schema. A schema is the information Amazon ML needs to interpret the input data for an ML model, including attribute names and their assigned data types, and the names of special attributes.

Step 3: Create an ML Model. Amazon almost do everything for us...

Step 4: Review the ML Model's Predictive Performance and Set a Score Threshold. It is not difficult to see that this step is very necessary. We need to see if the model is sufficient for use. Amazon ML calculates an industry-standard quality metric called the area under the curve metric that represents the performance quality of the ML model. Amazon ML also parses AUC metrics to let you know if the quality of ML models is sufficient for most machine learning applications. Amazon ML gives us the conditions to optimize model prediction performance.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-12-08%2001.44.39.png?raw=true)

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-12-08%2001.46.23.png?raw=true)

Step 5: Use the ML Model to Generate Predictions. Use batch predictions for applications that require predictions for set of observations or predictions that don't use results interactively. In this lab, the price of the batch prediction is about 1 dollar per 10,000 predictions.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-12-08%2002.04.56.png?raw=true)

Step 6: Clean Up. To avoid accruing additional Amazon Simple Storage Service charges, delete the data stored in Amazon S3. 

****

[Video Tutorial: Overview of AWS SageMaker](https://www.youtube.com/watch?v=ym7NEYEx9x4&index=12&list=RDMWhrLw7YK38)

From the video, what I learned that SageMaker is geared toward data scientists, online training models, publishing models, and tools for applications. It is clearly positioned to be used by data scientists or developers under the guidance, so it is called the Sage Maker.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/v2-2ed3ac89d22b7210c4b6a704bfdb4679_hd.jpg?raw=true)

SageMaker connects applications, especially unstructured video, speech, and linguistic text-related applications, based on infrastructure and algorithms.

SageMaker is very sensible to focus on the training model and release model, let the data scientist do the programming work to be targeted, rather than forcing a very versatile model, but found that it can not be applied.

Essentially SageMaker is based on a distributed platform, so performance is much more powerful than stand-alone performance. When the amount of data is huge, you should also imitate it. The bottom layer is implemented by TensorFlow, MXNet or Spark. The upper layer is abstracted into model initialization, parameters, training and deployment.

****

[]()




















****

## Cloud Web Applications

### Beginner Level

****

[AWS Tutorial: Launch a VM](https://aws.amazon.com/getting-started/tutorials/launch-a-virtual-machine/)

Time: 30 min

I have learned how to launch, configure, connect, and terminate an instance in the cloud.

![](https://github.com/haoduoding/dist-sys-practice/blob/master/lab%20screenshots/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-10-29%2022.54.41.png?raw=true)

* **Terminology:** 

**Download key pair to securely access your Linux instance using SSH.**

```mv ~/Downloads/MyKeyPair.pem ~/.ssh/MyKeyPair.pem```

**Connect to your Instance**

```ssh -i ~/.ssh/MyKeyPair.pem ec2-user@{IP_Address} (ex. ssh -i ~/.ssh/MyKeyPair.pem ec2-user@52.27.212.125)```

****

[QwikLab: Intro to S3](https://awseducate.qwiklabs.com/focuses/30?parent=catalog)

I finished this part before at Intermediate level of BIg Data and Machine Learning.

****

### Intermediate Level

****

[Video: Virtualization](https://www.youtube.com/watch?v=GIdVRB5yNsk)

Time: 10min

From this video, we can learn that the operating system is capable of performing operations that the application cannot perform in case the application crashes the computer accidentally or maliciously. **Kernel mode** and **hypervisor mode** are the hardware implementation of this machanism. And for **Hypervisor**, also known as virtual machine monitor (VMM), is software, firmware, or hardware used to build and execute virtual machines.

****

[AWS Tutorial: Install a LAMP Web Server on Amazon Linux 2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html)

