---
title: Docker and Containers - Kubernetes in 5 minutes
date: "2018-11-03T22:12:03.284Z"
---

<div class="embed-responsive embed-responsive-16by9">
    <iframe class="embed-responsive-item" id="youtubeplayer" type="text/html" width="640" height="390"
        src="//www.youtube.com/embed/PH-2FfFD2PU" frameborder="0"/>
</div>

## Components of Kubernetes

### K8s Cluster Services

- Desired State Management

Feed the K8s cluster services a specific configuration (YAML file), and it will be up to the cluster
services to go out and run that configuration in the infrastructure to your desired state.

- YAML Deployment File
    - Pod configuration: the smallest unit of deployment in K8s with container images specified
    - Replicas: the amount of pods you want to run

### Workers

Container hosts that has a _kubelet_ process that communicates with the cluster services.

## Use Case

- What if a worker node is dead and the running configuration cannot match the deployment configuration file?

The situation would be eventually found out by K8s cluster services, and a new deployment will be scheduled.
