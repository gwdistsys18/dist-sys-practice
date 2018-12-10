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


