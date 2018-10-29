# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 Docker  
***Beginner Level:***   
*Docker basic operator*  
__docker image ls__ `[search local image file]`  
__docker container ls__ `[search running container]`  
__docker container ls -a__ `[search historical container]`  
__docker image pull &lt;name&gt;__ `[download image files]`  
__docker container run &lt;containername&gt; &lt;operator&gt;__
`[run container,return rusult ,close container]`  
__docker run -it &lt;container name&gt; &lt;operator&gt;__
`[run container,get into container,return result,still run container(exit:quit)]`  

echo "hello world" &gt; hello.txt
`[build hello.txt in current path,write"hello world"](This file in container will remain)`

__docker container start &lt;container ID&gt;__  
__docker container exec &lt;containerID&gt; &lt;operator&gt;__

**Theory Definition:**  
Container in linux os is many container processes themself. 
In the container process, it has its own process name space and cgroups.  
So,these process can be run in sandbox to be isolated.  
**Dockerfile:** use "from" at first,"from"is the parent image but this docker file is inheriting from.(use a tree structure to define the dependent library relationship)  
Dockerfile ultimately ends up creating an image.It creats the image tree that we can use to instantiate containers.  
dockerfile is the starting point for an image.  
You can build you image both from **dockerfile** and **current container**.
Then you can use the image to build more container.  
When you run a container,it will pull the file from the registory.
Then to the cache,and then set up the c group in the process name space.  
  
***Intermediate Level***  
![image](https://github.com/XinShuYang/dist-sys-practice/blob/master/Image/1Container.png)
&lt;video1-The basic structure of container&gt;
![image](https://github.com/XinShuYang/dist-sys-practice/blob/master/Image/2VM&Container.png)
&lt;video2-The comparison between VM and containers&gt;
![image](https://github.com/XinShuYang/dist-sys-practice/blob/master/Image/3VM&Container_advanced.png)  
&lt;video3-The advanced details between VM and containers&gt;  
*(1)* **The container size:** It is depend on the programming language.For example, the application used by go language can be 1 M size.However,some traditional software will need GB level storage. And if the application need user space tool. The container will build based on another user space container.  
*(2)* **Isolation:** VM is a sandbox, it has a clear boundary,so the attack wil be very hard because the vm is very isolated on its host machine.In container side, it is easier to attack the kernel from the process in container.  
*(3)* **Boot time:** Boot time in VM has 2 sections. One is System check section(including X86post,EFI or Boot check,kernel boot,init startup),usually3-4seconds;The second is porcess running section(about 5ms). If you use system v or parallel on VM. Its speed will increase close to container. Then container is started.First setting up the process sandbox and the other one is  staring up the application. This is very fast.  
![image](https://github.com/XinShuYang/dist-sys-practice/blob/master/Image/4docker_swarm.png)  
&lt;video4-Docker Swarm basic structure&gt;  
docker swarm is less powerful than the kubernate. But it is easier to use.
![image](https://github.com/XinShuYang/dist-sys-practice/blob/master/Image/5kubernetes.png)  
&lt;video5-Kubernetes simple structure&gt;  
There are one **kubernate cluster server** and several **worker nodes**.Each worker has a kubernate process which is responsable to communicate with the cluster server. User case:In the deployment file there are mainly two part:Pod has one or several container image. User can set the replicas number. If a worker node die, the cluster server will be noticed and send a new task with losed job to living workers.
## Area 2
> Include notes here about each of the links
