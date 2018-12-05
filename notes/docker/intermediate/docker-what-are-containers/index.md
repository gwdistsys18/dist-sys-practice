---
title: Docker and Containers - What are containers?
date: "2018-10-26T22:12:03.284Z"
---

<div class="embed-responsive embed-responsive-16by9">
    <iframe class="embed-responsive-item" id="youtubeplayer" type="text/html" width="640" height="390"
        src="//www.youtube.com/embed/EnJ7qX9fkcU" frameborder="0"/>
</div>

### A Sandbox (Isolation) for Processes

A container could be perceived as a sandbox for processes.
Each sandbox has its own process namespace, for example, if you shell
into the container, you will only see the processes running inside of it.
The sandbox also has private cgroups, which restrict what a process is
able to do and resource limits we can apply.

The container process is usually tied in with the life cycle of the container itself,
when you start the container, the container process is also started, when the container
process exits, the container ends.

### Container Image

Container images could be perceived as disk snapshots that represents binary states. 
The states could be arranged in tree hierarchy, in which layers could be built on other layers.
One advantage of using the tree structure is the enhancement in node reusability, which leads
to the consolidation of binary states. The other advantage is that the tree shows a clear path
of dependency, which makes it easy to figure out the child nodes that are impacted when a vulnerability
is found in a parent node.

### Dockerfile

Each Dockerfile starts with a _From_, which shows the parent image that this Dockerfile
is inheriting from - the starting point to build a tree of images. Each line of a Dockerfile
describes the structure of the tree, which can be used to build a container instance of it.
In the other way around, the image tree can also be built from the container instance.

### Pull and Push the Diff

The pull and push of images between a Docker host and a Docker registry is minimized to the
_diff_ of the trees (host tree and registry tree).

### Docker Client and Docker Daemon

Docker daemon exposes API to Docker client so that container life cycle management could be done by client.
Docker client also manages virtual network configuration and persistent storage configuration (volume) on Docker host.
