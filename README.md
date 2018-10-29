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
+ To fix the issue 50, we can simple insert a line before SimpleHTTPServer is called to change the working directory to where the start_web_console.sh is. The code will be as bellow.
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

## Area 2
> Include notes here about each of the links
