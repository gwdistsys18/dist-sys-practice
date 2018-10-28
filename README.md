# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

# Table of contents
- [Docker Container](https://github.com/JackTedo/dist-sys-practice/#docker-container)  
	- [Beginner Level](https://github.com/JackTedo/dist-sys-practice/#beginner-level-docker-container)
		- [Why docker](https://github.com/JackTedo/dist-sys-practice/#video-why-docker)  
		- [DevOps Docker Beginners Guide](https://github.com/JackTedo/dist-sys-practice/#lab-devops-docker-beginners-guide)  

- [Cloud Web Apps](https://github.com/JackTedo/dist-sys-practice/#Cloud-Web-Apps)  
	- [Beginner Level](https://github.com/JackTedo/dist-sys-practice/#beginner-level-Cloud-Web-Apps)
		- [AWS Tutorial: Launch a VM](https://github.com/JackTedo/dist-sys-practice/#AWS-Tutorial:-Launch-a-VM )  
		- [QwikLab: Intro to S3 ](https://github.com/JackTedo/dist-sys-practice/#QwikLab:-Intro-to-S3)  
	- [Intermediate Level](https://github.com/JackTedo/dist-sys-practice#intermediate-level-Cloud-Web-Apps)  
		- [Video: Virtualization](https://github.com/JackTedo/dist-sys-practice#Video:-Virtualization)  



## Docker Container
### Beginner Level
#### [Video: Why Docker?](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)  
Time: 15 min   

1. Docker is a software platform that allows you to build, test, and deploy applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime. Using Docker, you can quickly deploy and scale applications into any environment and know your code will run. 
2. Amazon ECS uses Docker images in task definitions to launch containers on EC2 instances in your clusters.

#### [Lab: DevOps Docker Beginners Guide](https://training.play-with-docker.com/ops-s1-hello/)  
Time: 1 hr  

1. Running your first container  
	Firstly, log into a docker sandbox environment. Type: "docker container run hello-world" to run the fist container. Container is different to VM in that A container is an application abstraction;  
  
2. Docker Image
	The pull command fetches the alpine image from the Docker registry and saves it in our system.

3. Containers and images are different concept.  
	__Images__: The file system and configuration(read-only) of application which are used to create containers.   
	__Containers__: Containers are running instances of Docker images. Containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers and runs as an isolated process in user space on the host OS.  
  
4. Container Isolation  
	Even though two containers share the same image, these two instances are separated from each other. No matter what happens in an instance, it won't affect other instances. 
	This is a critical security concept in the world of Docker containers! Even though each docker container run command used the same alpine image, each execution was a separate, isolated container. Each container has a separate filesystem and runs in a different namespace; by default a container has no way of interacting with other containers, even those from the same image.
	



