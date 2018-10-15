# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Docker and Containers
### What is container
A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. Each container can have its own distribution but must share the same host kernel.


### What is docker
Docker is all about speed. if you don't have containers today, you need to deal with multiple types of applications which may have their own dependencies. Then you need to run them on developer machines and production. It's so complicated.

Containers allow you to package same way, run and test same way regardless of OS and setups.

A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

### Docker Architecture
##### Clent
You could describe Docker as a client server application. The daemon is the server, and the CLI is 1 of many clients. There’s also a number of third party clients.

##### Docker Host
- Docker deamon
    
The Docker daemon is a service that runs on your host operating system. It currently only runs on Linux because it depends on a number of Linux kernel features, but there are a few ways to run Docker on MacOS and Windows too.


The Docker daemon itself exposes a REST API. From here, a number of different tools can talk to the daemon through this API.


- Containers

A container is a runtime instance of an image--what the image becomes in memory when executed (that is, an image with state, or a user process). 

- Images

An image is an executable package that includes everything needed to run an application--the code, a runtime, libraries, environment variables, and configuration files.

##### Registry
A place to find and download Docker images.

### Docker Command Line
|command      | function
|-------------|----------------
|docker pull  |get images
|docker build | build images
|docker images| list all images
|docker run   | run container
|docker ps    |list all running containers



## Area 2
> Include notes here about each of the links