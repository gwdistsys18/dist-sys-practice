# Docker

## Command

1. `docker image pull [name]`, the pull command fetches the alpine image from the **Docker Registry** and saves it in our system.

2. `docker image ls` is used to see a list of all images on our system.

3. `docker container run [image]` is used to run a image from local. If it is not exist in local, **docker engine** goes to its default **Docker Registry**, which is Docker Store, to look for an image named "hello-world". It finds the image there, pulls it down, and then runs it in a contianer.

   this is pretty much just like running a virtual machine, except with a central repository of VM images.

   ![](https://training.play-with-docker.com/images/ops-basics-hello-world.svg)

4. `docker container run [image] [command]`  

   This command is used to run the specified image, execute the command, shutdown the image and sent back to host OS.

   Example:

   * `docker container run alpine ls -l` return the output of the `ls` command. When you call `run`, the Docker client finds the image(alpine in this case), creates the container and then runs a command in that container. When you run `docker container run alpine`, you provided a command(ls -l), so Docker executed this command inside the container for which you saw the directory listing. after the `ls` command finished, the container shut down.

   ![](https://training.play-with-docker.com/images/ops-basics-run-details.svg)

   * `docker container run alpine echo "hello from alpine"` 

     It will output "hello from alpine". In this case, all of that happened pretty quickly and again our container exited.

     Difference with VM:

     Imagine booting up a virtual machine (VM), running a command and then killing it; it would take a minute or two just to boot the VM before running the command. A VM has to emulate a full hardware stack, boot an operating system, and then launch your app - it’s a virtualized *hardware* environment. Docker containers function at the application layer so they skip most of the steps VMs require and just run what is required for the app.

   * `docker container run -it alpine /bin/sh` let us could use the interactive shell where we could type some commands. Docker has a facility for that by adding a flag to run the container in an interactive terminal.

   * `docker container ls` shows us all containers that are currently **running**.

   * `docker container ls -a` shows us all containers that we **ran**.

     ![](https://training.play-with-docker.com/images/ops-basics-instances.svg)

     To find out more about `run`, use `docker container run —help` to see a list of all flags it supports.

   * `docker container start <container ID>` 

   * `docker container exec <container ID> ls` 

## Isolation

This is a critical security concept in the world of Docker containers! Even though each `docker container run` command used the same alpine image, each execution was a separate, isolated container. Each container has a separate filesystem and runs in a different namespace; By default a container has no way of interactint with other containers, even those from the same image. Let's try another exercise to learn more about isolation.

![](https://training.play-with-docker.com/images/ops-basics-isolation.svg)

