# Introduction

In this short write up, we will look at containers, what they are, and how easy it is to use them.  If you work in any type of software development environment, you know how complicated systems and services can get as they interact.  With many different developers working on different parts of the software, using their own languages and programming styles, things can get messy quick.  Containers is almost a programming paradigm whereby individual pieces of functionality can run in their own isolated environment, but without all the extra overhead of spining up an entire virtual machine.

# What is a container?

The easiest way to understand a container is to compare it with a virtaul machine.  Virtual machines as most of you know is an entire virtualized computer which runs on top of a real physical computer.  The virtual machine will make system calls and try to access physical hardware which will then get intercepted by the real operating system and handled on the real physical hardware, all without the VM even knowing this is happening.

PIC
source: https://www.docker.com/resources/what-container

This is great - however this 'fake' operating system that is running in the virtual machine is really just a middle man.  It does not perform any important actions other than brokering OS related calls from the virtual machine to the physical machine.  Thus we have containers which essentially cut out the middle 'fake' operating system.  Containers have everything else such as file systems, network devices, and even operating systems (minus the kernel).  The kernel is the portion of operating system code that does the low level integration with the hardware system.  This is what is shared across all containers.  This means windows containers can not run on a Linux host because they will have different underlying kernels.

# Create a Container

First you will need to install Docker.  Docker has stable releases for Windows, Mac, and Linux.  Head over to their website  and follow the instructions to install Docker on your system.

If you are like me and have a home version of Windows, then you will need to install the docker toolbox which will allow you to run docker images using VirtualBox.

After you have your installation up and running, run the command 'docker run hello-world'.  Once you do this, you will see how docker looks for the container image locally, does not find it, then downloads it from the default container registry, and runs the container.

The output of the hello-world container gives us a nice description of what just happened.

INSERT screen shot from docker hello world

The output even challenges us to do something more interesting.  We can run a bash shell with the command: docker run -it ubuntu bash.  The -it stands for interactive.  Ubuntu stands for the container, and bash stands for the program in that container.

Cool!  So we have access to a bunch of containers.  But what if we want to build a container?  Well that is pretty easy too.  First, create a new directory 'my_build' which we will be working inside of.  Inside of that directory create a file called 'Dockerfile' with the following contents:
'''
FROM python:3
ADD my_script.py /
RUN pip install pystrich
CMD [ "python", "./my_script.py" ]
'''

This file is essnetially telling docker what to do.  The first line specifies the base docker container which is a Python 3 container.  It is then telling docker to add my_script.py into the container (we have not written my_script.py yet, but we will).  Next it is telling the container to run a pip command to install a python package.  We will not actually be using this package, but it is useful to know that this is how you would do it.  And finally, the CMD line is telling the container what to actually execute when it is run, which in our case is to execute the my_script.py script with the python interpreter.

Now, we need write out my_script.py file.  Use your favorite editor and make a simple python script.  This script can be as complex or simple as you want.  But remember, if you want to use and external python packages you will need to add them as a pip install command to the Dockerfile as shown above.

To keep it simple, my python script has a single line of code: print("hello from python!").

Now, we need to build our container.  Again this is as easy as a single command from within our my_build directory.  Simple run: docker build test .

INSERT DOCKER BUILD

And it's done!  Now running it is as simple as docker run test.

INSERT DOCKER RUN TEST

# Conclusion

Containers are astoundingly easy to get up and running once you have Docker installed and working.  You are able to leverage many base containers containg programs such as Python, busy-box, and even Ubuntu.  Building on top of these contains is as easy as specifying a Dockerfile which explains what base image you will be using, and how you will be modifying it.  You can imagine taking something like your database application, which requires a big VM with a custom install image and manual processes to get it up and running, and turning it into a nice clean Dockerfile which can be started with one single command.  Container are very useful and versatile and easy to get started with!
