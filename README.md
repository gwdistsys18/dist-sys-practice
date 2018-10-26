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
DPDK is the Data Plane Development Kit that consists of libraries to accelerate packet processing running on operation system. It is provided by Intel.   

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


