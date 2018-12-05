---
title: Docker and Containers - More Insights on Kubernetes
date: "2018-11-04T22:12:03.284Z"
---

> Discover more insights on Kubernetes

## Learning Outcomes

- Kubernetes as a platform
- Desired state management eliminates the need for orchestration
- Kubernetes Components
- Kubernetes Objects

### Kubernetes as a platform

Kubernetes is more than an orchestration system (Docker Swarm), it can be thought of as:

- a container platform
- a microservices platform
- a portable cloud platform and a lot more

### Desired state management eliminates the need for orchestration

 The technical definition of orchestration is execution of a defined workflow: first do A, then B, then C. 
 In contrast, Kubernetes is comprised of a set of independent, composable control processes that continuously drive the current state towards the provided desired state. 
 It shouldn’t matter how you get from A to C. 
 Centralized control is also not required. 

### Kubernetes Components

- Master Components (cluster’s control plane)
    - kube-apiserver
    - etcd
    - kube-scheduler
    - kube-controller-manager
    - cloud-controller-manager

Master components make global decisions about the cluster (for example, scheduling), 
detect and respond to cluster events. Usually master nodes do not host user containers.

- Node Components
    - kubelet
    - kube-proxy
    - Container Runtime

Node components run on every node, maintaining running pods and providing the Kubernetes runtime environment.

- Addons
    - Cluster DNS
    - Web UI (Dashboard)
    - Container Resource Monitoring
    - Cluster-level Logging

Addons are pods and services that implement cluster features. 
The pods may be managed by Deployments, ReplicationControllers, and so on.

### Kubernetes Objects

Kubernetes Objects are persistent entities that represent the state of your cluster.
By creating an object, 
you’re effectively telling the Kubernetes system what you want your cluster’s workload to look like, 
in another word, your cluster’s desired state.

- Object Spec and Status

Object _spec_ describes your desired state for the object, which is 
the characteristics that you want the object to have.
Object _status_ describes the actual state of the object, which is supplied and managed by the Kubernetes Control Plane
to match the desired state you supplied in _spec_.

- Describing a Kubernetes Object

Most often, Kubernetes object is described in a YAML file, and created via _kubectl_
which converts the YAML file to JSON when making API requests to Kubernetes system.

```bash
kubectl create -f https://k8s.io/examples/application/deployment.yaml --record
```

## Official Links

[Kubernetes](https://kubernetes.io/)