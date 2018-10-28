# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 container and dockers
***
>[why docker? why now?](https://www.youtube.com/watch?v=RYDHUTHLf8U&t=0s&list=PLBmVKD7o3L8tQzt8QPCINK9wXmKecTHlM&index=23)

*company shift
dot cloud to docker inc
- containers are the next once-in-a-decade shift in infrastructure and process that mak or break you
### diferent period different focus
- 90s PC wave where we sifted from a traditional mainframe to a pc distrubuted architecture 
- 00s baremetal to virual  virtuliazation because our servers were too powerful 
- 10s datacenter to cloud, amazon released the AWS solution that was the first i real idea we had
- now host to container(serverless)
>like all these shifts, migrating is the hard part, and docker is focused on the migration experience

### what will docker do for me?
- speed
that is all about speed and in fact all these major shifts and infrastructure have always been about speed, about the speed of software deployments, the speed of business and getting things done in a company profit. you will see big benefits in all these areas as you adopt the various tools of the ecosystem, but it really covers the entire life cycle of the software management and this gets us to the matrix of health story which is really around if you don't have containers.
allow you run and test the software the same way everywhere  you are running
don't need to speed too much time to the existing problem, so allowing us to get more of our time back to innovate

- cost
reduction in VM cosets
fewer CPU's
multible averge cpu utilization

***tips:docker project arre open-source, have a party in the march for celebrating docker releasing and we have soort of party with birthday cake and have fun and have workshops***
spent 20 min
***

>[Lab: Devops Docker Beginners Guide](https://training.play-with-docker.com/ops-s1-hello/)

### running your first container
+ type uname -a 
  it will show: 
  >Linux node1 4.4.0-138-generic #164-Ubuntu SMP Tue Oct 2 17:16:02 UTC 2018 x86_64 Linux
+ type docker container run hello-world
  they will have 3 step
the Docker engine running in your terminal tried to find an image named hello-world. Since you just got started there are no images stored locally (Unable to find image...) so Docker engine goes to its default Docker registry, which is Docker Store, to look for an image named “hello-world”. It finds the image there, pulls it down, and then runs it in a container.

### docker images
use alpine as a train container
+ type docker images pull alpine
  it will pull from library/alpine
+ type docker images ls
  you can find all images in the local host
+ use docker container run command to run it (docker container run alpine ls -l)
  when the whole running, the container will shut down
*** Docker containers function at the application layer so they skip most of the steps VMs require and just run what is required for the app. Now you know why they say containers are fast!***
+  docker container run -it alpine /bin/sh
  we can boot a small linux system, and now will are inside it. and wo can use several linux command 
  ***we can use ctrl+d to exit***
+type docker container ls
 you can find the container's condition when now existing
 +type docker container ls -a
 it will show history
 
 ### container Isolation
 + docker container run -it alpine /bin/ash
 use it go inside, and create a hello.txt file inside, 
 + docker container run alpine ls
 but can not find hello.txt because each container is isolated.
docker users take advantage of this feature not only for security, but to test the effects of making application changes. Isolation allows users to quickly create separate, isolated test copies of an application or service and have them run side-by-side without interfering with one another. In fact, there is a whole lifecycle where users take their changes and move them up to production using this basic concept and the built-in capabilities of Docker Enteprise.
***if we want use the last container, we can use docker container start <id> tor restart and then use doceker exec <id> ls to find that***
**spend 2 hour**



 
 



 
  
  
  
  
  
  
  
  





## Area 2
> Include notes here about each of the links
