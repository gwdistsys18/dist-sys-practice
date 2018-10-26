# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 - Docker & Containers
### Beginner Courses:
#### Video: Why Docker?
 - Docker is a major infrastructure shift.  Comparable to Mainframe to PC shift in 1990s, Baremteal to Virtual on 2000s, Datacenter to Cloud in 2010s, and finally host to containers currently (aka Docker).
 - Migration is the hard part, however Docker is built with migration in mind.
 - Why Docker?? Docker is all about speed!  Develop faster, build faster, test faster, deploy faster, etc.
 - Matrix from hell - Current applications have many different types, with different requirements, running on different machines with different operating systems, with different testing requirements, etc.
 - Docker basically standardizes all of the above, so that every part of your application (e.g., database server, web server, front end server, etc, can all be run from within docker containers)
 - Docker is freeing up time typically spent on maintenance
 - Apps can be migrated into containers without code changes.  Containers is simply about optimizing the packaging and running apps.

#### Lab: DevOps Docker Beginners Guide
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
#### Video: What are Containers?
 - Container == Sandbox for a process
 - Typically, one process per container, and lifecycle of container == lifecycle of process
 - Containers images have a hierarchy
 - Dockerfile is basically an environment in a text file.  It is a recipe for building a container image.  Each line can be considered a alyer in the container image hierarchy
 - Container is packaged with all of it's dependencies.  So when you run a container, no software is actually installed on the host operating system
 - Registry contains images
 - Docker host can pull & push images from the Registry (only needs to pull and push diff's between what is on host and what is in the registry)
 - Docker clients manage container lifecycles, container storage, and container networking via API calls to the Docker host
 
#### Video: VMs Versus Containers
 - VMs
   - VMs and Hypervisors exist between the OS and Physical level
   - OS can be slim because VMs are going to have a very standardized virtual driver interface for things like NICs and storage
   - Hypervisor consequently needs all the drivers to communicate with the actual non-virtualized hardware
 -Containers
   - OS can be slim again, but this time that's because dependencies can be moved into the container image itself
   - These are more application level dependencies (i.e. OS versions, app level dependencies, etc)
   
#### Lab: Docker Intro
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
 
