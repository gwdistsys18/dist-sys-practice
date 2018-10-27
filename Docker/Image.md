## Image

## Command

1. `docker image pull <image>`, the pull command fetches the image from the **Docker Registry** and saves it in our system.
2. `docker image ls` is used to see a list of all images on our system.
3. `docker image insepect <image>` could check the detailed info about specified image.
4. `docker image tag <image ID> <new name>` get a image and rename it. 
5. `docker image remove <image>` could remove one image.
6. `docker image save -o <newName> <image>` export a image to local environment.
7. `docker image load —input <image>` import a image to system.
8. `docker image push <image>` push an image to docker hub.
9. `docker image history <image ID>` checks out the image we created before.

## Image Layers

**If we modify a context and rebuild an image**, the docker recognized that we had already built some of these layers in our earlier image builds and since nothing had changed in those layers it could simply use a cached version of the layer, rather than pulling down code a second time and running those steps. Docker’s layer management is very useful to IT teams when patching systems, updating or upgrading to the latest version of code, or making configuration changes to applications. Docker is intelligent enough to build the container in the most efficient way possible, as opposed to repeatedly building an image from the ground up each and every time.

![](https://training.play-with-docker.com/images/ops-images-cache.svg)

## Image Inspection

How could  we check what is inside the container? Docker has an `inspect` command for images and it returns details on the container image. 

There is a lot of information in there:

- the layers the image is composed of
- the driver used to store the layers
- the architecture / OS it has been created for
- metadata of the image
- …

You may have noticed that the image information is in JSON format. We can take advantage of that to use the inspect command with some filtering info to just get specific data from the image.

`docker image inspect --format "{{ json .RootFS.Layers }}" <image ID>` shows layer information. 

Another important note about layers: each layer is immutable. As an image is created and successive layers are added, the new layers keep track of the changes from the layer below. When you start the container running there is an additional layer used to keep track of any changes that occur as the application runs (like the “hello.txt” file we created in the earlier exercises). This design principle is important for both security and data management. If someone mistakenly or maliciously changes something in a running container, you can very easily revert back to its original state because the base layers cannot be changed. Or you can simply start a new container instance which will start fresh from your pristine image. And applications that create and store data (databases, for example) can store their data in a special kind of Docker object called a **volume**, so that data can persist and be shared with other containers. We will explore volumes in a later lab.

## Build

###Build from container

1. In order to make the following commands more copy/paste friendly, export an environment variable containing your DockerID.

   `export DOCKERID=<your docker id>`

2. Use the `docker image build` command to create a new Docker image using the Dockerfile

   - `—tage` allows us to give the image a custom name. In this case it’s comprised of our DockerID, the application name, and a version. Having the Docker ID attached to the name will allow us to store it on Docker Hub.
   - `.` tells Docker to use the current directory as the build context

   example: `docker image build --tag $DOCKERID/linux_tweet_app:1.0 .`

**Modify**

When you’re actively working on an application it is inconvenient to have to stop the container, rebuild the image, and run a new version every time you make a change to your source code.

One way to streamline this process is to mount the source code directory on the local machine into the running container. This will allow any changes made to the files on the host to be immediately reflected in the container.

We do this using something called a [bind mount](https://docs.docker.com/engine/admin/volumes/bind-mounts/).

When you use a bind mount, a file or directory on the host machine is mounted into a container running on the same host.

For example, we'll use the `—mount` flag to mount the current directory on the host.

```docker container run \ --detach \ --publish 80:80 \ --name linux_tweet_app \ --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html \ $dockerid/linux_tweet_app:1.0
docker container run \
--detach \
--publish 80:80 \
--name linux_tweet_app \
--mount type=bind,source="$(pwd)",target=/usr/share/nginx/html \
$DOCKERID/linux_tweet_app:1.0
```

After we update the container, the website will change.

**However**, if we delete the container and create a new one, we find the change is not saved. So, we need to save the modification to the image, (meaning rebuild the image).

` docker image build --tag $DOCKERID/linux_tweet_app:2.0 .`

###Build from commit

`docker container commit <container ID>` commits the container and create an image out of it.

###Build from Dockerfile

The final result is essentially the same, but with a Dockerfile we are supplying the instructions for building the image, rather than just the raw binary files. This is useful because it becomes much easier to manage changes, especially as your images get bigger and more complex.

- [FROM](https://docs.docker.com/engine/reference/builder/#from) specifies the base image to use as the starting point for this new image you’re creating.
- [COPY](https://docs.docker.com/engine/reference/builder/#copy) copies files from the Docker host into the image, at a known location. In this example, `COPY` is used to copy two files into the image: `index.html`. and a graphic that will be used on our webpage.
- [EXPOSE](https://docs.docker.com/engine/reference/builder/#expose) documents which ports the application uses.
- [CMD](https://docs.docker.com/engine/reference/builder/#cmd) specifies what command to run when a container is started from the image. Notice that we can specify the command, as well as run-time arguments.

example:

![](https://training.play-with-docker.com/images/ops-images-dockerfile.svg)

**What just happened?** We created two files: our application code (index.js) is a simple bit of javascript code that prints out a message. And the Dockerfile is the instructions for Docker engine to create our custom container. This Dockerfile does the following:

1. Specifies a base image to pull **FROM** - the *alpine* image we used in earlier labs.
2. Then it **RUN**s two commands (*apk update* and *apk add*) inside that container which installs the Node.js server.
3. Then we told it to **COPY** files from our working directory in to the container. The only file we have right now is our *index.js*.
4. Next we specify the **WORKDIR** - the directory the container should use when it starts up
5. And finally, we gave our container a command (**CMD**) to run when the container starts.

Recall that in previous labs we put commands like `echo "hello world"` on the command line. With a Dockerfile we can specify precise commands to run for everyone who uses this container. Other users do not have to build the container themselves once you push your container up to a repository (which we will cover later) or even know what commands are used. The *Dockerfile* allows us to specify *how* to build a container so that we can repeat those steps precisely everytime and we can specify *what* the container should do when it runs. There are actually multiple methods for specifying the commands and accepting parameters a container will use, but for now it is enough to know that you have the tools to create some pretty powerful containers.