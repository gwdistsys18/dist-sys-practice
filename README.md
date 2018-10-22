# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1
###1.[Introduction to SDN](https://www.youtube.com/watch?v=DiChnu_PAzA)
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
+ 

## Area 2
> Include notes here about each of the links
