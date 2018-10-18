# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## SDN and NFV
### Introduction to SDN 
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

## Area 2
> Include notes here about each of the links
