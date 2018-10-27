# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)  
  
# Table of contents
- [Docker Container](https://github.com/jzhzj/dist-sys-practice#docker-container)  
	- [Beginner Level](https://github.com/jzhzj/dist-sys-practice#beginner-level)
		- [Why docker](https://github.com/jzhzj/dist-sys-practice#video-why-docker)  
		- [DevOps Docker Beginners Guide](https://github.com/jzhzj/dist-sys-practice#lab-devops-docker-beginners-guide)  
	- [Intermediate Level](https://github.com/jzhzj/dist-sys-practice#intermediate-level)  
		- [What are Containers?](https://github.com/jzhzj/dist-sys-practice#video-what-are-containers)  
		- [VMs Versus Containers](https://github.com/jzhzj/dist-sys-practice#video-vms-versus-containers)
		- [Docker Intro](https://github.com/jzhzj/dist-sys-practice#lab-docker-intro)
		- [Doing more with Docker Images](https://github.com/jzhzj/dist-sys-practice#lab-doing-more-whith-docker-images)
		- [VMs Versus Containers Deep Dive](https://github.com/jzhzj/dist-sys-practice#video-vms-versus-containers-deep-dive)

## Docker Container
### Beginner Level
#### [Video: Why Docker?](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)  
Time: 15 min   

1. Docker is all about speed.  
2. Docker is freeing up a lot of tasks, such as keeping existing software updated, keeping it running, fixing its problems, backing it up and so on, which leave us less time to deploy new software.  

#### [Lab: DevOps Docker Beginners Guide](https://training.play-with-docker.com/ops-s1-hello/)  
Time: 1 hr  

Steps:  
  
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

### Intermediate Level
#### Containers:
##### [Video: What are Containers?](https://www.youtube.com/watch?v=EnJ7qX9fkcU)  
Time: 30 min  
  
1. Image Layering  
	The images are arranged in a hierarchy structure. Let's say, you have an operating system busybox, then sshd and perl running on busybox, and your app at the top layer of the hierarchey structure.
2. Docker File  
	A docker file is an environment in a text file. The start of a docker file is `From:`. `From` is the parent image where this docker file is inheriting from. `From` is followed by any number of things that we want to configure the image that this docker file is going to create. So, a docker file ultimately ends up creating an image.
3. Transformation  
	We can build an image by a docker file. We can use images to run containers. We can do modification in containers then commit the containers into new images. So, we can move between these stages.
4. Contents in a container  
	All of the dependencies above the kernel are packaged inside of the container. So, when you run the container in an operating system, you don't acctually install anything. Everything is already inside the container, and the application just sits on its own stack. So, when you delete these images, it's all gone. Then you can run stuff on your environments without polluting them.  
5. Docker Daemon  
	The docker daemon is the engine of the docker container.
6. Docker Client  
	The CLI tool to manipulate docker daemon.
7. Registry  
	A registry is a thing that contains images. You can pull and push from the registry at will.
  
##### [Video: VMs Versus Containers](https://www.youtube.com/watch?v=L1ie8negCjc)  
Time: 15 min. 

1. Where VM lives  
	VM lives between the phyiscal infrastructure and OS layer. It masks all the details of delegation of the hardware.
2. Where Docker Container lives  
	Docker container lives between the OS and your app. The OS can only have the minimum stuffs, but the container has all the OS dependencies for the app running in this container.  
	
##### [Lab: Docker Intro](https://training.play-with-docker.com/beginner-linux/)  
Time: 50 min  

1. When you already start a container, and you want to execute command, use `docker container exec -it <Command>`
2. When you want to connect to a new shell process inside an already-running container, you can use `docker container exec -it <Shell>`
3. Structure of Docker File  
	Docker file starts with `FROM`, which shows what image does this image lie on. `COPY` copies files from the Docker host into the image, at a known location. `EXPOSE` documents which ports the application uses. `CMD` specifies what command to run when a container is started from the image. Notice that we can specify the command, as well as run-time arguments.  
4. Build image from docker file  
	e.g. `docker image build --tag jzhzj/linux_tweet_app:1.0 .`  
	Use the `docker image build` command to create a new Docker image using the instructions in the Dockerfile.  
	- `--tag` allows us to give the image a custom name. In this case it’s comprised of our DockerID, the application name, and a version. Having the Docker ID attached to the name will allow us to store it on Docker Hub in a later step  
	- `.` tells Docker to use the current directory as the build context
Be sure to include period (.) at the end of the command.  
5. Modify the running website  
	If you wanna modify a running container, you can mount a host directory into a directory inside the container. When you modify files in the host directory, it reflects at once in the container. However the image from which the container starts from does not change.  
6. Publish your images   
	First: `docker login`  
	Next: `docker image push <Image name:Version>`  
	Finally: You can check your newly-pushed Docker images at `https://hb.docker.com/r/<your docker id>/`
  
##### [Lab: Doing more with Docker Images](https://training.play-with-docker.com/ops-s1-images/)  
Time: 1 hr. 

1. To restart an stopped container  
	`docker container start CONTAINER_ID` This command just start the container but doesn't show the terminal. Use `docker exec -it CONTANINER_ID SHELL` to show a terminal.  
2. Commit a modified container  
	`docker container commit CONTAINER_ID`  
	This will create a new image, except it has no information in the REPOSITORY or TAG columns.  
	`docker image tag <IMAGE_ID> ourfiglet`  
	Adding this information to an image is known as tagging an image. From the previous command, get the ID of the newly created image and tag it.  
3. Build an image with a docker file  
	Prepare a Node.js file in your work dir.
	e.g.  
	>
	var os = require("os");  
	var hostname = os.hostname();  
	console.log("hello from " + hostname);  
	
	Prepare a Dockerfile in your work dir.  
	e.g.  
	>
	FROM alpine  
	RUN apk update && apk add nodejs  
	COPY . /app  
	WORKDIR /app  
	CMD ["node","index.js"]  
	
	Use `docker image build -t hello:v0.1 .` to build the image.  
4. Terminology  
	- Layers - A Docker image is built up from a series of layers. Each layer represents an instruction in the image’s Dockerfile. Each layer except the last one is read-only.
	- Dockerfile - A text file that contains all the commands, in order, needed to build a given image. The [Dockerfile reference](https://docs.docker.com/engine/reference/builder/) page lists the various commands and format details for Dockerfiles.
	- Volumes - A special Docker container layer that allows data to persist and be shared separately from the container itself. Think of volumes as a way to abstract and manage your persistent data separately from the application itself.

##### [Video: VMs Versus Containers Deep Dive](https://www.youtube.com/watch?v=PoiXuVnSxfE)  
Time: 15 min  

1. Size  
	The size of an image of a VM containing user application and OS kernel can range from hundreds of megabytes to tens of gigabytes.  
	The size of an image of a container containing the application and all the dependencies that the application requires to run can range from tens of megabytes up to gigtabytes.
2. Security concern
	There is almost no way for attackers to hack the host running a VM from the processes running inside the VM. However, since the docker containers using the same kernel, it's much easier to attack the host from the process inside a container if there are bugs inside of the kernel.
3. Boot time  
	The boot time for processes in both techniques are almost the same, let's say 500 ms. The time for start up the kenel of VM can be up to 3 or 4 seconds, while there is almost no time taken to boot a container. There is only two steps to start up a container: one is a kernel operation which is setting up the process sandbox and the other one is starting up the application itself.

#### Networking and Orchestration:

##### [Lab: Docker Networking](https://training.play-with-docker.com/docker-networking-hol/)  
Time:  1 hr 30 min

1. NAT  
	e.g. Use `docker run --name web1 -d -p 8080:80 nginx` to start a new container running nginx, and map port 8080 on the Docker host to port 80 inside of the container. The traffic that hits the Docker host on port 8080 will be passed on to port 80 inside the container.  
2. Overlaying Networking  
	- Initialize a new Swarm: `docker swarm init --advertise-addr $(hostname -i)`  
	- Make another node join a swarm as a worker  
	Type this into the second terminal:  
	`docker swarm join 
	--token
SWMTKN-1-69b2x1u2wtjdmot0oqxjw1r2d27f0lbmhfxhvj83chln1l6es5-37ykdpul0vylenefe2439cqpf 10.0.0.5:2377`  
	- Create an overlay network: `docker network create -d overlay overnet`  
	- Create a service on both nodes using the overlay network: `docker service create --name myservice 
--network overnet 
--replicas 2 
ubuntu sleep infinity`  

	>NOTE: All docker container run an embedded DNS server at 127.0.0.11:53  

##### [Lab: Swarm Mode Introduction]()  
Time: 1 hr 20 min  

1. Initialize your swarm  
	Use `docker swarm init --advertise-addr $(hostname -i)`. This will initialize your current host as a manager. Type the output into the host that you want to use as a worker.  
	
2. docker-stack.yml file  
	This YAML file defines our entire stack: the architecture of the services, number of instances, how everything is wired together, how to handle updates to each service. It is the source code for our application design. A few items of particular note:
	- Near the top of the file you will see the line “services:”. These are the individual application components. In the voting app we have redis, db, vote, result, worker, and visualizer as our services.  
	- Beneath each service are lines that specify how that service should run:  
		- _image_ is the same idea from docker file: this is the container image to use for a particular service.  
		- _Ports_ and _networks_ are mostly self-explanatory although it is worth pointing out that these networks and ports can be privately used within the stack or they can allow external communication to and from a stack.  
		- Note that some services have a line labeled _replicas_: this indicates the number of instances, or tasks, of this service that the Swarm managers should start when the stack is brought up. The Docker engine is intelligent enough to automatically load balance between multiple replicas using built-in load balancers. (The built-in load balancer can, of course, be swapped out for something else.)  
3. Deploy stack  
	Use `docker stack deploy --compose-file=docker-stack.yml voting_stack`  

4. Scaling an Application  
	When you want to scale your service, use `docker service scale <Service>=Number`. This command will automatically scale up your service with more tasks. The Docker engine is intelligent enough to automatically load balance between multiple replicas using built-in load balancers.
	
4. Terminology  
	- Stack: Group of interrelated _services_ & depencencies. Orchestrated as a unit. Production applications are one stack, and sometime more.  
	- Tasks: Atomic unit of a _service_ and scheduling in Docker. One container instance per task.  
	- Service: A _stack_ component, including a container image, number of replicas (tasks), ports, and update policy.

##### [Video: Kubernetes vs Swarm](https://www.youtube.com/watch?v=L8xuFG49Fac)  
Time: 6 min  

- Swarm is a built-in Orchestration System for manipulating your container on a cluster of host, while Kubernetes is developed by Google.
- These days Kubernetes is more popular, since Kubernetes has far more features than Swarm.

##### [Video: Kubernetes in 5 Minutes](https://www.youtube.com/watch?v=PH-2FfFD2PU)  
Time: 7 min  

- Kubernetes needs a .yaml file to initialize the Orchestration.
- Kubernetes like Swarm, it is smart enought to schedule tasks to multiple workers. Even if a worker's gone some time, Kubernetes can reschedule the tasks to other workers.

##### [Kubernetes](https://kubernetes.io)

##### Install Docker on a cluster of EC2 VMs and use Kubernetes to orchestrate them

#### Bring it all together:

##### [AWS Tutorial: Break a Monolith Application into Microservices]()

## Area 2
> Include notes here about each of the links
