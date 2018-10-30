# Lab04: Docker Networking 

## The Docker network command
### --help

The `docker network` command is the main command for configuring and managing container networks. You will see all of the docker network subcommands after you run this command. The subcommand includes create new networks, list all existing networks, inspect a network, remove some networks, and connect or disconnect to another container.  

### List networks

`docker network ls` will list all existing container networks on the current Docker host.  each network gets a unique `ID` and `NAME`. Each network is also associated with a single driver. You can use `ID` or `NAME` to identify a network.  

### Inspect a network

The `docker network inspect` command is used to view network configuration details. These details include; name, ID, driver, IPAM driver, subnet info, connected containers, and more.  

The syntax of this command is `docker network inspect [NETWORK]`. You can use both network id or network name to identify a network.

### List network driver plugins
The `docker info` will display a lot of information about a Docker installation including the network driver plugins.  

You can find the network plugins under the `Plugins: Network:` section.

## Bridge Networking
### Basic
Every Docker host has a pre-built network called **bridge** The bridge network is associated with the bridge driver. Although they have the same name they are not the same. The locally scoped network only exists on this Docker host.  

All networks created with the bridge driver are based on a Linux bridge.

### Connect a container
The bridge network is the **default** network for all new containers.  

Steps to connect a container to the bridge network: 
1. Run a new container `docker run -dt ubuntu sleep infinity`. This command will run a new ubuntu container in the background and make it sleep forever. As no network was specified on the `docker run` command, the container will be added to the *bridge* network.  
2. Run `docker ps` to see the details of all running containers.
3. Run `docker network inspect bridge` to check the detail of the bridge network. The information of container connected to the bridge network can be found under the `Containers` section.

### Test network connectivity
The IP address of containers can be found in the output of `docker network inspect [NETWORK]` command. Run `ping -c5 [IPv4 Address]` to send packets to the container. 
> `ping -c5 [Address]` will send 5 packets to the destination.
  
  
The result shows that the Docker host can ping the container over the bridge host. And the container can also connect to the outside world via bridge network.

### Configure NAT for external connectivity
NAT stands for **"Network Address Translation"**  

To map the host port 8080 to the container port 80 for a nginx container, use the command `docker run --name web1 -d --publish 8080::80 nginx`.  
> `--publish [host prot]:[container port]` will map the host port to the container port.

> If you start a new container from the official NGINX image without specifying a command to run, the container will run a basic web server on port 80.  

Review the container status and port mappings by running `docker ps`. port mapping -`0.0.0.0:8080->80/tcp` is shown. That means all messages sent to the host port 8080 will be sent to the container port 80 by the host.

## Overlay Networking
### Swarm
Swarm is a cluster of Docker Engines. Docker has a built-in tool called *swarm mode* to manage swarms.  

To initialize a docker swarm, run `docker swarm init [OPTIONS]`. For example: `docker swarm init --advertise-addr $(hostname -i)` to initialize a swarm manage node listening to the IP address returned by the $(hostname -i).  

A docker node can join the swarm by running `docker swarm join`. There are two kinds of nodes, the worker and the manager. A node can join to the swarm as worker or manager based on the token it passes to `docker swarm join`. The token can be displayed by using `docker swarm joint-token [NODE TYPE]`. The NODE TYPE can be "worker" or "manager".  

Run `docker node ls` to list all nodes in the swarm. **NOTE: Basically, all command of the swarm needs to be run in the manager nodes.**

### Create an overlay network.
`docker network creates -d overlay overnet` will create an overlay network named "overnet". The parameter `-d` specified the type of the network to create. Could be "bridge" or "overlay".  

Use `docker network ls` to list all networks in the docker host.  
> Network `ingress` and `docker_gwbridge` were created automatically when the Swarm cluster was created.  

The `overnet` network is not created in other nodes in the swarm cluster because **Docker only extends overlay networks to hosts when they are needed**.

### Create a service
`docker service` is a command to manage services.  

Run `docker service create [OPTIONS] IMAGE [COMMAND] [ARG...]` to create services. For example `docker service create --name myservice --network overnet --replicas 2 ubuntu sleep infinity` to create 2 tasks based on image Ubuntu using network “overnet” and "myservice" as the service's name.  
> `--name` Service name  
`--network` Network attachments.  
`--replicas` Number of tasks  
For more OPTIONS of `docker service create` command see <a href="https://docs.docker.com/engine/reference/commandline/service_create/#usage"> Docker docs. </a>  

   
Run `docker service ls` in the manager node to list all services currently runs.  

Run `docker service ps [Service ID]` in the manager node to list the tasks of one or more services. Filtering and formatting can be applied to this command.  
> `$ docker service ps -f "node=manager1" redis`  
`$ docker service ps --format "{{.Name}}: {{.Image}}" top`

`docker network inspect` will show detailed information about a network and only details of services/tasks which are running on the local host will be shown.  

Nodes in the same swarm cluster can communicate with each other through the network.

### Service VIP
Run `ping -c5 [service name]` inside a bash can ping a service by its name. The return IP address is the service's virtual IP address.  

Run `docker service inspect [Service name]` will see details of the service. The virtual IP address is listed at the bottom.

### Clean up  
`docker service rm [Service name]` can remove services.  

Run `docker swarm leave --force` in a swarm node to leave the swarm.
