# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)



# 1.what is -it
Single character command line options can be combined, so rather than typing docker run -i -t --name test busybox sh, you can write docker run -it --name test busybox sh.



# 2.Confused about Docker -t option to Allocate a pseudo-TTY

What exactly does this option do? I've been reading a lot on TTY and am still confused. I played around with not having the -t and just -i and it seems like programs that expect user input throw an error without the -t. Why is it important for pseudo-TTY to be enabled?

The "-t" option goes to how Unix/Linux handles terminal access. In the past, a terminal was a hardline connection, later a modem based connection. These had physical device drivers (they were real pieces of equipment). Once generalized networks came into use, a pseudo-terminal driver was developed. This is because it creates a separation between understanding what terminal capabilities can be used without the need to write it into your program directly (read man pages on stty, curses).

So, with that as background, run a container with no options and by default you have a stdout stream (so docker run | <cmd> works); run with "-i", and you get stdin stream added (so <cmd> | docker run -i works); use "-t", usually in the combination "-it" and you have a terminal driver added, which if you are interacting with the process is likely what you want. It basically makes the container start look like a terminal connection session.



# 3.what is docker image? is it a real image?(for confusing question.)
A Docker image is a file, comprised of multiple layers, used to execute code in a Docker container. An image is essentially built from the instructions for a complete and executable version of an application, which relies on the host OS kernel. When the Docker user runs an image, it becomes one or multiple instances of that container.

# what is dockerfile
Dockerfile to build a custom app. 
the dockerid must match your dockerhub id so to successfully push it to the cloud.


# detail for image
In Docker, everything is based on Images. An image is a combination of a file system and parameters. Let’s take an example of the following command in Docker.

docker run hello-world 
The Docker command is specific and tells the Docker program on the Operating System that something needs to be done.

The run command is used to mention that we want to create an instance of an image, which is then called a container.

Finally, "hello-world" represents the image from which the container is made.

Now let’s look at how we can use the CentOS image available in Docker Hub to run CentOS on our Ubuntu machine. We can do this by executing the following command on our Ubuntu machine −

sudo docker run centos –it /bin/bash
Note the following points about the above sudo command −

We are using the sudo command to ensure that it runs with root access.

Here, centos is the name of the image we want to download from Docker Hub and install on our Ubuntu machine.

─it is used to mention that we want to run in interactive mode.

/bin/bash is used to run the bash shell once CentOS is up and running.

Displaying Docker Images
To see the list of Docker images on the system, you can issue the following command.

docker images
This command is used to display all the images currently installed on the system.

Syntax
docker images 
Options
None

Return Value
The output will provide the list of images on the system.

Example
sudo docker images
Output
When we run the above command, it will produce the following result −

Displaying Docker Images
From the above output, you can see that the server has three images: centos, newcentos, and jenkins. Each image has the following attributes −

TAG − This is used to logically tag images.

Image ID − This is used to uniquely identify the image.

Created − The number of days since the image was created.

Virtual Size − The size of the image.

Downloading Docker Images
Images can be downloaded from Docker Hub using the Docker run command. Let’s see in detail how we can do this.

Syntax
The following syntax is used to run a command in a Docker container.

docker run image 
Options
Image − This is the name of the image which is used to run the container.

Return Value
The output will run the command in the desired container.

Example
sudo docker run centos
This command will download the centos image, if it is not already present, and run the OS as a container.

Output
When we run the above command, we will get the following result −

Downloading Docker Images
You will now see the CentOS Docker image downloaded. Now, if we run the Docker images command to see the list of images on the system, we should be able to see the centos image as well.

Centos
Removing Docker Images
The Docker images on the system can be removed via the docker rmi command. Let’s look at this command in more detail.


# 5. how can the Dockfile help to create a image?
   A:if you create a image without a /root/Dockerfile  file (here the root could be any the directory you are)
      then you will get the error that:
      "unable to prepare context: unable to evaluate symlinks in Dockerfile path: lstat /root/Dockerfile: no such file or directory." 
      So the docker system will check a file that its name is called "Dockerfile" in your directory and use the context of it to create the image.
      
  <img src="https://training.play-with-docker.com/images/ops-images-dockerfile.svg" > 
      
      and a update version when we are going to use some of the cache data from v0.1.
      
  <img src="https://training.play-with-docker.com/images/ops-images-cache.svg">

# Replicated and global services
There are two types of service deployments, replicated and global.

For a replicated service, you specify the number of identical tasks you want to run. For example, you decide to deploy an HTTP service with three replicas, each serving the same content.

A global service is a service that runs one task on every node. There is no pre-specified number of tasks. Each time you add a node to the swarm, the orchestrator creates a task and the scheduler assigns the task to the new node. Good candidates for global services are monitoring agents, an anti-virus scanners or other types of containers that you want to run on every node in the swarm.

The diagram below shows a three-service replica in yellow and a global service in gray.
<img src="https://docs.docker.com/engine/swarm/images/replicated-vs-global.png">




# Same questions need to deal: 
1 what is node

  what is swarm
  
  what is service
  
  how does replicated work
  
  what is network means in the docker commend line.


