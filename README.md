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

> OpenNetVM NFV Platform
  - Roughly same as covered in class.
  - Can't remember if the reason for using dockers to run the NFs or the fact that dockers add so little overhead was discussed in class.
  - The comparison with ClickOS is also informative.
  - Speed comparison of different NF configurations is informative.

## Area 2
> Include notes here about each of the links
