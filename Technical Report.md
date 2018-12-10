# How to learn Distributed Systems?
## What is a distributed system
A distributed system is a system of computer nodes that communicate through a network and coordinate work to accomplish common tasks. Distributed systems emerge to perform computational and storage tasks that could not be performed by a single computer with inexpensive, ordinary machines. The goal of it is to use more machines to process more data.  
  
The first thing to be clear is that we need to consider distributed systems only when the processing power of a single node can't meet the growing computing and storage tasks,  the hardware upgrade (adding memory, adding disk, using better CPU) is so high that it is not worth the effort or we can't optimize the application further. It is because the problem solved by the distributed system itself is the same as that of the stand-alone system. Due to the multi-node of the distributed system and the topology of communication through the network, many problems that are not found in the stand-alone system will be introduced. In order to solve these problems, more mechanisms and protocols will be introduced, which will bring more problems.  
  
Distributed systems are mainly divided into distributed computing and distributed storage. Computation and storage are complementary. The calculation requires data, either from real-time data (stream data) or from stored data, and the results of the calculations need to be stored. In Operating System, there is a very detailed discussion of computing and storage. Distributed systems simply extend these theories to multiple nodes.  

So how do distributed systems distribute tasks to these computer nodes? It is a very simple ideas like divide and conquer, aka partition. For calculation, switch calculation tasks and let each node calculate a part, and finally summarize the result, which is the idea of MapReduce. It is easier to understand for storage. Each node just stores a part of the data. When the data size becomes larger, Partition is the only choice, and it will bring some benefits.  
* Improve performance and concurrency. Operations are distributed to different nodes, independent of each other.
* Improve system availability. Even if some nodes are not available, other nodes will not be affected.  

