---
title: Docker and Containers - Docker Images Lab
date: "2018-10-29T22:12:03.284Z"
---

> This lab works on 2 ways of creating a docker image, namely, from binary files of container or from Dockerfile.
The advantages of using Dockerfile and how Dockerfile relates to image layers are both discussed.

## Official Links

[Lab: Doing more with Docker Images](https://training.play-with-docker.com/ops-s1-images/)

## Operations

### Image Creation from a Container

![create from container](https://training.play-with-docker.com/images/ops-images-commit.svg)

This example shows that we can create a container, 
add all the libraries and binaries in it and then commit it in order to create an image.
This approach of manually installing software in a container and then committing it to a custom image is just one way to create an image. 
It works fine and is quite common.

- Start by running an interactive shell in a ubuntu container

```bash
docker container run -ti ubuntu bash
```

- Install a package called figlet in this container

```bash
apt-get update
apt-get install -y figlet
figlet "hello docker"
```

- Exit container and find out its container ID

```bash
docker container ls -a
```

- “Commit” this container to create an image

Commit creates an image locally on the system running the Docker engine.

```bash
docker container commit CONTAINER_ID
```

- Find out image ID and tag the image

```bash
docker image ls
docker image tag <IMAGE_ID> ourfiglet
```

- Run a container based on the newly created _ourfiglet_ image

```bash
docker container run ourfiglet figlet hello
```


### Image Creation from Dockerfile

![create from dockerfile](https://training.play-with-docker.com/images/ops-images-dockerfile.svg)

Instead of creating a static binary image, we can use a file called a Dockerfile to create an image. 
The final result is essentially the same, but with a Dockerfile we are supplying the instructions for building the image, 
rather than just the raw binary files. 
This is useful because it becomes much easier to manage changes, especially as your images get bigger and more complex.

- Create _index.js_ file with content below

```javascript 1.6
var os = require("os");
var hostname = os.hostname();
console.log("hello from " + hostname);
```

- Create _Dockerfile_ with content below

```docker
FROM alpine
RUN apk update && apk add nodejs
COPY . /app
WORKDIR /app
CMD ["node","index.js"]
```

- Build image out of this Dockerfile and name it hello:v0.1

```bash
docker image build -t hello:v0.1 .
```

- Start a container to check that our applications runs correctly

```bash
docker container run hello:v0.1
```

- _Dockerfile_ Explained
    - Specifies a base image to pull __FROM__ - the alpine image we used in earlier labs.
    - Then it __RUN__s two commands (_apk update and apk add_) inside that container which installs the Node.js server.
    - Then we told it to __COPY__ files from our working directory in to the container. 
    The only file we have right now is our _index.js_.
    - Next we specify the __WORKDIR__ - the directory the container should use when it starts up
    - And finally, we gave our container a command (__CMD__) to run when the container starts.

### Image Layers

A Docker image is built up from a series of layers. 
Each layer represents an instruction in the image’s Dockerfile. 
Each layer except the last one is read-only.
This design principle is important for both security and data management. 
If someone mistakenly or maliciously changes something in a running container, 
you can very easily revert back to its original state because the base layers cannot be changed. 
Or you can simply start a new container instance which will start fresh from your pristine image.

- Inspect an image

```bash
docker image inspect alpine
```

- Get the list of layers

```bash
docker image inspect --format "{{ json .RootFS.Layers }}" alpine
```

For the custom image,

```bash
docker image inspect --format "{{ json .RootFS.Layers }}" <image ID>
```