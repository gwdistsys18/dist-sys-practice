---
title: Docker and Containers - VMs vs Containers
date: "2018-10-27T22:12:03.284Z"
---

<div class="embed-responsive embed-responsive-16by9">
    <iframe class="embed-responsive-item" id="youtubeplayer" type="text/html" width="640" height="390"
        src="//www.youtube.com/embed/L1ie8negCjc" frameborder="0"/>
</div>

> VMs and containers are fundamentally different technologies.

### VM Stack

The interface for VM sits on top of _Hypervisor_ between _OS_ and _Physical infrastructure_.

OS talks to a ubiquitous virtual hardware layer with less overhead. VM can be sized to whatever
you want without limitation of physical infrastructure.

Hypervisor is responsible to interact with all types of hardware.

### Container Stack
_OS_ works as a container host and
is slimmed down with OS dependencies packed into containers. _Apps_ get
isolated from _OS_ by containers.
However, without Hypervisor and VM, OS has to take the responsibility to interact
with the physical infrastructure.