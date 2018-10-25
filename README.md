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
 - notes
### Intermediate Courses:
