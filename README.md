# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1
### 1. [Introduction to SDN](https://www.youtube.com/watch?v=DiChnu_PAzA)(done in 30 minutes).
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

### 2. [Tutorial: Using the OpenDaylight SDN Controller with the Mininet Network Emulator](http://www.brianlinkletter.com/using-the-opendaylight-sdn-controller-with-the-mininet-network-emulator/) (done around 2 hours)
+ Set up mininet network simulator in virtual box. (the virtual box change the menu a bit so the host-only networks are in 'file' menu). We need two networks for the virtual machine. On connect to the NAT and the other on should connect to the host which is my laptop.
+ The Ubuntu img with mininet which is provided by the author is not usable. I got the latest version of mininet VM and it works fine.
+ The OpenDaylight tutorial is not so correct. I used openjdk-8-jre-headless then everything worked out.
+ When testing the mininet along with OpenDaylight. More attention should be paid on the ip addresses.
+ It takes a really long time for the Yang data structure to came out.

### 3. [Video: OpenNetVM NFV platform](https://www.youtube.com/watch?v=7FoZywcxbYg) (done in 30 minutes)
+ SDN: focus on the control plane of the network. (How to router a package.)
+ Send the first package to the SDN server and SDN server will return a rule.
+ NFV: focus on the data plane. (How to process a package.)
+ The main idea is how to run the NFVs run as fast as the hardware do. (NFV can provide more flexibility)
+ Software-base Networking: SDN + NFV
+ Operating systems are very bad on processing large amount of packages.
+ Network hardware: Fast, expensive, inflexible.
+ We can hide most of the complexity of the system for example providing TCP, UDP layers.
+ For Linux package processing, the package copy and interrupts could be very high.
+ DPDK: make the package data from the NIC goes direct to a user space buffer. (using a special driver)
+ Using polling instead of interrupts.
+ Key idea of OpenNetVM: get data from NIC direct to a user level shared memory. With no copy.
+ Using share memory (ring buffers) to avoid locking
+ SDN controller provides a high level set of possible rules, the NF choose a specific one to use.

### 4. [Usenix Conference: Netmap](https://www.youtube.com/watch?v=la5kzNhqhGs) (done in 1 hour)
+ Direct packet I/O options: sockets (flexible, portable but slow), memory mapped buffer (efficient if no mbufs/skbufs), within the kernel (fast but could be dangerous), custom library (tied to vendor hardware).
+ The bottle neck of network stack: system calls, device programming, complex mbufs (mbuf has very different structures), data copy and mem_alloc
+ Netmap provides security and some level isolation.
+ The policy which ring associated to which core is decided by the user.
+ Using a shared memory region for all interfaces which means 0 copy, which reduce the copy overheads.
+ Using batch to reduce the number of system calls used.

### 5. Install and run some test using dpdk
+ Before compiling dpdk source code, make sure the ubuntu kernel is later than 3.2 and make sure GCC, Cmake, etc is installed.
+ Config and compile dpdk from source code on the server of Cloudlab. 
+ Make install will create a x86_64-native-linux-app file and copy all of the binary files into is. While it will be put into build if using make conifg then make. And this may casue some problems when running other tests.
+ For testing dpdk, I have used a simple test: helloworld which is in dpdk/example/helloworld. 
+ Before compiling helloworld, bind dpdk to the NIC using dpdk_devbind.py.
+ Be sure the environment variables (RTE_SDK and RTE_TARGET) are set correctly.
+ The helloworld has the result below:
![helloworld](/src/helloworld.png)
+ Before starting the skeleton test, we should bind another NIC port to dpdk. Because skeleton test requires even number of ports. The result of the test would be like below:
![skeleton](/src/skeleton.png)

### 6. Install and run the openNetVM.
+ I must disable the network interface in the kernel and then bind the port to igb_uio.
+ I have binded eth1 and eth3 to dpdk.
+ I have also run the openNetVM manager and speed_test NF successfully. The result will like below.
![onvm](/src/onvm.png)
+ To fix the issue 50, we can simply insert a line before SimpleHTTPServer is called to change the working directory to where the start_web_console.sh is. The code will be as bellow.
```
function usage {
    echo "$0 [-p WEB-PORT-NUMBER]"
    exit 1
}

web_port=8080

while getopts "p:" opt; do
    case $opt in
        p) web_port="$OPTARG";;
        \?) echo "Unknown option -$OPTARG" && usage
            ;;
    esac
done


# Start ONVM web stats console at http://localhost:<port num>
echo -n "Starting openNetVM Web Stats Console at http://localhost:"
echo $web_port

cd $(dirname "$0")
nohup python -m SimpleHTTPServer $web_port &
export ONVM_WEB_PID=$!
```

## Big Data and Machine Learning
### 1. [Hadoop Intro](https://www.youtube.com/watch?v=jKCj4BxGTi8&feature=youtu.be)
+ Data computation is conplex which depend on the available powers on the available computers. (Bottle Neck)
+ Solution of dealing with growing data: distributed system (multiple computer are used for a single task).
+ Challenges of distributed system: high chance of system failure, limit of bandwidth, high programming complexity. -- hadoop are used to accomplish these challenges. It is reliable, scalable, flexible and economical.
+ data center -> computer (traditional RDBMS) vs computer -> data center (hadoop). 
+ HDFS: when the data is stored first get distributed and then get processed.
+ HBASe store data to HDFS, it is a NoSQL database, provide random real-time, read and write access to big data, support high volume and high throughput of data.
+ Sqoop is used to transfer data between hadoop and relational database servers. 
+ Spark: process hdfs data. Major components: Spark core and Resilient Distributed Datasets(RDD), Spark SQL, Spark Streaming, Machine learning library, GraphX.
+ Hadoop map reduce: based on map and reduce programming model and have an extensive and mature fault tolerance framework.
+ Big, Impala and Hive: used to do data analytics.
+ After the data has been anayzed the user can use Cloudera search to access the result.
+ Ooize is a workflow or coordination system used to manage hadoop jpbs.
+ Hue: a web interface for users. 
+ Four stages for big data processing: Ingest (data are transfer to hadoop form various sources), processing (data is stored and processed), analyze (data is analyzed by processing frameworks), access (the analyzed data can be accessed by users).

### 2. [QwikLab: Analyze Big Data with Hadoop](https://awseducate.qwiklabs.com/focuses/19?parent=catalog)
+ This tutorial gives me a brief view of how to deploy a hadoop cluster and use it to run some scripts to analyze some datasets.
+ I have created an Amazon S3 bucket to store the reault of Hive script and launch a hadoop cluster to process data.
+ The dataset used in this task is the log data from CloudFront. It contains about 5000 rows of data. It is relatively small, as a result the time used to process this dataset is less than 1 minutes.
+ The Hive script first create a table which correspond to the dataset. Then it will use RegEx SerDe to parse these data. Finally, select and count the records whose dateobject is between '2014-07-05' and '2014-08-05'.
+ The result of the Hive script would be stored under the os_requests directory of the bucket we created before. The result would be like:
```
Android	   855
Linux      813
MacOS      852
OSX        799
Windows    883
iOS        794
```
## Docker and Containers
### 1. [Vedio: Why Docker](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)
+ Mainframe to PC (90's); Baremetal to Virtual (00's); Datacenter to Cloud (10's); Containers (now)
+ Docker is about speed.
+ Dealing with multiple applications which has its own environment and maybe running on different platforms. 
+ Docker helps maintain the applications or softwares.
+ ... (boring things)

### 2. [Lab: DevOps Docker Beginners Guide](https://training.play-with-docker.com/ops-s1-hello/)
+ The first time I start the Docker, I have no images stored locally. As a result, Docker engine goes to its default Docker registry to look for an image named "hello-world".
+ Docker is different from virtual machine because VM is pretty much a hardware abstraction while a contain is an application abstraction. 
+ ``` docker container run -it alpine /bin/sh ``` could run a Linux shell inside the container. And I can run some Linux commands on it. 
+ Docker basically using ```docker run```` command to start a container and run something on it.
+ Every time I use ```docker run``` to start a container, it is a separate container. Each container has a separate file system and runs in a different namespace. And by default there is no way for a container to communicate with another container.
+ I can use ```docker container start <container ID>``` to start the container again. And then I can see the hello.txt file I have created. 
![docker](/src/docker.png)
