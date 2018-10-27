# Features

## Isolation

This is a critical security concept in the world of Docker containers! Even though each `docker container run` command used the same alpine image, each execution was a separate, isolated container. Each container has a separate filesystem and runs in a different namespace; By default a container has no way of interactint with other containers, even those from the same image. Let's try another exercise to learn more about isolation.

![](https://training.play-with-docker.com/images/ops-basics-isolation.svg)