# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Docker and Containers
> Include notes here about each of the links

-Video: Why docker?(https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)  
In the video, we can know that docker was released in 2013, as an open-source object by docker company.  
The appearance of docker makes a huge shift in ecosystem.  
The real benefit of using docker is all about speed, develop faster, build faster, test, deploy, update and recover faster!  
By using docker, we can avoid dealing with some diffiult troubles like you have multiple types of applications,   
a lot of different things that all need to work together. Those all have their own dependencies, their own requirement  
even run on different operating systems. It's complicated, but the way the containers do it now is it's consistent across the board.  
It allow you to package the same way regardless of your operating systems and distribute the system without setup.  
It makes a lot of pain problems around the software lifecycle much easier to deal with.  

-Lab: DevOps Docker Beginners Guide(https://training.play-with-docker.com/ops-s1-hello/)  
In this lab, I have learned about how to run a popular, free, lightweight container   
and explore the basics of how containers work, how the Docker Engine executes and isolates containers from each other.  
Get some basic knowledge about what is images and the basic commands in docker and how to use them.  
. Alpine Linux container: Alpine is a lightweight Linux distribution so it is quick to pull down and run,   
  making it a popular starting point for many other images.  
  docker image pull alpine: The pull command fetches the alpine image from the Docker registry and saves it in our system.   
  docker image ls: You can use the docker image command to see a list of all images on your system.  
  docker container run alpine ls -l: run a Docker container based on this image.  
    When you call run, the Docker client finds the image (alpine in this case), creates the container and   
    then runs a command in that container. When you run docker container run alpine, you provided a command (ls -l),  
    so Docker executed this command inside the container for which you saw the directory listing.   
    After the ls command finished, the container shut down.  
The fact that the container exited after running our command is important, As you will see in a few more steps,   
the echo command ran in a separate container instance. Imagine booting up a virtual machine (VM),   
running a command and then killing it; it would take a minute or two just to boot the VM before running the command.  
A VM has to emulate a full hardware stack, boot an operating system, and then launch your app -   
it’s a virtualized hardware environment. Docker containers function at the application layer   
so they skip most of the steps VMs require and just run what is required for the app.   
Now you know why they say containers are fast!  
  docker container run -it alpine /bin/sh: You are now inside the container running a Linux shell   
  and you can try out a few commands like ls -l, uname -a and others.   
  Exit out of the shell and container by typing the exit command.  
  We can see these container instances using the docker container ls command.   
  The docker container ls command by itself shows you all containers that are currently running.  
  docker container ls -a command: What you see now is a list of all containers that you ran.  
  docker container start <container ID>: We can use this command to tell Docker to run this specific container instance.  
Images - The file system and configuration of our application which are used to create containers.  
Containers - Running instances of Docker images — containers run the actual applications.   
A container includes an application and all of its dependencies. It shares the kernel with other containers,  
and runs as an isolated process in user space on the host OS.  
Docker daemon - The background service running on the host that manages building, running and distributing Docker containers.  
Docker client - The command line tool that allows the user to interact with the Docker daemon.  
Docker Store - Store is, among other things, a registry of Docker images.    
  
-Video: What are Containers?(https://www.youtube.com/watch?v=EnJ7qX9fkcU)
The container is used to cover a multitude things, is a sandbox of processes.  

## Area 2
> Include notes here about each of the links
