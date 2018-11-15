---
title: Docker and Containers - Kubernetes Orchestrates on EC2 Cluster
date: "2018-11-05T22:12:03.284Z"
---

> This lab shows how to orchestrate an EC2 cluster of 3 instances (1 master, 2 workers) using kubeadm,
how to deploy an app as Pod in the cluster and demonstrates
the key feature of Kubernetes system - automatic desired state management by accidentally shutting down one worker node.
The lab also demonstrates how to scale up/down the replicas of app using kubectl.

## Official Links

- [Kubernetes Basics Tutorial](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
- [Install kubeadm](https://kubernetes.io/docs/setup/independent/install-kubeadm/)
- [Create Cluster with kubeadm](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/)
- [Deploy Application with kubectl](https://kubernetes.io/docs/tasks/access-application-cluster/service-access-application-cluster/)
- [Install Docker on Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-from-a-package)

## Road Map

- Environment Set Up
- Create a Cluster
- Deploy an App
- Scale Your App
- Clean up

## Operations

### 0: Environment Set Up

#### 0.0: Create 3 EC2 Instances

- Use Ubuntu 1804, 1 instance will be used as master node, the other 2 as worker node.
- Configure each instance to accept all inbound network traffic (easy to set up but not recommended)
Kubernetes official guide suggests port set up as below,

[For Master nodes](https://kubernetes.io/docs/setup/independent/install-kubeadm/#master-node-s)

| Protocol | Direction | Port Range |         Purpose         |        Used By       |
|:--------:|:---------:|:----------:|:-----------------------:|:--------------------:|
|    TCP   |  Inbound  |    6443*   |  Kubernetes API server  |          All         |
|    TCP   |  Inbound  |  2379-2380 |  etcd server client API | kube-apiserver, etcd |
|    TCP   |  Inbound  |    10250   |       Kubelet API       |  Self, Control plane |
|    TCP   |  Inbound  |    10251   |      kube-scheduler     |         Self         |
|    TCP   |  Inbound  |    10252   | kube-controller-manager |         Self         |

[For Worker nodes](https://kubernetes.io/docs/setup/independent/install-kubeadm/#worker-node-s)

| Protocol | Direction |  Port Range |       Purpose       |       Used By       |
|:--------:|:---------:|:-----------:|:-------------------:|:-------------------:|
|    TCP   |  Inbound  |    10250    |     Kubelet API     | Self, Control plane |
|    TCP   |  Inbound  | 30000-32767 | NodePort Services** |         All         |

#### 0.1: Install Docker

- SSH to each of 3 instances
- Update your existing list of packages

```bash
sudo apt update
```
- Install a few prerequisite packages which let _apt_ use packages over HTTPS

```bash
sudo install a few prerequisite packages which let apt use packages over HTTPS
```

- Add the GPG key for the official Docker repository to your system

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

- Add the Docker repository to APT sources

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
```

- Update the package database with the Docker packages from the newly added repo

```bash
sudo apt update
```

- Make sure you are about to install from the Docker repo instead of the default Ubuntu repo

```bash
apt-cache policy docker-ce
```

- Finally, install Docker

```bash
sudo apt install docker-ce
```

#### 0.2: Install _Kubelet_, _Kubeadm_, and _Kubectl_

- For Ubuntu, Debian

```bash
apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
```

- For CentOS, RHEL or Fedora

```bash
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF

# Set SELinux in permissive mode (effectively disabling it)
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

systemctl enable kubelet && systemctl start kubelet
```

### 1: Create a Cluster

- Initializing your master with _Canal_ pod network addon

```bash
kubeadm init --pod-network-cidr=10.244.0.0/16 
```

- On master node

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

- Install _Canal_ pod network add-on

```
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/rbac.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/canal.yaml
```

- Join the worker nodes

```
kubeadm join --token <token> <master-ip>:<master-port> --discovery-token-ca-cert-hash sha256:<hash>
```

- On master node, check node status

```
kubectl get nodes
NAME               STATUS   ROLES    AGE   VERSION
ip-172-31-83-103   Ready    <none>   32m   v1.12.2
ip-172-31-88-100   Ready    master   35m   v1.12.2
ip-172-31-92-89    Ready    <none>   31m   v1.12.2
```

### 2: Deploy an App

#### 2.0: Create a service for an application running in two pods

- Run a Hello World application in your cluster

```bash
kubectl run hello-world --replicas=2 --labels="run=load-balancer-example" \
--image=gcr.io/google-samples/node-hello:1.0  --port=8080
```

The preceding command creates a Deployment object and an associated ReplicaSet object. 
The ReplicaSet has two Pods, each of which runs the Hello World application.

- Display information about the Deployment

```bash
kubectl get deployments hello-world
kubectl describe deployments hello-world

NAME          DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
hello-world   2         2         2            2           72s
```

- Display information about your ReplicaSet objects

```bash
kubectl get replicasets
kubectl describe replicasets

NAME                     DESIRED   CURRENT   READY   AGE
hello-world-78f6dc68cf   2         2         2       115s
```

- Create a Service object that exposes the deployment

```bash
kubectl expose deployment hello-world --type=NodePort --name=example-service
```

- Display information about the Service

```bash
kubectl describe services example-service
```

- List the pods that are running the Hello World application

```bash
kubectl get pods --selector="run=load-balancer-example" --output=wide

NAME                           READY   STATUS    RESTARTS   AGE     IP           NODE               NOMINATED NODE
hello-world-78f6dc68cf-9h4nl   1/1     Running   0          3m35s   10.244.1.2   ip-172-31-83-103   <none>
hello-world-78f6dc68cf-px29p   1/1     Running   0          3m35s   10.244.3.2   ip-172-31-92-89    <none>
```

- Use the node address and node port to access the Hello World application

```bash
curl http://172.31.83.103:31334
Hello Kubernetes!
```

#### 2.1: Test Desired State Management

Let's try shutting down a worker node without notifying the master node in order to
see the desired state management supplied by Kubernetes.

- Kubernetes tries to recover the desired state of deployment

```
kubectl get pods --selector="run=load-balancer-example" --output=wide

NAME                           READY   STATUS              RESTARTS   AGE     IP           NODE               NOMINATED NODE
hello-world-78f6dc68cf-gzn7h   1/1     Unknown             0          8m51s   10.244.3.4   ip-172-31-92-89    <none>
hello-world-78f6dc68cf-txbwk   1/1     Running             0          8m51s   10.244.1.4   ip-172-31-83-103   <none>
hello-world-78f6dc68cf-xzq86   0/1     ContainerCreating   0          14s     <none>       ip-172-31-83-103   <none>
```

- Kubernetes finished recovering the desired state of deployment

In a few minutes, the desired state of deployment (2 replicas) is recovered on the only 1 worker node that is still alive.

```
kubectl get pods --selector="run=load-balancer-example" --output=wide

NAME                           READY   STATUS    RESTARTS   AGE   IP           NODE               NOMINATED NODE
hello-world-78f6dc68cf-gzn7h   1/1     Unknown   0          19m   10.244.3.4   ip-172-31-92-89    <none>
hello-world-78f6dc68cf-txbwk   1/1     Running   0          19m   10.244.1.4   ip-172-31-83-103   <none>
hello-world-78f6dc68cf-xzq86   1/1     Running   0          11m   10.244.1.5   ip-172-31-83-103   <none>
```

### 3: Scale Your App

#### 3.0 Scale Up

- To list your deployments

```bash
kubectl get deployments

NAME          DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
hello-world   2         2         2            2           25m
```

- Scale up the deployment to 4 replicas

```bash
kubectl scale deployments/hello-world --replicas=4
```

- Check if the number of Pods changed

```bash
kubectl get pods -o wide

NAME                           READY   STATUS    RESTARTS   AGE   IP           NODE               NOMINATED NODE
hello-world-78f6dc68cf-7n5dm   1/1     Running   0          30s   10.244.1.3   ip-172-31-83-103   <none>
hello-world-78f6dc68cf-9h4nl   1/1     Running   0          27m   10.244.1.2   ip-172-31-83-103   <none>
hello-world-78f6dc68cf-k77s5   1/1     Running   0          30s   10.244.3.3   ip-172-31-92-89    <none>
hello-world-78f6dc68cf-px29p   1/1     Running   0          27m   10.244.3.2   ip-172-31-92-89    <none>
```

#### 3.1 Scale down

- Scale down the deployment back to 2 replicas

```bash
kubectl scale deployments/hello-world --replicas=2
```

- See changes of Pod

```bash
kubectl get pods -o wide

NAME                           READY   STATUS        RESTARTS   AGE     IP           NODE               NOMINATED NODE
hello-world-78f6dc68cf-7n5dm   1/1     Terminating   0          8m34s   10.244.1.3   ip-172-31-83-103   <none>
hello-world-78f6dc68cf-9h4nl   1/1     Running       0          35m     10.244.1.2   ip-172-31-83-103   <none>
hello-world-78f6dc68cf-k77s5   1/1     Terminating   0          8m34s   10.244.3.3   ip-172-31-92-89    <none>
hello-world-78f6dc68cf-px29p   1/1     Running       0          35m     10.244.3.2   ip-172-31-92-89    <none>
```

- See deployment events

```
kubectl describe deployments/hello-world

Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  37m    deployment-controller  Scaled up replica set hello-world-78f6dc68cf to 2
  Normal  ScalingReplicaSet  10m    deployment-controller  Scaled up replica set hello-world-78f6dc68cf to 4
  Normal  ScalingReplicaSet  2m44s  deployment-controller  Scaled down replica set hello-world-78f6dc68cf to 2
```

### 4: Clean up

- To delete the Service

```bash
kubectl delete services example-service
```

- To delete the Deployment, the ReplicaSet, and the Pods that are running the Hello World application

```bash
kubectl delete deployment hello-world
```