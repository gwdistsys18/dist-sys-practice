# Why Docker?

## Major Infrastructure Shifts

* Mainframe to PC in 90's
* Baremental to Virtual in 00's
* Datacenter to Cloud in 10's



## What is Container

A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

Containers also reduce management overhead. Because they share a common operating system, only a single operating system needs care and feeding for bug fixes, patches, and so on. This concept is similar to what we experience with hypervisor hosts: fewer management points but slightly higher fault domain. In short, containers are lighter weight and more portable than VMs. 



## What are VMs

Virtual machines (VMs) are an abstraction of physical hardware, that would slice your one giant physical server into multiple ones. The *hypervisor* or *VMM (Virtual Machine Monitor)* provides the capability to run multiple Virtual Machines on one set of hardwar and each one of these VMs with have an OS (you need to have licenses, update and patch them and everything IT related you do with all of your regular computers).

Before containers showed up, we used to use VMs to host our application. With VMs, we were able to get a big server and slice it up to several VMs and have multiple computers and simulate a network.

## Vitual Machines VS Containers

Virtual machines and containers differ in several ways, but the primary difference is that containers provide a way to virtualize an OS so that multiple workloads can run on a single OS instance. With VMs, the hardware is being virtualized to run multiple OS instances. Containers’ speed, agility, and portability make them yet another tool to help streamline software development.

1. Size

2. Isolation

   In VMs, each vm has a bundle of EFI, Kernel + INIT, user space, and it is a sandbox.

   In containers, it is not secure enough

3. Boot time

![](https://cdn-images-1.medium.com/max/2000/1*xNGfejkg9pQ16orB7VAIjA.png)



## Image VS Container

Simply, the container is a runtime instance of a image, but it has a extra read-write layer. It includes one or a group of applications and the environment the applications relied.

## Terms

**Registry** A place to find and download Docker images.

**Layers** A Docker image is built up from a series of layers. Each layer represents an instruction in the image’s Dockerfile. Each layer except the last one is read-only.

**Container Image** It is simply a binary representation. It is just a bunch of bits on a filesystem. VMDK is a disk image and an OVA is an image for VM. 

**Dockerfile** A text file that contains all the commands, in order, needed to build a given image. The [Dockerfile reference](https://docs.docker.com/engine/reference/builder) page lists the various commands and format details for Dockerfiles.

**Volume** A special Docker container layer that allows data to persist and be shared separately from the container itself. Think of volumes as a way to abstract and manage your persistent data separately from the application itself.