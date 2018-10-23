# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1
### 1.[Introduction to SDN](https://www.youtube.com/watch?v=DiChnu_PAzA)(done in 30 mins).
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

### 2. [Tutorial: Using the OpenDaylight SDN Controller with the Mininet Network Emulator](http://www.brianlinkletter.com/using-the-opendaylight-sdn-controller-with-the-mininet-network-emulator/)
+ Set up mininet network simulator in virtual box. (the virtual box change the menu a bit so the host-only networks are in 'file' menu). We need two networks for the virtual machine. On connect to the NAT and the other on should connect to the host which is my laptop.
+ The Ubuntu img with mininet which is provided by the author is not usable. I got the latest version of mininet VM and it works fine.
+ The OpenDaylight tutorial is not so correct. I used openjdk-8-jre-headless then everything worked out.
+ When testing the mininet along with OpenDaylight. More attention should be paid on the ip addresses.
+ It takes a really long time for the Yang data structure to came out.

## Area 2
> Include notes here about each of the links
