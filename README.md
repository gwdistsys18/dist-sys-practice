# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

# Table of contents
- [Docker Container](https://github.com/JackTedo/dist-sys-practice/#docker-container)  
	- [Beginner Level](https://github.com/JackTedo/dist-sys-practice/#beginner-level * docker-container)
		- [Why docker](https://github.com/JackTedo/dist-sys-practice/#video-why-docker)  
		- [DevOps Docker Beginners Guide](https://github.com/JackTedo/dist-sys-practice/#lab-devops-docker-beginners-guide)  

- [Cloud Web Apps](https://github.com/JackTedo/dist-sys-practice/#Cloud Web Apps)  
	- [Beginner Level](https://github.com/JackTedo/dist-sys-practice/#beginner-level * Cloud Web Apps)
		- [Why docker](https://github.com/JackTedo/dist-sys-practice/#video-why-docker)  
		- [DevOps Docker Beginners Guide](https://github.com/JackTedo/dist-sys-practice/#lab-devops-docker-beginners-guide)  
	- [Intermediate Level](https://github.com/JackTedo/dist-sys-practice#intermediate-level * Cloud Web Apps)  
		- [What are Containers?](https://github.com/JackTedo/dist-sys-practice#video-what-are-containers)  



## Docker Container
### Beginner Level
#### [Video: Why Docker?](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)  
Time: 15 min   

1. Docker is all about speed.  
2. Docker is freeing up a lot of tasks, such as keeping existing software updated, keeping it running, fixing its problems, backing it up and so on, which leave us less time to deploy new software.  

#### [Lab: DevOps Docker Beginners Guide](https://training.play-with-docker.com/ops-s1-hello/)  
Time: 1 hr  

1. Installing docker  
	I'm using mac, so I choose to use brew to install docker. After installing docker by `brew install docker`, I met this problem `docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?.`. Then, I found the solution from [friederbluemle](https://stackoverflow.com/questions/44084846/cannot-connect-to-the-docker-daemon-on-macos) on stack overflow. If you don't wanna jump into that link, here is the solution.   
	
	> `brew cask install docker` Then launch the Docker app. Click next. It will ask for privileged access. Confirm. A whale icon should appear in the top bar. Click it and wait for "Docker is running" to appear. You should be able to run docker commands now.  
  
2. Running my first container  
	Command: `docker conntainer run hello-world`  
	![Imgur](https://i.imgur.com/NiR3Wan.png)  
  
  
Notes:  

1. Containers and images are different concept.  
	__Images__: The file system and configuration(read-only) of application which are used to create containers.   
	__Containers__: Containers are running instances of Docker images. Containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers and runs as an isolated process in user space on the host OS.  
  
2. Container Isolation  
	Even though two containers share the same image, these two instances are separated from each other. No matter what happens in an instance, it won't affect other instances. 



