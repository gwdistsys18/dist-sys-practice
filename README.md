# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 - Docker and Containers

* [Why Docker Video ~10 mins](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)
  * Docker and containers are leading to a major infrastructure shift
  * @gordonTheTurtle
  * Docker seeks to provide speed in Development, Build, Test, Deploy, Update, and Recovery
  * Tons of big companies are shifting to Docker (two big case studies: PayPal and MetLife)
  * Big boost in developer productivity and decrease in infrastructure costs

* [Docker Beginner Lab ~50 mins](https://training.play-with-docker.com/ops-s1-hello/)
  * Understanding how the docker repository works to host images
    * Docker pulls an image from the docker hub
  * Docker creates a container from the image, which runs the executable
  * Docker run (example command: `docker run alpine ls -l`)
    * Pulls container if necessary (container named `alpine`)
    * Starts container (container named `alpine`)
    * Runs executable (executable that is run is `ls -l`)
  * To use an interactive terminal, use the `-it` argument
  * `docker container ls` shows all running containers
  * `docker container ls -a` shows all containers including statuses
  * Docker containers are isolated from each other
  * You can start containers and pass commands to them to `exec`

* [What are Containers Video](https://www.youtube.com/watch?v=EnJ7qX9fkcU)
  * At its simplest definition a container is an isolated process within a host OS
  * Container processes and its container lifecycle are tightly coupled
  * Containers are created from images - image layering (covered in "Doing More with Docker Images Lab")
  * Dockerfiles create images
  * Docker registry and cache
  * Docker client does container lifecycle management as well as network and storage configuration

* [VMs Versus Containers Video](https://www.youtube.com/watch?v=L1ie8negCjc)
  * VM needs hypervisor, which does NIC, storage, hardware monitoring (agents, kernel modules)
  * VMs have NIC, storage, can be sized
  * Containers have docker engine in OS
  * Container image contains OS dependencies and application

* [Docker Intro Lab ~20 mins](https://training.play-with-docker.com/beginner-linux/)
  * Introduction was overlapping content from Docker Beginner Lab
  * `cat /etc/issue` is a good way to tell what you are running on
  * Committing containers is bad, better to use a repeatable `Dockerfile`
  * Learned how to start up mysql in the background on a container
  * Learned how Dockerfiles work and the basic syntax
  * `stop` gracefully stops container, `rm` permanently removes it, `--force` removes forcefully without shutting down
  * Learned how to build a new image and push to Docker Hub when you want to update

* [Doing More with Docker Images Lab ~25 mins](https://training.play-with-docker.com/ops-s1-images/)
  * If we install an image then make some changes to it on the interactive shell, we can see the differences using `docker container diff <containerID>`
  * If we wanted a new image that contained these changes we could use `docker container commit <containerID>`
  * This is useful for creating a new image, however a Dockerfile is even more useful
  * Add tags to images using `docker image tag <imageID> <tag>`
  * Dockerfile specifies how to setup a container based off of a base image
  * Docker image history keeps track of image layers (similar to git commit history)
  * Layers saves us time by caching levels of builds to avoid having to go through the whole process when unnecessary

* [VMs Versus Containers Deep Dive Video](https://www.youtube.com/watch?v=PoiXuVnSxfE)
  * Container images can be very small in size if built using container-oriented technologies
  * Otherwise they can be similar in size to VMs
  * VM isolation is as far as we know impenetrable (fully isolated x86 instances)
  * Containers are only as secure as the process they are running on - kernel insecurities -> container insecurities
  * Containers start fast but we can speed up VMs by using EFI and systemd to do things in parallel and faster

* [Docker Networking Lab ~35 mins](https://training.play-with-docker.com/docker-networking-hol/)
  * `docker network` is the primary command to manage networks with Docker
  * Docker uses a docker0 network to bridge containers to the host network
  * Able to map ports into the container and use `docker ps` to view port mappings
  * Swarms are replica groups of containers led by leaders with workers
  * Created a swarm with one node as a manager and joined the second node as a worker
  * Overlay networks are created on the manager node and deployed to worker nodes as needed, which is cool
  * You can create a service on the overlay network with replicas, which will deploy onto nodes and wait for it to start (ex. `docker service create --name myservice \
--network overnet \
--replicas 2 \
ubuntu sleep infinity`)
  * Overlay network gives two nodes IPs on a network
  * Service discovery works by running a local Docker nameserver on 127.0.0.11:53 - this allows us to use service names rather than IP addresses if desired
  * Leave a swarm with `docker swarm leave --force`

* [Swarm Mode Introduction Lab ~30 mins](https://training.play-with-docker.com/ops-s1-swarm-intro/)
  * Setup swarm in identical manner to last tutorial - `docker swarm init --advertise-addr $(hostname -i)`.  Join swarm from other node with the command in the output of the first node's `docker swarm init` command
  * `docker node ls` lists nodes in swarm (only works on manager)
  * `docker-stack.yml` can be used to deploy a "stack" (list of services that can be deployed together)
  * `docker stack deploy --compose-file=<stack file> <stack name>` is the command for deploying a stack based on a config
  * `docker stack` has other useful sub-commands such as `services`, `ps`, and `ls`
  * Deployed voting application via stack and saw replicas running on multiple nodes
  * `docker service scale <servicename>=<scalesize>` is an insanely awesomely simply way to scale your application

* [Kubernetes vs Swarm Video](https://www.youtube.com/watch?v=L8xuFG49Fac)
  * Both are orchestration systems for Docker
  * Kubernetes and Swarm are in competition - have to choose between the two
  * Kubernetes is probably the more popular of the two
  * Kubernetes is more mature, with more features, and is more widely used

* [Kubernetes in 5 Minutes Video](https://www.youtube.com/watch?v=PH-2FfFD2PU)
  * **FILL ME IN**

* [Learn more about Kubernetes individually ~20 mins](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
  * Followed the linked tutorial
  * Used minikube (a small-scale local Kubernetes deployment) to do the following:
    1. Create a cluster
    2. Deploy an application
    3. Expose the app
    4. Scale the number of instances of the application within the minikube cluster
    5. Update and roll back the application across all scaled instances within the cluster - rolling back the application was incredibly easy with a single command specifying version

## Area 2
> Include notes here about each of the links
