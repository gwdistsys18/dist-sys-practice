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
## Area 2
> Include notes here about each of the links
