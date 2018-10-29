# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 - SDN and NFV
> Introduction to SDN
  - SDN is the separation of the control plane, into a software layer, from the data plane.
  - The goal of SDN is the flexibility of service provisioning rather than faster support.
  - Network functions can be added to the south interface of SDN platforms.
  - SDNs are used to build one large logical network fabric. However, internally the SDN can have hierarchy or clustering to suport features like load balancing and high availability.
  
> Using OpenDaylight and Mininet
  - The major things about this tutorial:
    1. The network on the mininet VM needs to be set up as follows before the VM can be used:<br>
        auto eth0<br>
        iface eth0 inet dhcp<br>
        auto eth1<br>
        iface eth1 inet dhcp<br>
        <br>
        Here, eth0 is a host-only adapter and eth1 is the NAT adapter. However, this setting won't change even if the roles do.
    2. There is a separate article laying out how to set up the mininet VM (hyperlinked in the tutorial). Ignore that procedure completely. Ideally, the mininet VM needs only the following changes:
        1. Addition of a second NAT nic
        2. Setting changes pursuant to 1
    3. The XQuartz X11 has to installed for Mac users and needs a log out/log in to make it the default X11 handler.
    
  - Apart from the above, the tutorial is simple enough to follow.
  - The wireshark packet capturing of the openflow packets as guided in the tutorial did not work for me. Maybe, I will revisit the issue at a later time.
  
> DPDK Skeleton
  - Attempt 1: Trying to run on the Nimbus cluster
    1. Hugepages not reserved
    2. sudo echo 1024 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
      OR
       sudo echo 1024 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages
       throw "Permission Denied" errors
  - Attempt 2: Trying on the cloudlab server with onvm profile
        Core 1 Forwarding Packets
        As per my understanding of the documentation, this means that the NIC is working with DPDK.

> OpenNetVM NFV Platform
  - Roughly same as covered in class.
  - Can't remember if the reason for using dockers to run the NFs or the fact that dockers add so little overhead was discussed in class.
  - The comparison with ClickOS is also informative.
  - Speed comparison of different NF configurations is informative.

> netmap - a framework for fast I/O

> Install OpenNetVM
  - This I have done in the GW Nimbus Cluster
  - Output from the speed tester example:
PORTS                                                                        │Total packets: 2120000000                                                    
-----                                                                        │TX pkts per second:  34498480                                                
                                                                             │Initial packets created: 16000                                               
                                                                             │                                                                             
                                                                             │                                                                             
NFS                                                                          │                                                                             
-------                                                                      │                                                                             
NF  1 - rx: 2106773568 rx_drop:         0 next:         0 drop:         0 ret│                                                                             
:     16000                                                                  │                                                                             
        tx:         0 tx_drop:         0 out:          0 tonf: 2106769352 buf│                                                                             
    - However, it does not seem to explicitly provide speed or time
    - Trying the bridge example though, I did not get any output and I still have not figured the reason out.
 
> OpenNetVM - Complete one issue from issue tracker (Speed tester should be able to create 0 packets good first issue)
    - changed behaviour to accept 0 initial packets
    - still resorts to 128 initial packets when -c option is not provided.

## Dockers and Containers
> Why Dockers?
  - Dockers (containers) are the next phase of computing
  - It is inclusive; developed for both sysadmins and developers
  - It is aimed at speeding up the entire software management lifecycle
  - Allows packaging, develop, distribute and test software consistent across various environments
  - Makes maintainance of software easier
  - Docker has seen major adoptation
  - Adopting containers do not require code changes; just changes in packaging
  - Large projects can save 50 - 70% infrastructure based costs by containerizing

> Play with Docker Classroom
  - the focus of containers is on the application rather than on the hardware layer.
  - hello-world docker was not available locally, so the image got pulled from the docker store (the default docker registry)
  - pull the alpine container and run
  - two container commands run on two different container instances and have no interaction with each other - that is docker isolation
  - since there is no need to emulate the full hardware stack, containers are much faster.
  - Commands:
    1. docker image pull alpine : pull an alpine image from local or remote docker registry
    2. docker image ls : images that have been pulled into this system
    3. docker container run alpine ls -l : 'ls -l' inside a new container (starts the container, runs the command, stops the container)
    4. docker container run -it alpine /bin/sh : run the container in interactive mode
    5. docker container ls -a : all docker instances that have been run so far. Stores all changes made in/to them
    6. 
        a. docker container start 514f0e9fa723 : start a previously run docker instance
        b. docker container start 514f : as long as the docker can be uniquely identified
    7. docker container exec 514f ls : run ls inside a previously run container
    
