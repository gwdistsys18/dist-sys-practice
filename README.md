# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 container and dockers
***
>[why docker? why now?](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)

*company shift
dot cloud to docker inc
- containers are the next once-in-a-decade shift in infrastructure and process that mak or break you
### diferent period different focus
- 90s PC wave where we sifted from a traditional mainframe to a pc distrubuted architecture 
- 00s baremetal to virual  virtuliazation because our servers were too powerful 
- 10s datacenter to cloud, amazon released the AWS solution that was the first i real idea we had
- now host to container(serverless)
>like all these shifts, migrating is the hard part, and docker is focused on the migration experience

### what will docker do for me?
- speed
that is all about speed and in fact all these major shifts and infrastructure have always been about speed, about the speed of software deployments, the speed of business and getting things done in a company profit. you will see big benefits in all these areas as you adopt the various tools of the ecosystem, but it really covers the entire life cycle of the software management and this gets us to the matrix of health story which is really around if you don't have containers.
allow you run and test the software the same way everywhere  you are running
don't need to speed too much time to the existing problem, so allowing us to get more of our time back to innovate

- cost
reduction in VM cosets
fewer CPU's
multible averge cpu utilization

***spent 20 min***

***tips:docker project arre open-source, have a party in the march for celebrating docker releasing and we have soort of party with birthday cake and have fun and have workshops***



---

>[Lab: Devops Docker Beginners Guide](https://training.play-with-docker.com/ops-s1-hello/)

### running your first container
+ type uname -a 
  it will show: 
  >Linux node1 4.4.0-138-generic #164-Ubuntu SMP Tue Oct 2 17:16:02 UTC 2018 x86_64 Linux
+ type docker container run hello-world
  they will have 3 step
the Docker engine running in your terminal tried to find an image named hello-world. Since you just got started there are no images stored locally (Unable to find image...) so Docker engine goes to its default Docker registry, which is Docker Store, to look for an image named “hello-world”. It finds the image there, pulls it down, and then runs it in a container.

### docker images
use alpine as a train container
+ type docker images pull alpine
  it will pull from library/alpine
+ type docker images ls
  you can find all images in the local host
+ use docker container run command to run it (docker container run alpine ls -l)
  when the whole running, the container will shut down
*** Docker containers function at the application layer so they skip most of the steps VMs require and just run what is required for the app. Now you know why they say containers are fast!***
+  docker container run -it alpine /bin/sh
  we can boot a small linux system, and now will are inside it. and wo can use several linux command 
  ***we can use ctrl+d to exit***
+type docker container ls
 you can find the container's condition when now existing
 +type docker container ls -a
 it will show history
 
 ### container Isolation
 + docker container run -it alpine /bin/ash
 use it go inside, and create a hello.txt file inside, 
 + docker container run alpine ls
 but can not find hello.txt because each container is isolated.
docker users take advantage of this feature not only for security, but to test the effects of making application changes. Isolation allows users to quickly create separate, isolated test copies of an application or service and have them run side-by-side without interfering with one another. In fact, there is a whole lifecycle where users take their changes and move them up to production using this basic concept and the built-in capabilities of Docker Enteprise.
***if we want use the last container, we can use docker container start <id> tor restart and then use doceker exec <id> ls to find that***

**spend 2 hour**

---
### [what is a container](https://www.youtube.com/watch?v=EnJ7qX9fkcU)
+ container to some extend is used to cover a multitude of things that's one of the things that i think is a little bit confusing about it so let's start the very most simple the very simplest form of water container is so here*we have an operating system, and for argument's sake let's say that it's Linux, inside operating system you can run processes, processes share an address space they share a process name space they share pretty much everything now that's useful absolutely. you will running all sorts of things inside of all these operating systems. it's designed to do that it's designed to schedule these things and that's all well and good. however waht if you actually want to isolate process from one of the other processes what if you want some kind of sandbox for that process to run. 
+ sandbox is that the process for start has its own process namespace and okay so when you if i were to get a shell into this container i would see just the processes running inside of that container. it has own process name space. we also have c group which allows us to also restrict what this process is able to do. there are certain capabilities there are certain resource limits that we can apply this container and that allows us for a certain degree of isolation when it's combined with the process namespace and that's the most fundamental notion of the runtime definition of a container.
+ one process per containers that a container is used in the docker sense and in most cases that you will see the container process is actually completely tied in with the lifecycle of the container itself. *the container process when the container process exits the container ends*
+ container can run the instances of image

+ docker host used to save imagem to make sure image's safe. also designed to be able to configure the infrastructure inside of this docker host as well so it's not only container lifecycle management but it is also able to do network configuration and storage configuration so what i mean by network and storage configuration well inside of thi docker. host docker will set up certain kinds of networking right.
+ volume is very simply a persistent area of storage so container will have or may have a volume if it wants to persist any data beyond the lifecycle of the container.
spent 30 min

---
### [containers and vms - a practical comparson](https://www.youtube.com/watch?v=L1ie8negCjc)

+ supervisor: interact different types of NIC cards from all different types of hardware right same thing from a storage perspective
+ keeps this operating system in effect pretty simple
+ you can size it
+ container can package up all those dependencies as a part of the docker file where that container image runs
+ VM through hypervisor to create virtual hardware eviroment and then run operating system
+ container  through namespace and Cgroup to divide a new environment based on a same kernel.
spent 30 min

---
### [docker intro](https://training.play-with-docker.com/beginner-linux/)
+Run a single task in an Alpine Linux container(same in Lab: Devops Docker Beginners Guide)

+ run an interactive ubuntu container
interactive says you want an interactive session.
tty allocates a pseudo-tty.
rm tells Docker to go ahead and remove the container when it’s done executing.
The first two parameters allow you to interact with the Docker container same as (-it).


 + Run a background MySQL container 
  
  docker container run \
 --detach \
 --name mydb \
 -e MYSQL_ROOT_PASSWORD=my-secret-pw \
 mysql:latest
--detach will run the container in the background.
--name will name it mydb.
-e will use an environment variable to specify the root password (NOTE: This should never be done in production).
You can check what’s happening in your containers by using a couple of built-in Docker commands: docker container logs and docker container top

+ build a simple website image

  Make sure you’re in the linux_tweet_app directory.
  Display the contents of the Dockerfile.
  In order to make the following commands more copy/paste friendly, export an environment variable containing your DockerID (if you don’t have a DockerID you can get one for free via Docker Cloud).

You will have to manually type this command as it requires your unique DockerID.

export DOCKERID=<your docker id>
  Use the docker image build command to create a new Docker image using the instructions in the Dockerfile.
  
  Use the docker container run command to start a new container from the image you created.

As this container will be running an NGINX web server, we’ll use the --publish flag to publish port 80 inside the container onto port 80 on the host. This will allow traffic coming in to the Docker host on port 80 to be directed to port 80 in the container. The format of the --publish flag is host_port:container_port.

 docker container run \
 --detach \
 --publish 80:80 \
 --name linux_tweet_app \
 $DOCKERID/linux_tweet_app:1.0
Any external traffic coming into the server on port 80 will now be directed into the container on port 80.

In a later step you will see how to map traffic from two different ports - this is necessary when two containers use the same port to communicate since you can only expose the port once on the host.

Click here to load the website which should be running.

Once you’ve accessed your website, shut it down and remove it.



+ Modify a running website
use vi to modify index 
+ update the image
 docker container run \
 --detach \
 --publish 80:80 \
 --name linux_tweet_app \
 $DOCKERID/linux_tweet_app:2.0
 update so fast, because juset update changes
 can run both version by different port
 
+ push your images to docker hub
after login, you can use docker image push to submit your image to your docker hub
  spent 1 hours
 ---
 ### [doing more with docker images](https://training.play-with-docker.com/ops-s1-images/)
+ Image creation from a container
 1. create a new container
 2. build your own operating system(can you docker container idff <id> to see what changes)
 3. commit
 4. docker image tag to change the image's name
+ Image creation using a Dockerfile
  
 1. write a code file
 2. write a dockfile as script
 3. use docker image build to change the image
 4. pull 
 
 ---
 ### [Lightboard VMs vs. Containers: Advanced Deep Dive](https://www.youtube.com/watch?v=PoiXuVnSxfE)
 +containers in VM can be complimentary as containers can run in side virtual machines in a virtual machine everythingbut the hardware is comprised inside the disk image that makes up the virtual  machine meaning the inside of this image we have the kernel the init system the user space programs and the application themselves. this depending on the size of the user space and the applicatioon can range from hundreds of megabytes to tens of gigabytes in a container depending on the type the application we have inside it. the size can range from tens of megabytes up to gigabytes.
 + if e have applications that lend themself very well being containerized like golang applications we might have containers that are very small in size even in the single digists digits of megabytes if we have traditional application we may end up with containers that are as big as virtual machines disk images.
+ in a VM the process of isolation is very straightforward because what we have is we have boundaries that are created outside the X86 platform meaning that every process included in the kernel the init system and even the bias or the efi subsystem a running inside a sandbox. 
+ VM include process user space kernel+ INIT and EFI, but container just include process.

---

### [Docker Networking Hands-on Lab](https://training.play-with-docker.com/docker-networking-hol/)
+ The docker network command is the main command for configuring and managing container networks. Run the docker network command from the first terminal.
+ Run a docker network ls command to view existing container networks on the current Docker host.
+ The docker network inspect command is used to view network configuration details. These details include; name, ID, driver, IPAM driver, subnet info, connected containers, and more.
+ Every clean installation of Docker comes with a pre-built network called bridge. Verify this with the docker network ls
+ Install the brctl command and use it to list the Linux bridges on your Docker host. You can do this by running sudo apt-get install bridge-utils.
+ Then, list the bridges on your Docker host, by running brctl show.
+ You can also use the ip a command to view details of the docker0 bridge.
+ Create a new container by running docker run -dt ubuntu sleep infinity.


### [Swarm Mode Introduction for IT pros](https://training.play-with-docker.com/ops-s1-swarm-intro/)
+ Swarm Mode tells Docker that you will be running many Docker engines and you want to coordinate operations across all of them. Swarm mode combines the ability to not only define the application architecture, like Compose.
+ initialize your swarm
1. First thing we need to do is tell our Docker hosts we want to use Docker Swarm Mode.
   command: docker swarm init --advertise-addr $(hostname -i)
   add worker: docker swarm join --token SWMTKN-1-4aqqkimpge90ot4d57aphgdawlllbu0bciosv5tbfgq2ygafb2-6e1jj3inme140ctfkcaql824r          192.168.0.22:2377
   add manager:docker swarm join-token manager
2. show swarm members
   docker node ls
3. test app Clone the Voting App from github
4. deploy a stack
   A stack is a group of services that are deployed together: multiple containerized components of an application that run in separate instances. Each individual service can actually be made up of one or more containers, called tasks and then all the tasks & services together make up a stack.
   
5. Let’s list the tasks of the vote service
  docker service ps voting_stack_vote
6. scaling an application
  docker service scale voting_stack_vote=5
 spent 60 mins
---
### [docker swarm vs kubernetes](https://www.youtube.com/watch?v=L8xuFG49Fac)

+ Kubernetes is an open-source system for automating deployment, scaling, and management of containerized application.
+ swarm feature highlights:
1. cluster management intergrated with docker engine
2. decentralized design
3. deciarative service model
4. scalling

spent 10 mins

### kubernetes
+ kubernetes character:
1. portability: support individual cloud, public cloud, compose cloud, multi-cloud
2. expandaple: modularization, pluggable, mount, composability 
3. automation: auto-deploy, auto-restart, auto-copy, auto-extend

+ module
 master module
 >cluster control center always boot in a VM machine
1. kube-apiserver
2. ETCD
3. kube-controller-manager
4. cloud-controller-manager
5. plug-in addons
6. DNS
7. user interface
8. container monitor
9. cluster-level logging

+ Node
1. kubelet
2. kube-proxy
3. docker
4. rkt
5. supervisord
6. fluentd

spent 1 hours
---





## Area 2 Big Data and Machine learning 


[hadoop intro](https://www.youtube.com/watch?v=jKCj4BxGTi8&feature=youtu.be)

+ volume of data more and more huge
+ use ditributed system to solve larger data
+ challenges:
since multiple computers are used in the distributed system there are high chances of system failure. there is also a limit on the bandwith. programming comlexity is also high because it is difficult ot synchronized data and process.
hadoop solve this problem.

+ hadoop is framework taht allows for the distributed processing of large data sets across clusters of commodity computers using simple programming models. it is inspired by a technical document published by google the word. 

+ four characteristics
1. economical
ordinary computers can be used for data processing
2. reliable
stores copies of the data on different machines and is resistant to hardware failure
3. scalable
can follow both horizontal and vertical scaling
4. flexible
can store as much of the data and decide to use it later

+ hadoop brought a radical approach. in hadoop the program goes to the data not vice-versa. it initially distributes the dta to multiple systems and later runs the computation wherever the data is located.

+ three core componets processing resource management and storage.

+ HDFS is a storage layer for hadoop suitable for distributed storage and hadoop provides a command line interface to interact with HDFS
+ Hbase stores data in HDFS; a noSQL databse 
 mainly used when you need random, real-time, read/write access to your Big Data
provides support to high volumes of data and high throughout

+ sqoop is a tool designed to transfer data between Hadoop and relational database servers. it is used to import data from relational database such as, oracle and MySQl to HDFS and export data from HDFS to relational databases.
+ Flume A distributed service for ingesting streaming data; ideally suited for event data from multiple systems 
+ spark: an open-source cluster computing framework; provides 100 times faster performance as compared to MapReduce; Supports Machine learning, business intelligence, streaming, and batch processing
+ hadoop map reduce: the original hadoop processing engine which is primarily java based
+ Based on the map and reduce programming model
+ hadoop ecosystem. an open-source dataflow system converts pig script to map-reduce code an alternate to writing ma-reduce code best for ad-hoc quries like join and filter

+ impala to analyze data it is an open source high performance SQL engine which runs on Hadoop cluster. ideal for interactive analysis;very low latency; supports a dialect of SQL
+ Hive is an abstraction layer on top of Hadoop it's very similar to lmpala. ETL
+ cloudera search: one of cloudera's near-real-time access products
+ enables non-technical users to search and exploore data stored in or ingested into Hadoop and HBase
+ Oozie is a workflow or coordination system used to manage the hadoop jobs
+ Hue is an acronym for Hadoop user experience; Hue is an open source Web interface for analyzing data with Hadoop 
+ it provides SQL editors for Hive, lmpala, MySQL, oracle, postgreSQL, Spark SQL, and Solr SQL
+ Hue is an open source web interface for analyzing data with Hadoop

spent 1 hours
---
### [analyze big data with hadoop](https://awseducate.qwiklabs.com/focuses/19?parent=catalog)
+ step:
1. create bucket
2. create cluster 
3. add step
4. view from os_requests folder
5. end s3
6 end lab
















