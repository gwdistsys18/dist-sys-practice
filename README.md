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


## Area 2
> Include notes here about each of the links
