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
  * **FILL ME IN**

* [VMs Versus Containers Video](https://www.youtube.com/watch?v=L1ie8negCjc)
  * **FILL ME IN**

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

## Area 2
> Include notes here about each of the links
