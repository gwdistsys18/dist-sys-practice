# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1
### 1. [Introduction to SDN](https://www.youtube.com/watch?v=DiChnu_PAzA)(done in 30 minutes).
+ Big picture: make network open and programmable.
+ Pretty much like computer system model which contains three levels: low level hardware, operation system, high level applications.
+ SND model change the middle layer to Network Operating System (SDN controller).
+ SND controller talk to forwarding devices which could be treated as hardwares.
+ Packet flow: phase the packet header, push the information to the device, SDN controller translate it to forwarding device to do operating on the packet.
+ SDN controller provides some kinds of abstraction of the network.
+ "SouthBound Interface" - some kind of protocols which SDN controller could use to communicate with forwarding devices. Example: **OpenFlow**.
+ SND Controller provides: Topology service, Inventory service, Statistic service and Host tracking. 
+ Application interface provides some kinds of API such as Java API.
+ This environment enables the network to be treated to be a shared resource to different workloads.
+ Clustering: have a cluster of systems that can load balanced workloads instead of a single system. (availability and scalability)
+ Separate to different regions and each has a SDN controller.
+ SDN controllers can be designed in hierarchy. 

### 2. [Tutorial: Using the OpenDaylight SDN Controller with the Mininet Network Emulator](http://www.brianlinkletter.com/using-the-opendaylight-sdn-controller-with-the-mininet-network-emulator/) (done around 2 hours)
+ Set up mininet network simulator in virtual box. (the virtual box change the menu a bit so the host-only networks are in 'file' menu). We need two networks for the virtual machine. On connect to the NAT and the other on should connect to the host which is my laptop.
+ The Ubuntu img with mininet which is provided by the author is not usable. I got the latest version of mininet VM and it works fine.
+ The OpenDaylight tutorial is not so correct. I used openjdk-8-jre-headless then everything worked out.
+ When testing the mininet along with OpenDaylight. More attention should be paid on the ip addresses.
+ It takes a really long time for the Yang data structure to came out.

### 3. [Video: OpenNetVM NFV platform](https://www.youtube.com/watch?v=7FoZywcxbYg) (done in 30 minutes)
+ SDN: focus on the control plane of the network. (How to router a package.)
+ Send the first package to the SDN server and SDN server will return a rule.
+ NFV: focus on the data plane. (How to process a package.)
+ The main idea is how to run the NFVs run as fast as the hardware do. (NFV can provide more flexibility)
+ Software-base Networking: SDN + NFV
+ Operating systems are very bad on processing large amount of packages.
+ Network hardware: Fast, expensive, inflexible.
+ We can hide most of the complexity of the system for example providing TCP, UDP layers.
+ For Linux package processing, the package copy and interrupts could be very high.
+ DPDK: make the package data from the NIC goes direct to a user space buffer. (using a special driver)
+ Using polling instead of interrupts.
+ Key idea of OpenNetVM: get data from NIC direct to a user level shared memory. With no copy.
+ Using share memory (ring buffers) to avoid locking
+ SDN controller provides a high level set of possible rules, the NF choose a specific one to use.

### 4. [Usenix Conference: Netmap](https://www.youtube.com/watch?v=la5kzNhqhGs) (done in 1 hour)
+ Direct packet I/O options: sockets (flexible, portable but slow), memory mapped buffer (efficient if no mbufs/skbufs), within the kernel (fast but could be dangerous), custom library (tied to vendor hardware).
+ The bottle neck of network stack: system calls, device programming, complex mbufs (mbuf has very different structures), data copy and mem_alloc
+ Netmap provides security and some level isolation.
+ The policy which ring associated to which core is decided by the user.
+ Using a shared memory region for all interfaces which means 0 copy, which reduce the copy overheads.
+ Using batch to reduce the number of system calls used.

### 5. Install and run some test using dpdk
+ Before compiling dpdk source code, make sure the ubuntu kernel is later than 3.2 and make sure GCC, Cmake, etc is installed.
+ Config and compile dpdk from source code on the server of Cloudlab. 
+ Make install will create a x86_64-native-linux-app file and copy all of the binary files into is. While it will be put into build if using make conifg then make. And this may casue some problems when running other tests.
+ For testing dpdk, I have used a simple test: helloworld which is in dpdk/example/helloworld. 
+ Before compiling helloworld, bind dpdk to the NIC using dpdk_devbind.py.
+ Be sure the environment variables (RTE_SDK and RTE_TARGET) are set correctly.
+ The helloworld has the result below:
![helloworld](/src/helloworld.png)
+ Before starting the skeleton test, we should bind another NIC port to dpdk. Because skeleton test requires even number of ports. The result of the test would be like below:
![skeleton](/src/skeleton.png)

### 6. Install and run the openNetVM.
+ I must disable the network interface in the kernel and then bind the port to igb_uio.
+ I have binded eth1 and eth3 to dpdk.
+ I have also run the openNetVM manager and speed_test NF successfully. The result will like below.
![onvm](/src/onvm.png)
+ To fix the issue 50, we can simply insert a line before SimpleHTTPServer is called to change the working directory to where the start_web_console.sh is. The code will be as bellow.
```
function usage {
    echo "$0 [-p WEB-PORT-NUMBER]"
    exit 1
}

web_port=8080

while getopts "p:" opt; do
    case $opt in
        p) web_port="$OPTARG";;
        \?) echo "Unknown option -$OPTARG" && usage
            ;;
    esac
done


# Start ONVM web stats console at http://localhost:<port num>
echo -n "Starting openNetVM Web Stats Console at http://localhost:"
echo $web_port

cd $(dirname "$0")
nohup python -m SimpleHTTPServer $web_port &
export ONVM_WEB_PID=$!
```

## Big Data and Machine Learning
### 1. [Hadoop Intro](https://www.youtube.com/watch?v=jKCj4BxGTi8&feature=youtu.be)
+ Data computation is conplex which depend on the available powers on the available computers. (Bottle Neck)
+ Solution of dealing with growing data: distributed system (multiple computer are used for a single task).
+ Challenges of distributed system: high chance of system failure, limit of bandwidth, high programming complexity. -- hadoop are used to accomplish these challenges. It is reliable, scalable, flexible and economical.
+ data center -> computer (traditional RDBMS) vs computer -> data center (hadoop). 
+ HDFS: when the data is stored first get distributed and then get processed.
+ HBASe store data to HDFS, it is a NoSQL database, provide random real-time, read and write access to big data, support high volume and high throughput of data.
+ Sqoop is used to transfer data between hadoop and relational database servers. 
+ Spark: process hdfs data. Major components: Spark core and Resilient Distributed Datasets(RDD), Spark SQL, Spark Streaming, Machine learning library, GraphX.
+ Hadoop map reduce: based on map and reduce programming model and have an extensive and mature fault tolerance framework.
+ Big, Impala and Hive: used to do data analytics.
+ After the data has been anayzed the user can use Cloudera search to access the result.
+ Ooize is a workflow or coordination system used to manage hadoop jpbs.
+ Hue: a web interface for users. 
+ Four stages for big data processing: Ingest (data are transfer to hadoop form various sources), processing (data is stored and processed), analyze (data is analyzed by processing frameworks), access (the analyzed data can be accessed by users).

### 2. [QwikLab: Analyze Big Data with Hadoop](https://awseducate.qwiklabs.com/focuses/19?parent=catalog)
+ This tutorial gives me a brief view of how to deploy a hadoop cluster and use it to run some scripts to analyze some datasets.
+ I have created an Amazon S3 bucket to store the reault of Hive script and launch a hadoop cluster to process data.
+ The dataset used in this task is the log data from CloudFront. It contains about 5000 rows of data. It is relatively small, as a result the time used to process this dataset is less than 1 minutes.
+ The Hive script first create a table which correspond to the dataset. Then it will use RegEx SerDe to parse these data. Finally, select and count the records whose dateobject is between '2014-07-05' and '2014-08-05'.
+ The result of the Hive script would be stored under the os_requests directory of the bucket we created before. The result would be like:
```
Android	   855
Linux      813
MacOS      852
OSX        799
Windows    883
iOS        794
```
## Docker and Containers
### 1. [Vedio: Why Docker](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)
+ Mainframe to PC (90's); Baremetal to Virtual (00's); Datacenter to Cloud (10's); Containers (now)
+ Docker is about speed.
+ Dealing with multiple applications which has its own environment and maybe running on different platforms. 
+ Docker helps maintain the applications or softwares.
+ ... (boring things)

### 2. [Lab: DevOps Docker Beginners Guide](https://training.play-with-docker.com/ops-s1-hello/)
+ The first time I start the Docker, I have no images stored locally. As a result, Docker engine goes to its default Docker registry to look for an image named "hello-world".
+ Docker is different from virtual machine because VM is pretty much a hardware abstraction while a contain is an application abstraction. 
+ ``` docker container run -it alpine /bin/sh ``` could run a Linux shell inside the container. And I can run some Linux commands on it. 
+ Docker basically using ```docker run``` command to start a container and run something on it.
+ Every time I use ```docker run``` to start a container, it is a separate container. Each container has a separate file system and runs in a different namespace. And by default there is no way for a container to communicate with another container.
+ I can use ```docker container start <container ID>``` to start the container again. And then I can see the hello.txt file I have created. 
![docker](/src/docker.png)

### 3. Container
#### 3.1 [Video: What are Containers?](https://www.youtube.com/watch?v=EnJ7qX9fkcU)
+ Basically a sandbox for a process. Sandbox -> process has its own process namespace; Cgourps (capabilities, resources, etc).
+ Container is used: one processor one container. The container process and container itself is tied. 
+ Contianer image: binary representation. Images are arranged in some kind of hierarchy. There are multiple advantages for that: 
> 1. share images 
> 2. allows you to concentrate specific things in specific place.
+ Image -> class; runtime application -> instances 
+ Dockerfile: an environment in a file. The start of a Dockerfile is always FROM.
+ We use Dockerfile and Docker build to create image tree which is used to create the instance we want.
+ Don't have to start with Dockerfile, we can make some changes in the instances and then commit it as an image and use that image to create more containers.
+ When running a container, container hold pretty much dependencies on this own.
+ Only pull and push the bits it needs (binary). The Docker Host has a image cache which contains the images.
+ There is a client manages the lifecycle of containers inside the Docker Host. It also designed to configure the infrastructure inside the DockerHost
> 1. Network configuration (kind of like network visualization)
> 2. Storage configuration 

#### 3.2 [Video: VMs Versus Containers](https://www.youtube.com/watch?v=L1ie8negCjc)
+ Virtual machine basically talks to a virtual hardware layer.
+ User can size the virtual machine. (workload, operating system)
+ Hypervisor hides all of the hardware from the operating system above it.
+ The Docker engine is loaded in the operating system. 
+ Container image contains the application and operating system dependencies. while the operating system dependencies are part of the operating system of the virtual machine.
+ It will be better to combine container with the virtual machine and still have some kind of hypervisor to deal with all of the drivers and interact with hardware. This will reduce the load of the operating system. 

#### 3.3 [Lab: Docker Intro](https://training.play-with-docker.com/beginner-linux/)
+ After cloned the Github repo, I have run several simple Docker containers: ![task 1.1](/src/task_1.1.png) After the ```hostname``` is executed, the container stops. However, Docker will not reclaim the resources by default. As a result, we can see the container is still exists in the ```Exited``` state. ![task 1.2](/src/task_1.2.png)
+ I have tried to run a Ubuntu container use the command ``` docker container run --interactive --tty --rm ubuntu bash``` 
> 1. ```--interactive``` -> starts an interactive section.
> 2. ```--tty```         -> allocates a pseudo-tty.
> 3. ```--rm```          -> remove the container after it's done executing.
+ The result would be like: ![task_ubuntu](/src/task_ubuntu.png)
+ Use the command ```docker container run --detach --name mydb -e MYSQL_ROOT_PASSWORD=my-secret-pw mysql:latest```
> 1. ```--detach``` -> run a container in the background
> 2. ```--name``` -> give it a name. 
> 3. ```-e``` -> use an environment variable to specify the root password. 
+ Use several commands like: ```docker container ls```; ```docker container logs mydb```; etc to check the information of the mysql container. 
+ Use ```docker exec -it mydb sh``` to connect to a new shell process inside the already running container. Then we could use Mysql commands to do whatever we want. ![task_mysql](/src/task_mysql.png)
+ Run the command: ```docker image build --tag $DOCKERID/linux_tweet_app:1.0 .``` to create a new Docker image using the instructions in the Dockerfile.
+ Use ```docker container run --detach --publish 80:80 --name linux_tweet_app $DOCKER/linux_tweet_app:1.0``` to create a new container from the image we just created. Then the website is running ![website_img](/src/website_img.png)
+ Docker provides some kind of ways to mount a file or a directory on the host machine into a container running on the same host.
+ Start the web app using bind mount ```docker container run --detach --publish 80:80 --name linux_tweet_app --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html $DOCKERID/linux_tweet_app:1.0```
+ Then if we change the layout of the website, it will automatically reflect on the website. ![web_bindMount](/src/web_bindMount.png)
+ We can also push the img we created to the DockerHub. ![Docker_hub](/src/Docker_hub.png)

#### 3.4 [Lab: Doing more with Docker Images](https://training.play-with-docker.com/ops-s1-images/)
+ We can use ```docker container commit <CONTAINER_ID>``` to create an image locally on the system running the Docker engine.
+ Then we can run a container based on the image we just created: ![new_container](/src/new_container.png)
+ Instead creating a static binary image, we can also called Dockerfile to create an image. 
+ Create a "index.js" file contains content below:
```
var os = require("os");
var hostname = os.hostname();
console.log("hello from " + hostname);
```
+ Create a "Dockerfile" which contains content below:
```
FROM alpine
RUN apk update && apk add nodejs
COPY . /app
WORKDIR /app
CMD ["node","index.js"]
```
+ Then we can build the image based on the Dockerfile we just created. ```docker image build -t hello:v0.1 .``` Successfull! ![Dockerfile](/src/Dockerfile.png)
+ We can use ```docker image inspection <image ID>``` to inpsect the deal of an image.
+ Our "Hello" image has 3 layers: 
> 1. the basic Apline layer; 
> 2. the RUN command which install some packages;
> 3. the COPY command to add the javascript code. 

#### 3.5 [Video: VMs Versus Containers Deep Dive](https://www.youtube.com/watch?v=PoiXuVnSxfE)

### 4. Networking and Orchestration
#### 4.1 [Lab: Docker Networking](https://training.play-with-docker.com/docker-networking-hol/)
+ We can inspect the container information using the command like 
> 1. ```docker info```
> 2. ```docker network ls ```
> 3. ```docker network inspect bridge```
> 4. ```docker network```
+ We have to have the Linux bridge installed. Use ```brctl show ``` and ```ip a ``` to list the details of the bridges on Docker host and view details of a specific bridge.
+ Then create a new container using ```docker run -dt sleep infinity``` and keep it running in the background.
+ The bridge we created before will be added to the bridge network since no ```docker run``` has been called.
+ We can get the ip address of the container using the command ```docker network inspect bridge```. Then we can test the connectivity by ping the ip address of the container. Success! ![network_test](/src/network_test.png)
+ We can also test whether the container are connect to the outside world after we run a shell in the container. We can use ```docker ps``` to get container ID and use ```docker exec -it <container ID> /ID/bash```. ![ping_github](/src/ping_github.png)
+ To configure NAT for external connectivity, we need to start a new container based on NGINX image. And make sure it maps port 8080 on all container ins running inside the `web1` container 
+ I have initialized a new Swarm and make two nodes part of it using command ```docker swarm init --advertise-addr $(hostname -i)``` and the ```docker swarm join ...``` command which the former command generates. ![swarm](/src/swarm.png)
+ After got the Swarm working, we can create a new overlay network using ```docker network create -d overlay <name>```
+ Then create a service using ```docker service create --name <name> --network <network name> --replicate 2 ubuntu sleep infinity```. As we create two replicates, we will see two service running on two nodes. ![service](/src/service.png)
+ We can open a shell in the container 1 to ping container 2 to see the connectivity. ![ping_2](/src/ping_2.png)
+ We can also test the connectivity between containers and the service we have created. ![ping3](/src/ping3.png)

#### 4.2 [Lab: Swarm Mode Introduction](https://training.play-with-docker.com/ops-s1-swarm-intro/)
+ Docker Compose and Swarm Mode
> + Compose: is used to control multiple containers on a single system. Basically is a text file which describes the application.
> + Swarm Mode: Tells Docker you will run many Docker engines and you want to coordinate between them. 
+ Initialize Swarm using ```docker swarm init --advertise-addr $(hostname -i)```. (manager) It will automatically generates a docker swarm join command which could be used in other containers. (worker)
+ We are going to run a voting application to test the Swarm environment we have.
+ Stack is a group of service that are deployed together. Each individual service could be made up of one or multiple containers. (tasks)
+ Use ```docker stack deploy --compose-file=docker-stack.yml voting_stack``` to deploy all of the services (or tasks).
+ It is very convenient for us to make a replicate of one service. Just use the service scaling command. ```docker service scale voting_stack_vote=5``` 
+ There are several visual result we can get. 
+ 1. The voting UI 
![voting](/src/voting.png)
+ 2. The Swarm visualization 
![Swarm_vi](/src/Swarm_vi.png)


#### 4.3 [Video: Kubernetes vs Swarm](https://www.youtube.com/watch?v=L8xuFG49Fac)

#### 4.4 [Video: Kubernetes in 5 Minutes](https://www.youtube.com/watch?v=PH-2FfFD2PU)

#### 4.5 [Kubernetes](https://kubernetes.io/)

#### 4.6 install Docker on a cluster of EC2 VMs and use Kubernetes to orchestrate them
