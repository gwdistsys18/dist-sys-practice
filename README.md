# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 - Docker & Containers
### Beginner Courses:
#### Video: Why Docker? (10 min)
 - Docker is a major infrastructure shift.  Comparable to Mainframe --> PC shift in 1990s, Baremteal --> Virtual in 2000s, Datacenter --> Cloud in 2010s, and finally host --> containers currently (aka Docker).
 - Migration is the hard part, however Docker is built with migration in mind.
 - Why Docker?? Docker is all about speed!  Develop faster, build faster, test faster, deploy faster, etc.
 - Matrix from hell - Current applications have many different types, with different requirements, running on different machines with different operating systems, with different testing requirements, etc.  The "matrix from hell" is the matrix you get when you try to plot service by requirement for a large scale application.
 - Docker basically standardizes all of the above, so that every part of your application (e.g., database server, web server, front end server, etc, can all be run from within docker containers).  This means rather than having to spin up a specific type of system (e.g., a Linux server with MySQL version a.b.c running and ports e,f,g open), which is a different process from spining up an Apache webserver, in both cases all you have to do is spin up the right container
 - Docker is freeing up time typically spent on maintenance
 - Apps can be migrated into containers without code changes.  Containers is simply about optimizing the packaging and running of apps.

#### Lab: DevOps Docker Beginners Guide (1 hour)
 - Container is application abstraction, where as virtual machines are hardware abstraction
 - The Docker Registry is the location Docker looks to pull containers.  In the default case, it is the Docker Store.
 - The ```pull``` command fetches a conainer image from the registry and saves it on your system
 - the ```docker image``` command lets you interact with images loaded on the system
 - The ```docker container run``` command allows you to run an application within a specific container.  Once the application has run, the container shuts down.
 - If you want to keep a container alive in an interactive envornment, add the ```-it``` flag to the run command: ```docker container run -it```
 - The ```docker container ls``` command will list all running containers.  (add a ```-a``` flag to see containers run in the past)
 - every container is isolated unless you explicitly tell docker to start a specific container.  Note the container id's returned from the ```docker container ls```.  If you want to start a specific container, use the ```docker container start <container_id>``` command
 - If you want to interact with a running container, you can inject commands via ```docker container execute <container_id> <command>```

### Intermediate Courses:
#### Video: What are Containers? (20 min)
 - Container == Sandbox for a process
 - Typically, one process per container, and lifecycle of container == lifecycle of process
 - Containers images have a hierarchy
 - Dockerfile is basically an environment in a text file.  It is a recipe for building a container image.  Each line can be considered a alyer in the container image hierarchy
 - Container is packaged with all of it's dependencies.  So when you run a container, no software is actually installed on the host operating system
 - Registry contains images
 - Docker host can pull & push images from the Registry (only needs to pull and push diff's between what is on host and what is in the registry)
 - Docker clients manage container lifecycles, container storage, and container networking via API calls to the Docker host
 
#### Video: VMs Versus Containers (10 min)
 - VMs
   - VMs and Hypervisors exist between the OS and Physical level
   - OS can be slim because VMs are going to have a very standardized virtual driver interface for things like NICs and storage
   - Hypervisor consequently needs all the drivers to communicate with the actual non-virtualized hardware
 -Containers
   - OS can be slim again, but this time that's because dependencies can be moved into the container image itself
   - These are more application level dependencies (i.e. OS versions, app level dependencies, etc)
   
#### Lab: Docker Intro (45 min)
 - Docker container's are note deleted by default after exiting.  they exist in an exited state.  to see them you run the command ```docker container ls --all```.
   - Note: A containers hostname is the same as it's container ID
 - To run an interactive bash shell: ```docker container run --interactive --tty --rm ubuntu bash```
   - note the ```--rm``` tells docker to delete the container after it exits
   - run 'ps' inside the ubuntu container, and you will see that there are literally only 2 processses running.  bash, and your ps command.  If you spend a lot of time on linux, it seems very unusual to see literally only 2 processes running.  I guess this is the use major argument for containers.  I can run a bash shell without all the other OS stuff that typically happens on a full Ubunutu OS
 - A note about Kernels:  containers need to share the same kernel as their hosts.  in other words, linux containers can not run on a windows docker host, and windows containers cannot run on linux hosts.
 - Command to spin up a MySQL container: ```docker container run --datach --name mydb -e MYSQL_ROOT_PASSWORD=<password> mysql:latest```
   - Wow, that was easy.  ```--detach``` runs it in background.
 - Run ```docker container logs mydb``` to see the logs from our mysql container
 - Run ```docker container top mydb``` to see what processes are running in our mysql container
 - A little bit about Docker files:
   - These are files that tell docker how to create containers
   - FROM lines specify a base image to use (e.g., the webserver nginx)
    - Example: ```FROM nginx:latest```
   - COPY lines tells docker to move files from the host into somewhere inside the FROM base image
    - Example: ```COPY index.html /usr/sahre/nginx/html```
   - EXPOSE lines tell which ports to open in our container
    - Example: ```EXPOSE 80 443```
   - CMD lines specify commands to be run inside the container once it's started
    - Exampler: ```CMD ["nginx", "-g", "daemon off;"]```
 - Now if we have a docker file, we can build the corresponding image with the command ```docker imabe build --tage <name_of_image> <location of dockerfile>```
 - and finally you can run your newly created container with the typical ```docker container run``` command specifying the name of the image you just created
 - Now if you are done with your container and don't care about it at all, you can force it to die with ```docker container rm --force <container_name>``` (if you care about it, you may want to call 'stop' first before the previous ocmmand)
 - Now - what about if you want to modify an application without maving to stop it, rebuild the image, and then re-deploy it/  Docker provides the 'bind' functionality for just that
   - adding 'bind' to your run commmand will bind a location inside the docker continaer with a location on your local host filesystem.  Then, when you update a file in what appears to be your local filesystem, the container file will be updated as well.  This allos you to swap out, for example. HTML files in a running container hosting a website.
 - Once you update the running container, you will probably want to persist those changes in the image file  To do that, simply rebuild the imaage with the updated files with the standard docker image build command
 - Finally, you can push any container images you create to your own personal Docker Hub with the ```docker image push <<dockerID>/<containerId>``` command
   - Note - you will need to login with ```docker login``` before you can do this (and need to have a docker account obviously)

#### Lab: Doing More with Docker Images (30 min)
 - ```docker container diff <container_id>```  shows modifications made to a container (e.g., installed sofware on a ubunutu base image)
 - docker container commit <container_id> will create a new container image based on the container_id provided
 - docker image ls to show current docker images (notice newly commited image has no tag
 - docker image tag <IMAGE_ID> <IMAGE_NAME> to tag the image with <IMAGE_NAME>
 - Remember from our previous lab that you can also build images with Dockerfiles (see previous section for info on how to do that)
 - You can also see history of an image with ```docker image history <image_id>```  
  - This command will show you the base image, as well as the updates performed to it based on your specific Dockerfile inststructions
 - ```docker image inspect <image_id>``` will show you much more detailed information about an image file such as the layers, drivers, archetcture, and other various metadata
 
#### Video: VMs vs Containers Deepdive (10 min)
 - Size:
  - VM's have everything except physical hardware inside VM image (kernels, efi, OS, etc)
  - containers may have only application data, or could have entire OS's in them also (like if they built on top of Ubuntu base image)
 - Isolation:
  - VMs are secure because they an attacker has to exploit process -> user space -> kernel -> x86 
  - Container are only as secure as the kernerl they are running on.  If kernel has bug, then all containers running on that kernel have a bug
 - Boot Time:
  - VM: 3/4 seconds for system (faster system then I have ever started...), 500 ms for userspace procs
  - Container: 500 ms for userspace proc
#### Lab: Docker Networking (1 hour)
 - ```docker network ls``` shows existing container networks
 - ```docker network inspect <network>``` shows detailed information about the network selected, such as drivers and connected containers
 - ```docker info``` will list available network drivers
 - Bridge Netowkring:
  - All Docker installations come pre-built with a Bridge network
  - bridge drive provides single host network (aka only containers running on the host can talk to eachother)
  - all new containers are connected to the bridge network by default
 - Port mapping:
  - Containers can be started with a port mapping which will map a port from docker host to a container running on that host
  - Example: ```docker run --name web1 -d -p 8080:80 nginx``` will start an nginx web server, and map docker host port 8080 to container port 80 (default port where nginx will listen for connections)
 - To create a docker swarm: ```docker swarm init --advertise-addr $(hostname -i)```
  - this will output the command to run on other nodes to join the swarm
  - ```docker network create -d overlay overnet``` will create an overlay network on the swarm
  - This network can now be specified when creating services: ```docker service create --name myservice --network overnet --replicas 2 ubuntu sleep infinity```.  Notice the specification of the overlay network, as well as 2 replicas to run on our 2 nodes in our swarm
 - ```docker service rm <service_name>``` to remove a Docker service
 - ```docker swarm leave``` to remove a node from a swarm (optional --force)
 
#### Lab: Swarm Mode Introduction (1 hour)
 - Docker Compose is used to control multiple containers on a single system.
 - Swarm Mode tells Docker that you will be running many Docker engines and you want to coordinate operations across all of them. (used more frequently than Compose)
 - We need a manager first for our swarm: ```docker swarm init --advertise-addr $(hostname -i)```
  - This does 2 things.  Sets up the manager, and also prints out the command we can use to run on other nodes to join the swarm managed by this manager
 - A stack is a group of services that are deployed together: multiple containerized components of an application that run in separate instances. 
 - Each individual service can actually be made up of one or more containers, called tasks and then all the tasks & services together make up a stack.
 - Docker stack files are basically a text file containig markup which describes your ENTIRE app (pretty cool), including what elements will depend on eachother, how many replicas, what services, etc
 - You can deploy a docker stack file with: ```docker stack deploy --compose-file=docker-stack.yml voting_stack```
 - ```docker stack ls``` lists the installed stacks
 - ```docker stack services <stack_name>``` will list the individual services running in the stack
 - you can directly scale docker stacks with ```docker service scale voting_stack_vote=5```
 
#### Video: Kubernetes vs. Swarm (5 min)
 - Swarm - orchestration system (manage containers in production)
 - Kubernetes - From google, an orchestration system for Docker/Containers 
 - Swarm & Kubernetes are basically in competition.  Currently - most live products are using Kubernetes
 - Swarm is simpler than Kubernetes, and built directly into Docker
 - Reccomendation is to learn Kubernetes because it has more features, and is more widely used
 
#### Video: Kubernetes in 5 minutes (5 minutes..duh)
 - Kubernetes consists of a Cluster Services node, and worker nodes (Docker hosts)
 - Kublet software runs on worker nodes
 - "Desired State Management" is simply the .yaml file designating what we want to run on our cluster
 - Inside the app.yaml file will designate "pods" which specify what container images a Pod runs, how many replicas, what services, etc
 - This file is provided to the cluster services, and then Kubernetes figures out how to map the desired state to available infrastructure
 
#### Break a Monolith Application into Microservices (4 hours)
 - In this project we take a NodeJS monolithic application and deploy it with Docker on AWS
 - Our application has three main components: a Users services, a Threads service, and a Posts service
 - First, we will deploy a single container running all of these services.  Then we will redeploy the same app where each service is running in its own independent container
 - We utilize Amazon ECR (Elastic Container Registry) for managing docker deployments
  - Note: You will need Docker and AWS CLI installed on your workstation in order to do the demo 
 - After forking the Github repository, you can use Amazon ECR to add the repository.  Amazon ECR is a Docker container registry.  By Adding our code to the registry, we can use Docker to create container images
 
![docker_push.png](/images/docker_push.PNG)

![repository.png](/images/repository.PNG)

 - We will use CloudFormation and provide it a Docker stack file which is in the Github repiository (See previous notes for what a Docker stack is).  Basically this is a markup document which describes a recipe for building a containerized application.  This stack file will spin up a cluster of two nodes.
 ![docker_push.png](/images/cluster_create_complete.PNG)
 ![docker_push.png](/images/cluster_instances.PNG)
 - We will now use Amazon ECS (Elastic Container Service) to spin up our docker containers on our EC2 instances of our cluster
 - We have to build and run an EC2 task definition which describes how our application containers get deployed across our cluster
  ![docker_push.png](/images/task_definition.PNG)
 - Now we must configure our target group so our load balancer knows how to direct traffic to our application.  You can utilize the demo VPC configured by default within AWS.  
  ![docker_push.png](/images/target_group.PNG)
 - Next we must add a listener to our VPC.  Add a listener on the desired port and forward to the api target group.  This way requests coming into our ELB on the port specified (in our case 80), will get redirected to our target group for the api service
  ![docker_push.png](/images/listener.PNG)
 - Finally, frum the cluster configuration we can create a new service and start up our application. 
  ![docker_push.png](/images/service_create.PNG)
 - Now, we have our monolith application running, we want to break it into three seperate services.  The github project for this demo provides us with an additional 3 docker repositories which comprises each service individually inside it's own NodeJS application
 - In order to use this, we need to basically repeat the previous steps, but this time do everything in pairs of 3's for each of the individual services.
 - first we add a repository in ECR for threads, posts, and users.
  ![docker_push.png](/images/microservice_repos.PNG)
 - Nextrun ```docker build``` and ```docker tag```, ```docker push``` on each of the three services.  Now we have a container image for each service in our registry.
 - Now we need to make 3 new task definitions for each service just as we did before for the monlothic application
  ![docker_push.png](/images/microservice_task_defs.PNG)
 - Now we will need to create new target groups for our ELB to point to for each of our new services, just as we did before.
    ![docker_push.png](/images/microservice_target_groups.PNG)
 - Note the additional of the dummy "drop-traffic" target group.  This will allow us to disable the old service so traffic no longer routs to that and instead will get directed to our new microservices application
 - Now we need to add some rules to our current listener.  We will update it so that traffic matches on /api still goes to our active api service.  However, below that rule we will create new rules for traffic matching each of our service endpoints, and redirecting as appropriate.  Once we spin up our services we will remove the first rule to enable our microservice implimentation
  ![docker_push.png](/images/listener_rules.PNG)
 - Now we need to go back to our cluster and configure a service for each of our microcservices.  This is done just as before, except we will choose our new target groups and create a service for each individual component
  ![docker_push.png](/images/microservices.PNG)
 - Now we can go back to the load balancer and remove our first rule which still was directing traffic to the monolithic application
 - And we are done!
 - Make sure to clean up once complete.  Remove task groups.  Delete clusters, etc.
 
## Area 2 - Big Data and Machine Learning
### Beginner Courses:
#### Video: Hadoop Intro
 - Data is exploding which means that we need distributed systems to handle the ever increasing data size
 - What is Hadoop?  Hadoop is a framework that allows for distributed processing of large dataset across clusters of commodity computers using simple programming models
 - Hadoop is economical (commodity hardware), reliable (redunant copies of data across machines), scalable (horizontal and vertical scaling), flexible (you can store whatever data you want)
 - Traditional: Data goes to program, Hadoop: Program goes to data
 - Four stages of big data processing: Ingest, Processing, Analyze, Access
 - Hadoop Ecosystem: 
     - Hadoop Distributed Filesytem (Processing): Distributed Storage layer for Hadoop
     - HBase (Processing): Stores data in HDFS, NoSQL database
     - Sqoop (Ingest): Tool designed to migrate data between traditional RBDMS to HDFS
     - Flume (Ingest): Ingest streaming data into HDFS
     - Spark (Processing): Computing framework on top of Hadoop.  Processes data inside HDFS
     - MapReduce (Processing): Computing Framework on top of Hadoop.  Based on map/reduce programming model.  
     - Pig (Analyze): Data Analytics platform.  Converts pig queries to map/reduce
     - Impala (Analyze): SQL engine which runs on HDFS
     - Hive (Analyze): Hadoop abstraction layer similar to Impala
     - Cloudera Search (Access): Allows users to search Hadoop data without writing map/reduce or SQL queries
     - Oozie: Workflow/Coordination system which manages jobs in Hadoop
     - Hue (Access): (Hadoop User Experience) Web interface for Hadoop which allows uplaoding of data, runing queries, etc

#### QwikLab: Analyze Big Data with Hadoop
 - Applications installed by default on EMR cluster:
   - Apache Hadoop - big data processing
   - Ganglia - manages cluster
   - Tez - execution engine (as opposed to map/reduce)
   - Hive - abstration layer running on Hadoop.  Allows SQL queries
   - HUE (Hadoop User Experience) - GUI that runs on top of Hadoop services
   - Pig - abstraction layer that allows queries via the Pig scripting language
 - To run things in our EMR cluster, we add a 'step'.  We provide things like "Input" and "Arguments" to an EMR step.
 - We can add a 'Hive' step which involves parsing data into our Hadoop cluster, generating a Hive query, and writing the results to our designated output (in this case an S3 bucket)
 
### Intermediate Courses:
#### QwikLab: Intro to S3
 - Bucket numbers have to be unique
 - You can upload any type of object into a bucket (e.g., pictures, videos, audio, etc)
 - Objects in S3 are private by default.  If you want public access you need to modify the object itself, or update the bucket policy (which will effect permissions of all objects inside the bucket)
 - Use the bucket policy editor to quickly generate the necessary JSON policy code
 - enable bucket versioning in order to keep all versions of objects within your buckets.  Note that the most recent version is what will get retrieved by default if you request the object.  But behind the scenes you still have access to the older versions in case the newest version is not correct
 
