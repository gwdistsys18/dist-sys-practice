#Container

### check info

1. `docker container ls` shows us all containers that are currently **running**.
2. `docker container ls -a` shows us all containers that we **ran**.
3. `docker container diff <container ID>` shows a list of all the files that were added or changed to in the container.
4. `docker container commit <container ID>` commits the container and create an image out of it.

### run

1. `docker container run <image>` is used to run a image from local. If it is not exist in local, **docker engine** goes to its default **Docker Registry**, which is Docker Store, to look for an image named "hello-world". It finds the image there, pulls it down, and then runs it in a contianer.

   this is pretty much just like running a virtual machine, except with a central repository of VM images.

   ![](https://training.play-with-docker.com/images/ops-basics-hello-world.svg)

2. `docker container [options] run <image> <command> `  

   This command is used to run the specified image, execute the command, shutdown the image and sent back to host OS.

   Options:

   * `—detach` will run the container in the background
   * `—name` will give the continer a name

   Example:

   * `docker container run alpine ls -l` return the output of the `ls` command. When you call `run`, the Docker client finds the image(alpine in this case), creates the container and then runs a command in that container. When you run `docker container run alpine`, you provided a command(ls -l), so Docker executed this command inside the container for which you saw the directory listing. after the `ls` command finished, the container shut down.

   ![](https://training.play-with-docker.com/images/ops-basics-run-details.svg)

   * `docker container run alpine echo "hello from alpine"` 

     It will output "hello from alpine". In this case, all of that happened pretty quickly and again our container exited.

     Difference with VM:

     Imagine booting up a virtual machine (VM), running a command and then killing it; it would take a minute or two just to boot the VM before running the command. A VM has to emulate a full hardware stack, boot an operating system, and then launch your app - it’s a virtualized *hardware* environment. Docker containers function at the application layer so they skip most of the steps VMs require and just run what is required for the app.

   * `docker container run -it alpine /bin/sh` let us could use the interactive shell where we could type some commands. Docker has a facility for that by adding a flag to run the container in an interactive terminal.

   * `docker container run —interactive —tty —rm ubuntu bash` is used to create a ubuntu container, enter into bash and remove it when exited.

     ![](https://training.play-with-docker.com/images/ops-basics-instances.svg)

     To find out more about `run`, use `docker container run —help` to see a list of all flags it supports.

   * `docker container start <container ID>` 

   * `docker container exec <container ID> ls` 

3. `docker container exec` allows us to run a command line inside a container. 

## stop

1. `docker container stop <container>` is used to stop a container.

## remove

1. `docker container rm <container>` could remove a container.