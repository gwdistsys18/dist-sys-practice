# Why Docker?

## Major Infrastructure Shifts

* Mainframe to PC in 90's
* Baremental to Virtual in 00's
* Datacenter to Cloud in 10's



## From Vitual Machines to Containers

**What VMs are?** Virtual machines (VMs) are an abstraction of physical hardware, that would slice your one giant physical server into multiple ones. The *hypervisor* or *VMM (Virtual Machine Monitor)* provides the capability to run multiple Virtual Machines on one set of hardwar and each one of these VMs with have an OS (you need to have licenses, update and patch them and everything IT related you do with all of your regular computers).

Before containers showed up, we used to use VMs to host our application. With VMs, we were able to get a big server and slice it up to several VMs and have multiple computers and simulate a network.

**What Containers are?** Containers are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Since Containers does not have a full blown Operating System they take up less space compared to VMs.

**Difference**

![](https://cdn-images-1.medium.com/max/2000/1*xNGfejkg9pQ16orB7VAIjA.png)

