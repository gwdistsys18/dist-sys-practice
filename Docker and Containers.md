# Docker and Containers

标签（空格分隔）： notes

---

###Industry Innovation
Docker uses 5 years to create an industry innovation. Caontainers are the next once-in-a-decade shift in infrastructure and process that make or break you.

###1. Major infrastructure shifts
####Mainframe to PC in 90's
\---mainframe for many years, then to a PC distributed architecture where we were putting in Mac, Windows and Doss
####Baremetal to Virtual in 00's
\---data center and servers to virtualization. Because servers are too powerful and we had a lot of idle time when we needed to get better utilization. so started to create lots of OS's inside a single piece of hardware that was virtualization VMware
####Datacenter to Cloud in 10's
\---start up in 2007-2008 when Amazon released the AWS solution(easy cheap disposable compute power).
####Host to Container(serverless)
\---would also include server lists or functions servers.
\---Containers are the "Fastest Growing Cloud Enabling Technology".

###2. Why Docker? Benefits
####Docker is all about speed!!!
Develop Faster. 
Build Faster.
Test Faster.
Deploy Faster.
Update Fater.
Recovery Faster.
when dealing the complicate softeware management, Containers allow you to package the same way regardless of your operating system. It allows you to distribute the software regardless of the the setup . it allows you to run and test the software in the same way everywhere(Mac, Windows, cloud,PC or any edge devices). They are all run the same way fundamentally when they use docker 
####Free up a lot from Maintenance
In IT industry, almost 80% time is spent on maintenance , and only 20% time is spent on innovation. Docker is freeing up a lot of tasks of the maintenance of stuff and allowing us to get more of our time back to innovate.
###Remark
Online resources about Docker and Containers:
landscape.cncf.io
Cloud Native Computing Fo undation

---
###Lab:DevOps Docker Beginners Guide
###Differences between VM and Container
The VM is a hardware abstraction: it takes physical CPUs and RAM from a host, and divides and shares it across several smaller virtual machines. There is an OS and application running inside the VM, but the virtualization software usually has no real knowledge of that.
A container is an application abstraction: the focus is really on the OS and the application, and not so much the hardware abstraction. Many customers actually use both VMs and containers today in their environments and, in fact, may run containers inside of VMs.
###1.0 Running your first container

    docker run hello-world
and output:

    Hello from docker!
###1.1 Docker Images

    docker image pull alpine
and

    docker image ls
output is a list of all images on my system
run another command:

    docker container run alpine ls -l
and

    docker container run alpine ls -l
output(very fast to get output): 

    hello from alpine
A VM has to emulate a full hardware stack, boot an operating system, and then launch your app - it’s a virtualized hardware environment. Docker containers function at the application layer so they skip most of the steps VMs require and just run what is required for the app. That's why containers are fast!

    docker container run alpine /bin/sh
Nothing got from this command. Because I did not supply any additional commands to `/bin/sh` so it just launched the shell, exited the shell, and then stopped the container. 

     docker container run -it alpine /bin/sh
I'm now inside the container running a Linux shell and I can try out a few commands like `ls` `-l`, `uname -a` and others. Exit out of the shell and container by typing the `exit` command.

    docker container ls
Since no containers are running, you see a blank line.

    docker container ls -a
i can see a list of all containers that I ran. Notice that the `STATUS` column shows that these containers exited some time ago.
To find out more about run, use `docker container run --help` to see a list of all flags it supports. 
###1.2 Container Isolation
Even though each docker container run command used the same alpine image, each execution was a separate, isolated container. Each container has a separate filesystem and runs in a different namespace; by default a container has no way of interacting with other containers, even those from the same image.

    docker container run -it alpine /bin/ash
The /bin/ash is another type of shell available in the alpine image. Once the container launches and you are at the container’s command prompt type the following commands:

    echo "hello world" > hello.txt
    ls
The first `echo` command creates a file called “hello.txt” with the words “hello world” inside it. The second command gives me a directory listing of the files and should show my newly created “hello.txt” file. Then type `exit`to leave this container.
Then run:

    docker container run alpine ls
This time I can't see "hello.txt" file. That’s isolation! my command ran in a new and separate instance, even though it is based on the same image. The 2nd instance has no way of interacting with the 1st instance because the Docker Engine keeps them separated and we have not setup any extra parameters that would enable these two instances to interact.
To get back to the container that has my ‘hello.txt’ file, we can run:

    docker container ls -a
The container in which we created the “hello.txt” file is the same one where we used the `/bin/ash` shell, which we can see listed in the “COMMAND” column. The Container ID number from the first column uniquely identifies that particular container instance. In the sample output above the container ID is `e344115434e4`(in my container). We can use a slightly different command to tell Docker to run this specific container instance. Try typing:

    docker container start e344
    docker container exec <container ID> ls
    docker container exec <container ID> ls
Then I can see a directory listing and it shows the “hello.txt” file
###1.3 Terminology
images - The file system and configuration of our application which are used to create containers. 
Containers - Running instances of Docker images — containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers, and runs as an isolated process in user space on the host OS. 
Docker daemon - The background service running on the host that manages building, running and distributing Docker containers.
Docker client - The command line tool that allows the user to interact with the Docker daemon.
Docker Store - Store is, among other things, a registry of Docker images. 
