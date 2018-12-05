---
title: Docker and Containers - Docker Networking Lab
date: "2018-10-31T22:12:03.284Z"
---

> This lab shows the properties of docker network and how it relates to Linux network.
2 types of networking are demonstrated, namely bridge networking and overlay networking.
Examples are shown to prove both types of networking can work properly in NAT (PAT) and
Swarm mode. 

## Learning Outcomes

- What is Docker network and how it relates to Linux network
- What are the differences between Bridge Networking and Overlay Networking
- How to configure them
- How overlay networking works in Swarm mode

## Operations

### 0: Networking Basics

- List networks

```bash
docker network ls
```

The output shows the container networks that are created as part of a
standard installation of Docker.

- Inspect a network

```bash
docker network inspect <network>
```

The output shows network configuration details, which include 
name, ID, driver, IPAM driver, subnet info, connected containers, and more.

- List network driver plugins

```bash
docker info
```

The output shows the __bridge__, __host__, __macvlan__, __null__, and __overlay__ drivers.

### 1: Bridge Networking

Every clean installation of Docker comes with a pre-built network called __bridge__.
It’s important to note that the network and the driver are connected, but they are not the same.
The bridge driver provides single-host networking based on a Linux bridge (a.k.a. a virtual switch).

- Install _brctl_ to see Linux bridges on your Docker host.

```bash
sudo apt-get install bridge-utils
brctl show
```

#### 1.0: Connect a container

The __bridge__ network is the default network for new containers. 
This means that unless you specify a different network, all new containers will be connected to the __bridge__ network.

- Create a Ubuntu container and keep it running in the background

```bash
docker run -dt ubuntu sleep infinity
```

- Check on Linux bridges again

```bash
brctl show
```

Notice the __docker0__ bridge now has an interface connected. 
This interface connects the __docker0__ bridge to the new container just created.

#### 1.1: Test network connectivity

- Inspect container IP address

```bash
docker network inspect
```

See it from field __IPv4Address__.

- Ping Ubuntu container 5 times from Docker host

```bash
ping -c5 <IPv4 Address>
```

It should work without packet loss.

- Reach out to Github inside the Ubuntu container

```bash
docker exec -it yourcontainerid /bin/bash
apt-get update && apt-get install -y iputils-ping
ping -c5 www.github.com
```

This shows that the new container can ping the internet and therefore has a valid and working network configuration.

#### 1.2: Configure NAT for external connectivity

It is possible to use __NAT__ (Network Address Translation) to reach an _NGINX_ container from another host.
In this test, we will use __PAT__ (Port Address Translation) instead.

- Start _NGINX_ container and map container port 80 to docker host port 8080

```bash
docker run --name web1 -d -p 8080:80 nginx
```

- Visit docker host on port 8080

```bash
curl 127.0.0.1:8080
```

You should be able to see the welcome page HTML of NGINX.

### 2: Overlay Networking

#### 2.0: Start _Swarm_ mode and join another worker node

- Start _Swarm_ on one docker host (manager node)

```bash
docker swarm init --advertise-addr $(hostname -i)
```

- Join another docker host (worker node) to _Swarm_

```bash
docker swarm join \
>     --token <join token> \
>     <manager node ip:port>
```

- List nodes on _Swarm_ manager

```bash
docker node ls
```

#### 2.1 Create an overlay network

- Create a new overlay network called “overnet” on manager node

```bash
docker network create -d overlay overnet
```

- See the change in docker network

```bash
docker network ls
```

The new “overnet” network is shown on the last line of the output above. 
Notice how it is associated with the __overlay__ driver and is scoped to the entire Swarm.

On worker node, this will not appear, because Docker only extends overlay networks to hosts 
when they are needed. This is usually when a host runs a task from a service that is created on the network.

#### 2.2: Create a service that uses the overlay network

- On manager node, create a new service called _myservice_ on the _overnet_ network

```bash
docker service create --name myservice \
--network overnet \
--replicas 2 \
ubuntu sleep infinity
```

- See _myservice_ replicas running on both manager node and worker node

```bash
docker service ps myservice
```

- See changes in docker network on the worker node

```bash
docker network ls
```

The “overnet” network is shown on the last line of the output above, 
inspect to get some details.

```bash
docker network inspect overnet
```

#### 2.3: Test the network

- See worker node container IP from manager node

```bash
docker network inspect overnet
```

- Ping worker node container from the manager node container

```bash
docker exec -it yourcontainerid /bin/bash
apt-get update && apt-get install -y iputils-ping
ping -c5 <worker node container ip>
```

It should work without any packet loss, which indicates that both tasks from the _myservice_ service are on the same overlay network spanning both nodes 
and that they can use this network to communicate.

#### 2.4: Test service discovery

- Ping the “myservice” name from within the container

```bash
docker exec -it yourcontainerid /bin/bash
ping -c5 myservice
```

The container can ping the myservice service by name, we can also learn the virtual IP (VIP) assigned to the myservice service.

- Further verify the virtual IP of _myservice_

```bash
docker service inspect myservice
```

#### 2.5: Clean up

- Remove service

```bash
docker service rm myservice
```

- Kill containers

```bash
docker kill yourcontainerid1 yourcontainerid2
```

- Leave _Swarm_

```bash
docker swarm leave --force
```

## Official Links

[Lab: Docker Networking](https://training.play-with-docker.com/docker-networking-hol/)