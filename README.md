# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 Docker
Docker basic operator
docker image ls   [search local image file]
docker container ls [search running container]
docker container ls -a [search historical container]
docker image pull <name> [download image files]
docker container run <containername> <operator> 
[run container,return rusult ,close container]
docker run -it <container name> <operator>
[run container,get into container,return result,still run container(exit:quit)]

echo "hello world" > hello.txt 
[build hello.txt in current path,write"hello world"](This file in container will remain)

docker container start <container ID>
docker container exec <containerID> <operator>

Theory Definition:
Container in linux os is many container processes themself
in the container process, it has its own process name space and cgroups
So,these process can be run in sandbox to be isolated.
Dockerfile: use "from" at first,"from"is the parent image but this docker file is inheriting from.(use a tree structure to define the dependent library relationship)
Dockerfile ultimately ends up creating an image.It creats the image tree that we can use to instantiate containers.
dockerfile is the starting point for an image.
You can build you image both from dockerfile and  current container
Then you can use the image to build more container.
When you run a container it will pull the file from the registory
Then to the cache,then set up the c group in the process name space.

## Area 2
> Include notes here about each of the links
