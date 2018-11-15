---
title: Docker and Containers - VMs vs Containers Deep Dive
date: "2018-10-30T22:12:03.284Z"
---

<div class="embed-responsive embed-responsive-16by9">
    <iframe class="embed-responsive-item" id="youtubeplayer" type="text/html" width="640" height="390"
        src="//www.youtube.com/embed/PoiXuVnSxfE" frameborder="0"/>
</div>

### Size

Containers and VMs can be complimentary as containers can run inside VMs.
In virtual machine, everything but hardware is comprised inside a disk image
that makes up the virtual machine. The image bundles the kernel, the init system,
the user space programs and the application themselves. The size of image could
vary from hundreds of megabytes to tens of gigabytes.

While in containers, the size can range from tens of megabytes up to gigabytes,
depending on the type of application inside it.

### Isolation (Security)

In VMS, the process of isolation is very straightforward as there is a clear boundary
outside the x86 platform. Escaping from the VM sandbox is extremely difficult, as
far as we known, there has not been any successful attack of this type.

On the other hand, containers are by no means insecure, but they are as secure as the
kernel they are running on. If the kernel has flaws, attacker can potentially escape
the sandbox and reach the kernel, this is also considered very difficult because kernel
bugs are very rare.

### Boot Time

In VMs, several startup times add up to the startup time of the application itself.
The startup times can be divided in 2 sections, one is the system check section that
includes the _x86 post_, the _EFI check_, the _kernel boot_, the _init startup_ and then 
the _process run_.

In containers, sandbox has to be ready before the the process can run. The sandbox set up
is a kernel operation that takes no time, while the startup time of process is equivalent
to the time in VM (about 500 milliseconds). The startup of container is extremely fast
and straightforward.