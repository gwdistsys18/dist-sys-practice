# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Docker and Containers
> **why docker**

* Host to container (serverless)

* Migrating is the key and hard part focused on Docker

* Containers are the "Fastest Growing Cloud Enabling Tecnology"

* All about speed

* Reduce complexity

> **DevOps Docker Beginners Guide**

* Basic docker CLI syntax

    -```pull``` fetches a conainer image from the registry and saves it on your system.
    
    -```docker image``` interact with images loaded on the system. 
    
    -```docker container run``` run an application within a specific container. Once the application has run, the                                                       container shuts down.
    
    -```docker container run -it``` keep a container alive in an interactive envornment.
    
    -```docker container ls``` list all running containers.
    
    -```docker container start <container_id>``` start a specific container.
    
    -```docker container execute <container_id>``` interact with a running container.

* Concepts

    -Container is application abstraction, where as virtual machines are hardware abstraction

    -The Docker Registry is the location Docker looks to pull containers. In the default case, it is the Docker Store.
    
> **What are containers**

* A sandboxed process with its own environment
    
* An image in a tree
    
* A dockerfile
    
* Dockerfile is basically an environment in a text file. It is a recipe for building a container image. Each line can be considered a     layer in the container image hierarchy

* Container is packaged with all of it's dependencies with no software actually installed on the host operating system

* Docker host can pull & push images from the Registry

* Docker clients manage container lifecycles, container storage, and container networking via API calls to the Docker host

> **VMs Versus Containers**

* Seems similar but for different purposes

    -The API level of the virtual machine is below the client OS. The virtual machine hypervisor provides an abstraction for the devices      and hardware of the machine.

    -The API between the VM and the hypervisor is very simple because it will just provide a generic driver for each of the devices, but      the API between the hypervisor and the real hardware is very complicated because it must deal with any host hardware.

    -Containers take a different tradeoff. The applications are written to be linked with their own dependencies into one container
     image. This means that the host operating system does not need to multiplex the hardware among multiple VMs that each think that
     they are running on hardware. 
    
    -The docker engine allows the application to run in the same way as a normal process.

> **Docker Intro Lab**

* Check the status of container: ```docker container ls --all```

* Run an interactive bash shell: ```docker container run --interactive --tty --rm ubuntu bash```

* Spin up a MySQL container: ```docker container run --datach --name mydb -e MYSQL_ROOT_PASSWORD=<password> mysql:latest```

* Check the logs of mysql container: ```docker container logs mydb```

* Find out processes running in mysql container: ```docker container top mydb```

* Build the corresponding image: ```docker imabe build --tage <name_of_image> <location of dockerfile>```

* Run the container ```docker container run```

* ```stop``` gracefully stops container, ```rm``` permanently removes it, ```--force``` removes forcefully without shutting down

* Push container images to Docker Hub: ```docker image push <<dockerID>/<containerId>```

> **Doing More with Docker Images**

* Covered the CLI syntax for committing changes to a container, writing a docker file from scratch, and creating a new docker image from  an existing one with changes.

    -show modifications made to a container: ```docker container diff <container_id>```
    
    -create a new container image based on the container_id: ```docker container commit <container_id>```
    
    -tag the image with <IMAGE_NAME>: ```docker image tag <IMAGE_ID> <IMAGE_NAME>```
    
    -see history of an image: ```docker image history <image_id>```
    
    -see detailed information about an image file such as the layers, drivers, archetcture, and other various metadata: ```docker image inspect <image_id>```
    
> **VMs vs Containers Deepdive**

* VMs vs containers in aspects of size, isolation, and boot time

    -Often containers are smaller, for binaries that require very little from the hardware. VM's have everything except physical hardware inside VM image (kernels, efi, OS, etc). Containers may have only application data, or could have entire OS's in them.
    
    -Isolation is generally better on virtual machines, because there are more layers of emulation. Not only will an attacker need to escape the virtual process's sandbox, but also the hypervisor layer which emulates EFI and bios, in order to see other VMs running on the system. Container are only as secure as the kernerl they are running on.
    
    -Using modern tools like EFI and system which begins processes in parallel, starting VMs can be close in startup time to containers. However containers do not need to emulate hardware bootup, so they are slightly faster.
    
> **Docker Networking**

* The bridge network is created by default for all containers, and it allows communication between the host and all of the containers that are created along with the ability to ping the outside world.

* Port mapping: The docker CLI and dockerfiles system make it easy to programmatically connect containers, as well as to map host and container ports.
    
    - ```docker run --name web1 -d -p 8080:80 nginx``` will start an nginx web server, and map docker host port 8080 to container port 80 (default port where nginx will listen for connections)
    
* Docker swarm mode allows you to control many docker instances of the same application programmatically.

    -create a swarm, tell nodes to join The Swarm: ```docker swarm init --advertise-addr $(hostname -i)```
    
    -create an overlay network across the swarm: ```docker network create -d overlay overnet```
    
    -create a service and pass it to the network to be executed by the swarm: ```docker service create --name myservice --network overnet --replicas 2 ubuntu sleep infinity```
    
> **Swarm Mode Introduction**




****





## Area 2
> Include notes here about each of the links
