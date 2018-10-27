# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 - SDN and NFV
### Introduction to SDN (Studied for one hour)
* [Introduction to SDN](https://www.youtube.com/watch?v=DiChnu_PAzA) The big goal of SDN is to make the network open and programmable. For example, if companies want to custom some network features, such as to control the packet flow in different path, they can program their needs as applications based on SDN. The SDN architecture is the following:

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

### OpenNetVM Introduction (studied 2 hours)   

[Video: OpenNetVM NFV platform]( https://www.youtube.com/watch?v=7FoZywcxbYg) 
OpenNetVM is an open source NFV platform developed by GWU cloud Lab. It provides a NF manager platform which can run a NF chains on it. Each NF needs to register its service id to the OpenNetVM. NFs can run in a docker container. OpenNetVM is suitable and highly efficient for the NF chain services. Its architecture is as the following:   

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/openNetVM_architecture.png)

* NF Manager manages all NFs running on containers. It receives packets from NIC and disptaches the packets to the certain NFs according to the specific rules. 
* NFs recevie packets from NF Manager or from other NFs, then process the packets and deliver them to the next NF or send out of the NIC

It achieves high performance through the following techniques:   

* At the IP layer, OpenNetVM uses DPDK to receive packets and send packets. All packets will bypass the kernel to the userspace, which     can reduce the system interrupts and packets-copy.
* The NIC RX will be shared by all NFs, this can avoid packet-copy among NFs.
* DPDK integrates mTCP and mOS. mTCP is a userspace implementation library of TCP stack. You can find its introduction and code from       [here](https://github.com/eunyoung14/mtcp). mOS is a software implementation of Stateful middleboxes library, such as intrusion         detection systems and stateful firewalls, relying on TCP flow management to keep track of on-going network connections. You can find     its introduction and source code from [here](https://github.com/ndsl-kaist/mOS-networking-stack) and [here](https://mos.kaist.edu/)

Based on mTCP and mOS, users can implement any customized NF on OpenNetVM platform, which is highly scalable.

### DPDK Introduction (studied 2 hours) 
DPDK is the Data Plane Development Kit that consists of libraries to accelerate packet processing running on operating system. It is provided by Intel.     

Traditional packets processing in Linux is as the following procedure:    

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/linux_packet_processing.png)

We can see the traditional packets processing model has two problems:    
* Each packet will go to the kernel, at least 2 times of copy for each packet.
* Each packet will produce a system interrupt, which decrease the throughput and the operating system efficiency. 

So DPDK proposes a new way that delivers packets bypassing the kernel, the procedure like the following:    

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/DPDK_packet_processing.png)

DPDK has the following characteristics:     
* DPDK uses Hugepage to increase the hit rate and to eliminate the pressure on the TLB 
* DPDK supports CPU affinity, which EAL can assign execution units to specific cores. 
* DPDK uses PMD to poll the RX and TX. A Poll Mode Driver (PMD) consists of APIs, provided through the BSD driver running in userspace.   This driver makes DPDK accesses the RX and TX descriptors directly without any interrupts, which improves the sending and receiving       packets efficiency in userspace. 
* Compared to Netmap, DPDK does not feature a transparent NIC driver for the kernel. DPDK use a UIO userspace driver to enable access to   PCI hardware. The NIC drivers are provided by DPDK and run in application processes. 
* DPDK also uses mmap to map NIC ring to userspace, reduce packets-copy.
 
You can learn more from [here]( https://doc.dpdk.org/guides/index.html)   

### Netmap Introduction (studied 4 hours)
Similar to DPDK, Netmap is another userspace library to deliver packets to applications bypassing the kernel, reducing packet-copy and system interrupts.    
Netmap has the following characteristics:    
* Packet buffers are preallocated, saving the cost of per-packet allocations and deallocations
* Using mmap to map packet buffers to user applications, decreasing data-copy costs.
* Not tied to a specific device or hardware features, more compatible.  
* When a program requests to put an interface in netmap mode, the NIC is disconnected from the host stack, the program gains the ability   to exchange packets with the NIC and the host stack separately. Moreover, the transitional system call, such as select/poll are still   can be used for synchronization. 
* Compared to Linux kernel, which handles the entire packet in the kernel space, and the DPDK, which processes the packet entirely in     user space, netmap combines both of them. The system calls only perform the initial packet arriving check for packet buffers, and then   the packet processing is done in userspace. 
* In addition to the "hardware" shadow rings, each card in netmap mode exposes two additional rings that connect to the host stack.       Packets coming from the stack are put in an RX ring where they can be processed in the same way as those coming from the network.       Similarly, packets written to the additional TX ring are passed up to the host stack when the ioctl(fd, NIOCTXSYNC) is invoked
* netmap uses batch processing to optimize the performance.

You can learn more from [here]( http://info.iet.unipi.it/~luigi/papers/20110815-sigcomm-poster.pdf), [here]( http://info.iet.unipi.it/~luigi/netmap/), and [here]( http://info.iet.unipi.it/~luigi/papers/20120503-netmap-atc12.pdf)

[This]( https://www.net.in.tum.de/publications/papers/gallenmueller_ancs2015.pdf) article is discussing the comparison between Netmap and DPDK.

### Practice 1 – Run DPDK sample application (skeleton) (studied 3 hours)
I applied three physic machines from [NSF CloudLab]( https://cloudlab.us/), the original topology of the three machine is as the following:

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/Network_topology.png)

The ip address are the following:     
node1 - eth2: 192.168.1.1    
node2 – eth1: 192.168.1.2    
node2 - eth3: 192.68.1.3    
node3 – eth2: 192.168.1.4   

I ping node3 in node1, there is no response. So I need to run the DPDK sample application- skeleton on node2 to forward the packets on bi-direction. Skeleton is a simple packet forwarding application based on DPDK. It just forwards packets from one NIC port to another NIC port, and vice versa.      

But before you install DPDK library, you first need to check if your system and hardware support DPDK. Please do the following prepares:
1. Check if your NIC is supported by Intel DPDK with the following command:            
```bash
lspci | awk '/net/ {print $1}' | xargs -i% lspci -ks % 
```

You can compare the NIC type with the [supported NIC list]( http://core.dpdk.org/supported/)    

2. Check if your kernel is supported by Intel DPDK with the following command:       
```
uname -a
```
Your kernel version must be higher than 2.6.33. 

3. Check if your kernel supports UIO            
```
locate uio
```
4. Install Numa development library   
```
apt-get install libnuma-dev
```
5. Disable ASLR   
The multi-process feature requires that the exact same hugepage memory mappings be present in all applications. The Linux security feature - Address-Space Layout Randomization (ASLR) can interfere with this mapping, so it may be necessary to disable this feature in order to reliably run multi-process applications. So using the following command to disable ASLR:    

```
sudo sh -c "echo 0 > /proc/sys/kernel/randomize_va_space"
```
6. Bind driver to NIC   
NIC ports that are to be used by a DPDK application must be bound to the uio_pci_generic, igb_uio or vfio-pci module before the application is run. First, using the following script to check your NIC port status and its driver information: 

```
/local/onvm/openNetVM/dpdk/usertools/dpdk-devbind.py --status
```
You will see the information like the following:
```
0000:01:00.0 'I350 Gigabit Network Connection 1521' if=eth0 drv=igb unused=igb_uio *Active*
0000:01:00.1 'I350 Gigabit Network Connection 1521' if=eth2 drv=igb unused=igb_uio
0000:06:00.0 '82599ES 10-Gigabit SFI/SFP+ Network Connection 10fb' if=eth1 drv=ixgbe unused=igb_uio
0000:06:00.1 '82599ES 10-Gigabit SFI/SFP+ Network Connection 10fb' if=eth3 drv=ixgbe unused=igb_uio *Active*

Other Network devices
=====================
<none>

Crypto devices using DPDK-compatible driver
===========================================
<none>

Crypto devices using kernel driver
==================================
<none>

Other Crypto devices
====================
<none>

Eventdev devices using DPDK-compatible driver
=============================================
<none>

Eventdev devices using kernel driver
====================================
<none>

Other Eventdev devices
======================
<none>

Mempool devices using DPDK-compatible driver
============================================
<none>

Mempool devices using kernel driver
===================================
<none>

Other Mempool devices
=====================
<none>
```
If you want to use eth1 and eth3, you need to replace its driver with igb_uio. But before you modify the driver for a NIC port, make sure it is not active, otherwise, it will be failed with the following error:   
```
Routing table indicates that interface 0000:06:00.0 is active. Not modifying
```
So you must stop it, then replace the driver. Using the following command to stop eth3 and replace its driver:    

```
ifconfig down eth3
/local/onvm/openNetVM/dpdk/usertools/dpdk-devbind.py --bind=igb_uio eth3
/local/onvm/openNetVM/dpdk/usertools/dpdk-devbind.py --bind=igb_uio eth1

```
After (after you successfully bind at least a pair of ports to igb driver, eth1, eth3 on node2 will be disappeared from ifconfig output as these network interfaces are no longer controlled by the kernel. That means that the traffic coming through the interfaces controlled by igb driver should be handled with custom programmed data plane that the dpdk application (like l2fwd) implements.   

After doing the above steps, you can install DPDK library according to [this](https://doc.dpdk.org/guides/linux_gsg/index.html) instructions.    

Then go the /dpdk/examples/skeleton to run skeleton by the following command:    
```
sudo ./basicfwd -l 1 -n 4
```
You will see the following information:

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/basicfwd.png)

Now ping node3 in node1 again, you will respond from node3:   

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/ping1.png)

### Practice 2 – Run OpenNetVM with Speed Tester (studied 1 hours)
You need to install OpenNetVM according to [this]( https://github.com/sdnfv/openNetVM/blob/develop/docs/Install.md) instructions.    
Then start the OpenNetVM manager   

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/NF_Manager.png)
![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/NF_manager2.png)
![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/NF_Manager3.png)

This indicates the OpenNetVM manager has successfully started.       
Then start the Speed Tester NF:   

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/speed_test_NF.png)

The OpenNetVM manager will display the following information:    

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/NF_Manager4.png)   

Means NF 1 rx received 1287413664 packets.    
The NF 1 displayed the following information:   

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/Speed_test_NF2.png)

Means NF1 sends 41561305 packets per-second.

### Practice 3 – Run OpenNetVM with bridge NF (studied 2 hours)
Terminates both OpenNetVM manager and speed tester NF first. Then restart OpenNetVM manager and bridge NF according to the following command:   

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/bridge.png)

Then ping node3 from node1, we get the following information:    

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/ping2.png)

This means the bridge NF forwards packets between node1 and node3.

## Area 2 - Big Data and Machine Learning
### Hadoop Introducation (Studied for 1 hour) 
[Introduction to Hadoop](https://www.youtube.com/watch?v=jKCj4BxGTi8&feature=youtu.be) Since the data is explosion in today’s society, a powful, reliable, easy-use distributed system is urged need. But there are three challenges in a distributed system:    
* High chances of system failure
* Limit on bandwidth
* High programming complexity   

Hadoop is such an excellent distributed system which can resolve these chanllanges. Hadoop is a framework that allows for distributed processing of large data sets across clusters of commodity computers using simple programming models.   

Hadoop has the following characteristics:   
* Economical – Ordinary computer can be used to process data 
* Reliable – data is copied among different machines
* Scalable – easy to scale, both horizontally and veritically
* Flexiable – can store data with structural type or non-structural type

Hadoop ecosystem include three components: Data processing, Resource management, and distributed file system.  

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/hadoop_component.jpg.png)    

For each component, it has several implementation products.    

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/hadoop_ecosystem.jpg.png)   

We discuss each of these components:    
* HDFS: it is a storage layer for Hadoop, which is suitable for the distributed storage and processing. HDFS provides a streaming access to file system data, including file permission and authentication. HDFS uses command interface to interact with Hadoop.    
* Hbase is a NO-SQL database based on Hadoop. compared to HDFS, it can dynamically change data in Hbase. Data in HDFS is static and cannot be changed. Hbase is mainly used when you need random, real-time, read/write access to your data.    
* Sqoop is a tool designed to transfer data between Hadoop and relational database servers. It is used to import data from relational database such as, Oracle and MySQL to HDFS and export data from HDFS to relational databases.    
* Introduce a concept: event data    
Event data includes streaming data, sensor data or log files.    

  Flume is a distributed service to collect the event data can transfer it to the HDFS, It is ideally suited for event data from multiple system.     
* After the event data is transferred to the HDFS, it will be processed. One of framework that processes data is Spark. Spark is a opensource clustering computing framework.Compared to the Hadoop MapReduce which is disk-based paradigm, it is 100 times faster performance based in memory paradigm. Spark can run on Hadoop cluster, and process data in HDFS.        
* Mapreduce is another data processing framework, which is the original Hadoop processing engine. It is an extensive, commonly used, and mature fault tolerance framework.      
* After the data is processed, it is analyzed. This can be done by a dataflow system- Pig. Pig can convert pig script to Map-reduce code, saving time for users to write map-reduce code. It is also best for ad-hoc queries like join and filter.     
* Impala is another tool for analyzing data. It is a high-performance SQL engine which runs on Hadoop cluster. Impala is good at interactive analysis, which has a very low latency.     
Impala supports a dialect of SQL, so data on HDFS is model as a database table.     
* You can also analyze data with Hive, It is similar as Impala, best for data processing and ETL. Hive execute queries using MapReduce. Users do not need write low-level Mapreduce code. Hive is suitable for structured data.    
* After the data is analyzed, it is ready for users to access. Cloudera Search is real-time access product. It enables non-technical users to search and explore data stored in or ingested into Hadoop and HBase. Users do not need SQL or programming skills to use Cloudera Search.      
* Oozie is a workflow or coordination system that you can use to manage the Hadoop jobs.      
* Hue is a Hadoop user experience, which is an open source web interface for analyzing data with Hadoop. You can upload and explore data.     

#### Big data processing

There are four steps for data processing:    
Ingest -> Processing -> Analyze -> Access.     
* Ingest   
  Data is ingested or transferred into Hadoop as various sources, such as relational databases, systems, or local files, such as   Sqoop   transfers RDBMS data to HDFS data; Flume transfer event data into HDFS data. 
* Processing    
  In this stage, data is stored and processed. Data is stored into HDFS or Hbase (NO-SQL database). Spark or Map-reduce perform the data   processing 
* Analyze    
  In this stage, data is processed with Hive, Pig or Impala.
* Access    
  In this stage, the data can be accessed by Hue or Cloudera Search 
### QwikLab: Analyze Big Data with Hadoop (studied 2 hours) 

Following [this](https://awseducate.qwiklabs.com/focuses/19?parent=catalog) instruction, we can creat a Hadoop cluster to perform a simple log analysis job on Hadoop.          
First, you need a creat a S3 storage, where the result will be put.         
Then, you need to creat a EMR service running a Hive script task on Hadoop. In detial, you need to add a Step on EMR service. EMR will run the Step automatically and put the result on S3 which you created in the previous step.          
Finally, you can download the result file, named with "000000_0" to your local computer.           

The content of the Hive result file is:

![](https://github.com/lyuxiaosu/dist-sys-practice/blob/master/hive_result.png)

In this task, the Hive counts how many requests made by a user type to Amazon CloudFront in a period of time. 


