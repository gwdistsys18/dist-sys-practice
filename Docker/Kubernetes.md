## Kubernetes

## What is Kubernetes

Kubernetes is a portable, extensible open-source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.

#### Pros of using Kubernetes

- **Its fast:** When it comes to continuously deploy new features without downtime; Kubernetes is a perfect choice. The goal of the Kubernetes is to update an application with a constant uptime. Its speed is measured through a number of features you can ship per hour while maintaining an available service.
- **Adheres to the principals of immutable infrastructure:** In a traditional way, if anything goes wrong with multiple updates, you don’t have any record of how many updates you deployed and at which point error occurred. In immutable infrastructure, if you wish to update any application, you need to build container image with a new tag and deploy it, killing the old container with old image version. In this way, you will have a record and get an insight of what you did and in-case if there is any error; you can easily rollback to the previous image.
- **Provides declarative configuration:** User can know in what state the system should be to avoid errors. Source control, unit tests etc. which are traditional tools can’t be used with imperative configurations but can be used with declarative configurations.
- **Deploy and update software at scale:** Scaling is easy due to its immutable, declarative nature of Kubernetes. Kubernetes offers several useful features for scaling purpose**:- Horizontal Infrastructure Scaling:** Operations are done at the individual server level to apply horizontal scaling. Latest servers can be added or detached effortlessly.
  **-** **Auto-scaling:** Based on the usage of CPU resources or other application-metrics, you can change the number of containers that are running
  **- Manual scaling:** You can manually scale the number of running containers through a command or the interface
  **-** **Replication controller:** The Replication controller makes sure that cluster has a specified number of equivalent pods in a running condition. If in-case, there are too many pods; replication controller can remove extra pods or vice-versa.
- **Handles the availability of the application:** Kubernetes checks the health of nodes and containers as well as provides self-healing and auto-replacement if in-case pod crashes due to an error. Moreover, it distributes the load across multiple pods to balance the resources quickly during accidental traffic.
- **Storage Volume:** In Kubernetes, data is shared across the containers, but if pods get killed volume is automatically removed. Moreover, data is stored remotely, if the pod is moved to another node, the data will remain until it is deleted by the user.

#### Cons of using Kubernetes

- **Initial process takes time:** When a new process is created, you have to wait for the app to commence before it is available to the users. If you are migrating to Kubernetes, modifications in the code base need to be done to make a start process more efficient so that users don’t have a bad experience.
- **Migrating to stateless requires many efforts:** If your application is clustered or stateless, extra pods will not get configured and will have to rework on the configurations within your applications.
- **The installation process is tedious:** It is difficult to set up Kubernetes on your cluster if you are not using any cloud provider like Azure, Google or Amazon.

## Kubernetes VS Docker Swarm

![](https://cdn-images-1.medium.com/max/1600/1*geiKsbMgZvjA6g6FdH5TQQ.png)