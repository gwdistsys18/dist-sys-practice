# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## SDN and NFV
### Introduction to SDN (Studied for one hour)
* [Introduction to SDN](https://www.youtube.com/watch?v=DiChnu_PAzA) The big goal of SDN is to make the network open and programmable. For example, if companies want to custom some network features, they can program their needs as applications based on SDN. The SDN architecture is the following:

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/SDN_Model.png)

We usually call the network operating system as SDN controller which instructs the forwarding devices below it how to process a packet, either drop it or forward to the next forwarding device; also provide a group of interface for network applications above it. The forwarding devices usually catch some instructions, so the future packets do not need to check with the SDN controller.

* The protocols between the SDN controller and the forwarding device includes:   
OpenFlow  
OVSDB  
NETCONF  
SNMP  

* Highly available and scalable  
In order to guarantee high availability, SDN controller is not a single one, it usually forms a cluster to work as load balance, also guarantees that one controller fails, there still has active controlers to provide service, the architecture like the following:

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/cluster_SDN.png)

In addition, different SDN networks can be separated as required, using East/West Protocol to communicate with each other, like the following architecutre:

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/constroler_communiate_constroler.png)

Finally, SDN controller can be designed as a hierarchy,

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/hierarchy_SDN.png)

### SDN simulation with OpenDaylight and Mininet (Studied four hours)   

OpenDaylight is a popular open-source SDN controller platform. Its architecuture can be found [here](https://wiki.opendaylight.org/view/OpenDaylight_Controller:Architectural_Framework).      

Mininet provides a virtual test bed and development environment for software-defined networks. It simulates the network devices which supports openflow protocol and their connections, such as openflow switches, openflow routers, and host devices. You can learn more from [here](http://mininet.org/).   

You can deploy a SDN test environment with OpenDaylight and Mininet. Flowing the instruction of [Using the OpenDaylight SDN Controller with the Mininet Network Emulator](http://www.brianlinkletter.com/using-the-opendaylight-sdn-controller-with-the-mininet-network-emulator/), we can create a SDN network as the following topology:   

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/Mininet_OpenDaylight.png)   

From this topology, we can see the OpenDaylight plays the role of a SDN controler, which controls the software-defined networks simulated by Mininet. Dpctl is a management utility that enables some control over the OpenFlow switch directly, without the intervention of SDN controler. Learn more about Dpctl from [here](https://github.com/CPqD/ofsoftswitch13/wiki/Dpctl-Documentation)    

There are 2 points to pay attention to during the configuration process:   
* You need to run VirtualBox as Administrator, otherwise, the dhcp of VirtuaBox cannot get a dynamic IP address for eth0. 
* You need to select a proper Network adepter for NAT mode. I select PCNet FAST III because it is supported by nearly all operating systems out of the box.
## Area 2
> Include notes here about each of the links
