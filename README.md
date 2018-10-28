# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Docker and Countainers
### Beginner Level
* [Video: Why Docker?](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23) (15 min)  

History:  
Mainframe to PC: 90's  
Baremetal to Virtual: 00's  
Datacenter to Cloud: 10's  
Host to Countainer: now   
  
Countainers: "Fastest Growing Cloud Enabling Technology"  
Why we need docker: Docker is all about speed. Faster.  
Comtainers reduce the complexity.  
Docker is freeing up a lot of rasks of the maintenance of stuff and allowing us to get more of our time back to innovate.  
  
* [Lab: DevOps Docker Beginners Guide](https://training.play-with-docker.com/ops-s1-hello/) (1 hr)  

In this lab we run a lightweight container and explore the basics of how containers work, how the Docker Engine executes and isolates containers from each other.  
  
Hello World:  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/hw.png)  
  
The pull command fetches the alpine image from the Docker registry and saves it in our system.  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/pull.png)  
  
Run a Docker container based on the image.  
![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/run.png)  
  
Container Isolation:  
Even though each docker container run command used the same alpine image, each execution was a separate, isolated container. Each container has a separate filesystem and runs in a different namespace; by default a container has no way of interacting with other containers, even those from the same image.  
  
Terminology:  
Images - The file system and configuration of our application which are used to create containers.  
Containers - Running instances of Docker images — containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers, and runs as an isolated process in user space on the host OS.  
Docker daemon - The background service running on the host that manages building, running and distributing Docker containers.  
Docker client - The command line tool that allows the user to interact with the Docker daemon.  
Docker Store - Store is, among other things, a registry of Docker images.  
  
### Intermediate Level
#### Countainers  
* [Video: What are Containers?](https://www.youtube.com/watch?v=EnJ7qX9fkcU) (25 min)  

![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/countainer.png)  
  
One process per container.  
The container process is completely tied in with the lifecycle of the container itself. When you start the container, it starts the container process. when the container process exits, the container ends.  
Container image is very simply a binary representation, a bunch of bits on a filesystem somewhere.  
The images are arranged in a image hierarchy.  
A dockerfile is basically an environment in a text file.  
The start of a docker file is "From". "From" is the parent image where this docker file is inheriting from. 
We could create image from a container.  
A container is packaged with all of its dependencies.
Registry is a thing that contains images. You can pull and push from the registry at will.  
Volume is a persistent area of storage. Container will have or may have a volume if it wants to persist any data beyond the lifecycle of the container.  
  
* [Video: VMs Versus Containers](https://www.youtube.com/watch?v=L1ie8negCjc) (10 min)  

![image](https://github.com/thcyang/dist-sys-practice/blob/master/screenshot/vm.png)  
Keep OS simple. Less overhead.  
You can size it however you want.  
Hypervisor: It has to be responsible for interacting with all different types of NICs from all different types of hardware.  
A large benefit of containers is the ability to package up a lot of dependencies the App needs from the OS in one container.  

## Area 2
> Include notes here about each of the links
