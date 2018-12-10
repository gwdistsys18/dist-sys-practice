# Some Understanding of Distributed Systems
## How to understand the word "distributed"?
"Distributed Systems", "Distributed Computing", "Distributed Algorithms". So what is the specific meaning of "distributied" here? In a narrow sense, it means that multiple PCs are geographically distributed in different places.  

## Distributed Systems
__Distributed system__: A group of computers (called nodes) that can run independently. Each node uses a computer network for information transfer to achieve a common "target or task."  

__Distributed program__: A computer program that runs on a distributed system.  

__Distributed Computing__: Use distributed system solutions to compute problems. In distributed computing, a problem is refined into multiple tasks, each of which can be done by one or more computers.  

Distinguish distributed computing  parallel computing: The commonality is that large tasks are divided into small tasks.  

Differences:  
* Distributed computing: Based on multiple PCs, each PC completes a different part of the same task. The task is decomposed and the smaller tasks are independent of each other. The results between the nodes hardly affect each other, and the real-time requirements are not very high.  
* Parallel computing: Based on the same PC, use the multicore of the CPU to accomplish a task together.  

1. Distributed Operating System  
Responsible for managing distributed processing system resources and controlling distributed program operations. It differs from centralized operating systems in terms of resource management, process communication, and system architecture.  

2. Distributed File System  
Distributed file systems have the ability to perform remote file access, and manage/access files distributed across the network in a transparent manner.  

3. Distributed Programming and Compiler Interpretation System
Distributed programming language is used to write distributed programs that run on distributed computer systems. A distributed program consists of several program modules that can be executed independently, and they are executed simultaneously on multiple computers in a distributed processing system. It has three characteristics compared to a centralized programming language: distribution, communication, and robustness.  

Hierarchical applications can be partitioned by number of layers, and information can be transferred from the data layer (usually stored in the database) to the presentation layer (displayed on the client). Usually each layer runs in a different system than the other layers, or in different process spaces in the same system. Layering benefits: Reduce the complexity of the entire application; enable applications to scale better and keep up with the needs of enterprise development.  

* Two-tier application: Typical architecture, a client PC (front end) and a web server (backend) with a database. Logically based on the physical location of them. Usually the client contains most of the business logic. As the database and stored procedures evolve, the SQL language allows business logic to be stored and executed in the database server.
* Three-tier application: The most commonly used three-tier application structure includes a user service layer (presentation layer), a business service layer and a data service layer. The business logic layer is separated from the user interface and data source. Distributed applications are usually divided into three or more layers due to the functional limitations of a two-tier application(i.e. the client/server architecture). Each layer of components performs a specific type of processing.  

