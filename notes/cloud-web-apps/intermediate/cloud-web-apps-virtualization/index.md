---
title: Cloud Web Apps - Virtualization
date: "2018-10-10T22:12:03.284Z"
---

<div class="embed-responsive embed-responsive-16by9">
    <iframe class="embed-responsive-item" id="youtubeplayer" type="text/html" width="640" height="390"
        src="//www.youtube.com/embed/GIdVRB5yNsk" frameborder="0"/>
</div>

### History of Virtualization

Virtualization is not a new idea, in fact, it was first brought up in the 1970s, when there were
many different OS for different purposes running on different computers. IBM invented the idea of
running several virtual computers at the same time on top of one physical computer to accommodate
different OS. 

### Kernel Mode and Ring Zero

Operating system is able to do things that applications cannot, in case applications accidentally
or maliciously crash the machine. The hardware implementation of this mechanism is called __kernel Mode__
or __supervisor mode__, in Intel family processors specifically, it is called __ring zero__ privileged level.  

### OS and Processor Support of Virtualization

When application tries to issue instructions and access things that will cause a fault,
a piece of the operating system is there to provide virtual machine support by emulating the instruction.
Many processors are essentially designed to be easy to be virtualizable. 

### Hypervisor

The term hypervisor is a variant of supervisor, a traditional term for the kernel of an operating system: 
the hypervisor is the supervisor of the supervisor, with hyper- used as a stronger variant of super-.

A hypervisor or virtual machine monitor (VMM) is computer software, firmware or hardware that creates and runs virtual machines. 
A computer on which a hypervisor runs one or more virtual machines is called a host machine, 
and each virtual machine is called a guest machine. 
The hypervisor presents the guest operating systems with a virtual operating platform and manages the execution of the guest operating systems. 
Multiple instances of a variety of operating systems may share the virtualized hardware resources: 
for example, Linux, Windows, and macOS instances can all run on a single physical x86 machine. 
This contrasts with operating-system-level virtualization, where all instances (usually called containers) must share a single kernel, 
though the guest operating systems can differ in user space, such as different Linux distributions with the same kernel.