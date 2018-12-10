# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Docker and Containers
1. Why Docker? (10min)
* Docker (containerization) is becoming more popular
* Containerization can reduce cost and complexity
2. DevOps Docker Beginners Guide (45min)
* Docker image is a snapshot of a Docker container (can be obtained from Docker Store)
* Docker container is a running instance of a Docker image
* Use `docker run -it` to run the container under interactive mode
* The change in one container will not affect the image or other containers
3. What are Containers? (18min)
* The container is based on cgroups and process namespace of Linux
* The Docker image has a tree structure, which speeds up the rebuild process after any changes
* Structure of Docker (Host, daemon, volume, etc.)
4. VMs Versus Containers (8min)
* Containers are more "lightweight" and have faster booting time
* VM provides better isolation
* Containers can pack up all its dependencies (require less dependencies on OS level)
5. Docker Intro (20min)
* Use `docker container run --detach` to keep a container running in the background
* Use `docker exec` to execute a command inside a running container
* Docker images can be built from Docker files
* Bind mount can mount a directory from host to a container (easier file modification)
* Use `--publish` flag to map a host port to a port inside a container
6. Doing more with Docker Images (30min)
* Use `docker container commit` to create a new image from the change inside a docker container
* Dockerfiles can be used to build images
* The layer structure inside a docker image (skip all unmodified steps during building process)
7. VMs Versus Containers Deep Dive (9min)
* VMs generally have larger size than containers
* VM has slower booting time
* It's harder for a process to penetrate through the sandbox of container
8. Docker Networking (30min)
* `docker network inspect` will show the information of current networks on the Docker host in json format
* Use NAT for network between outside and container
9. Swarm Mode Introduction (30min)
* Compose controls multiple containers on a single system, while Swarm Mode also provides multi-host networking and other features such as load-balancing
* Swarm Mode is made up by containers acting as worker nodes or manager nodes
* A stack is made of several services (one or more containers)
* Use `docker service scale` to add more replicas to a service
10. Kubernetes vs Swarm (4min)
* Swarm is easier to set up but works better on simple architecture
* Kubernetes can automatically scale up the containers according to server traffic
* Swarm does load-balancing automatically
* Kubernetes is more powerful in general
11. Kubernetes in 5 Minutes (5min)
* The basic computation unit is a node
* A pod contains multiple nodes. The application can be scaled up in the unit of pods.
* A deployment controller controls how to create and run pods (example: number of replicas)
* k8s cluster service redistribute tasks to other pods if one of them is down
12. Learn more about Kubernetes on your own (30min)
* For example, `kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080` will create a new deployment "kubernetes-bootcamp" using image "google-samples/kubernetes-bootcamp:v1" and run (expose) the application on the port 8080
* Use `kubectl scale` to scale up the application (create more replicas)
* Kubernetes automatically rollback to previous version if the new version fails
13. Install Docker on a cluster of EC2 VMs and use Kubernetes to orchestrate them (90min)
* One advantage of running application on a cluster of containers is that the restart of containers (or changing the tasks) does not affect the function of application
* The load-balancer routes the incoming traffic to the right containers according to configuration policy
* The cluster is configured using .yml file. The file contains the information such as network configuration and number of replicas
* A task is a job running inside one or multiple containers. The task definition defines how a task is run by one or multiple containers. The service is an abstraction that manages multiple running tasks. If one of the container failed, the service will start the old task on a new container.
![Screenshot 1](images/screen2.png)
![Screenshot 2](images/screen3.png)
* After running the application, it is important to go through the cleanup process and delete the cluster in order to avoid additional charges


## Cloud Web Applications
1. AWS Tutorial: Launch a VM (15min)
* Choose the EC2 instance with the proper computation power and storage on AWS console
* Choose the right OS (linux distribution) for the EC2
* How to create a key pair for SSH login
* How to terminate the EC2 instance
2. QwikLab: Intro to S3 (12min)
* S3 stands for Simple Storage Service, which provides online storage
* User can manage the permission on each object, or change the permission of the entire bucket by editing the bucket policy
* S3 can store different version of each object by enabling versioning
3. Video: Virtualization
* The video introduced the history and different types of virtual machine (same as the materials discussed during lecture) as well as how cloud providers today build on this technology. The idea of vitualization went back to the era of mainframe computer. Even with some performance overhead, virtualization provides more flexibility and ability to run different OS on different architecture. VM supports such as Intel VT-x boost the performance.
4. AWS Tutorial: Install a LAMP Web Server on Amazon Linux 2
* Setting up Apache Httpd + mariaDB + php on the server
* Use the phpMyAdmin to manage the database
* For addtional security, we can configure the SSL/TLS for the web server
* The tutorial went through the steps to set up a web server on EC2. Besides the installation of required softwares, setting up the proper permission is also important. For example, to allow traffic enter the EC2 instance, we need to add a security rule for incoming traffic. It is important not to change the existing rule for SSH, otherwise it will block the attempt to SSH into the instance.
5. S3 vs EC2 + Database
* S3 has cheaper storage but EC2 is more flexible
* S3 has a very user-friendly interface
* Because S3 is object-storage, it is suitable to host static web content (images)
6. QwikLab: Intro to DynamoDB
* Use the AWS DynamoDB console to create/delete table
* Add items to DynamoDB and query the database
* DynamoDB is a NoSQL database. Some advantages of NoSQL database includes flexibility (no need to have same columns) and great scalability. DynamoDB can be used with other AWS services.
7. AWS Tutorial: Deploy a Scalable Node.js Web App
* Use Elastic Beanstalk to deploy scalable web application (Node.js)
* The Elastic Beanstalk can be configured using configuration files inside the application, which can automatically create or refer to DynamoDB tables. The load-balancer is used to both protect the EC2 instances and automatically distribute the traffic to instances. To enable the access to Internet traffic and other AWS services, we need to edit the security role. However, the tutorial is outdated and apparently does not work for free-tier single instance environment. (https://github.com/aws-samples/eb-node-express-sample/issues/5) This is the case for many AWS tutorials and documentation.
8. QwikLab: Intro to AWS Lambda
* Setting up a simple Lambda function (Python) that interacts with S3 buckets
* Using the Testing and Logging functions on the console
* A lambda function is made of a trigger and an corresponding action. In the example, the trigger event is any new upload to a S3 bucket and the action is to run the simple Python function to resize and store the copy into another S3 bucket. Before deployment, it is necessary to run some tests using the provided events. To properly access other AWS services, we need to set the permission in the IAM role page.
9. QwikLab: Intro to Amazon API Gateway
* Setting up a simple Lambda function (Python) that interacts with Amazon API Gateway
* This lab is similar to the one above. Instead of interacting with S3, this lambda function handles the REST coming from API Gateway. API call is a good pratice for different components of a microservice application. 
10. AWS Tutorial: Build a Serverless Web Application
* To host a static website, simply upload everything to S3 bucket, enable public access (json for permission rules) and configure the bucket as "staic website hosting"
* Cognito can be used for user verification by sending out email with verification code
* Having issue when deploying the API Gateway. The lambda function cannot get proper request. This is tutorial is another example for outdated + having issue
11. AWS Tutorial: Build a Modern Web Application
* The load-balancer: Expose the single DNS to public to increase the scalability and provide fault recovery (also provide some protection for running services). All traffic heading to the two public subnet will go through the LB first. In this project, it sits behind the API gateway
* (JS related) When setting the endpoint as the ELB DNS, include the "http://" prefix, otherwise the content will not be loaded into the webpage.
* Codepipeline can be used to automatically build and deploy the service according to the changes
* The traffic will first go through API Gateway, which determine the type of request (auth / get). The gateway pass it to either Cognito (For user authentication) or load-balancer. 
* During the cleanup, it is important to clean up the dependencies before removing a component. The wrong order will cause a failure on deletion
![Screenshot 4](images/screen4.png)
![Screenshot 5](images/screen5.png)
