----Introduction to SDN:
Purpose: Network function to be open and programable.

SDN model: 
    application1 application2 application3
          Network operating system
    forwarding device1    forwarding device2

Packet flow:  
             when a packet arrive at a forwarding device, if the forwarding table of that device contain the entry 
             corresponding to that packet, then the device will directly forward the packet to output ports. If not, 
             the forwarding device will send request to Network operating system. And the application running on the 
             Network operating system will return the enrty to the forwarding device.

The structure:
    Network application
    Application Interfaces
    SDN controller/control plane
    SouthBound Interface
    Forwarding devices
    data plane

Other key points: 
    Different SDN can comunicate with each other with East/West protocol. There could be multiple layers of SDN.


----Tutorial: Using the OpenDaylight SDN Controller with the Mininet Network Emulator
The procedure:
    First, building up a virtual machine installed Ubuntu OS.
    Second, building up a mininet virtual machine.Use SSH terminal to get access to those virtual machines.
    Third, install the OpenDaylight application on the Ubuntu virtual machine and run it. Run the mininet, and initialize a 
           three host distributed system with mininet. The opendaylight is the controller. Observe how the controller manages the 
           forwarding policy of each host.
Observe:   
    how the Mininet simulate the distrubuted system,
    how the openDaylight manages the packet forwarding between different hosts. 

I learned something from this tutorial:
    1. How to use virtualbox to launch a virtua machines.
           import an existing virtual machine.
           set up a virtual machine and install an operating system on it.
           
    2. how the SDN controller communicates with other hosts to manage the packet forwarding. 

Comments:
    This tutorial is very time consuming, I almost take 6 or 7 hours to complete this tutorial. 
    The mainly reason is
    1. This tutorial is based on Mac OS, but I use Windows.
    2. This tutorial is old.Some Some application versions are very old, and commands It refer to is not valid either. That means the studets may encounter 
       many problems that they don't even know why.
