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
![image](https://github.com/XinShuYang/dist-sys-practice/blob/master/Image/Screen%20Shot%202018-10-01%20at%2010.32.24%20AM.png)
![image](https://github.com/XinShuYang/dist-sys-practice/blob/master/Image/Screen%20Shot%202018-10-01%20at%2011.01.13%20AM.png)
## Area 2
> Include notes here about each of the links
