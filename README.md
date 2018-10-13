# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

Name: Qi Bao (G23090430)<br>
Github Name: [C91CBQ](https://github.com/C91CBQ)

## Check List
##### Docker and Containers
- [ ] Beginner Level
- [ ] Intermediate Level

##### Big Data and Machine Learning
- [ ] Beginner Level
- [ ] Intermediate Level

##### Cloud Web Applications
- [x] Beginner Level
- [ ] Intermediate Level

##### SDN and NFV
- [x] Beginner Level
- [ ] Intermediate Level


## [Cloud Web Apps](https://gwdistsys18.github.io/learn/web/)
### Beginner Level
#### [AWS Tutorial: Launch a VM](https://aws.amazon.com/getting-started/tutorials/launch-a-virtual-machine/)  
1. Amazon Elastic Compute Cloud (EC2) is the Amazon Web Service you use to create and run virtual machines in the cloud. AWS calls these virtual machines 'instances'.
1. Launch a VM:
    * Click **EC2** console.
    * Select an instance and launch.
    * Create a key pair and download it.
    * Move key pair into .ssh subdirectory and set restrict permissions.
    ```
    mv ~/Downloads/MyKeyPair.pem ~/.ssh/MyKeyPair.pem
    chmod 400 ~/.ssh/mykeypair.pem
    ```
    * Use ssh to connect the instance.
    ```
    ssh -i ~/.ssh/MyKeyPair.pem ec2-user@{IP_Address}
    ```
    * Terminate the instance in console.
    * Example:
    ![Example Screenshot](/img/ec2-example.png)

*Cost 15 minutes, finished on Oct 13th, 2018.*
____
#### [QwikLab: Intro to S3](https://awseducate.qwiklabs.com/focuses/30?parent=catalog)
1. Amazon Simple Storage Service (Amazon S3) is storage for the Internet. Amazon S3 is used to store and retrieve any amount of data at any time, from anywhere on the web.
1. Create a S3 Bucket and Upload Image
    * Click **Create Bucket** and Input a bucket name.
    * Check config options, select versioning.
    * Exam the permissions.
    * Click Create Bucket.
    * In S3 console, click upload image.
1. Set Object Permissions:
    * Public Permission:
        * In S3 console, click **Permission Tab**.
        * Under the **Public Access** section, select **Everyone**.
        * Select **Read Object** and Save.
    * Bucket Policy:
        * Bucket Policy is a set of permissions associated with an Amazon S3 bucket. It can be used to control access to a whole bucket or to specific directories within a bucket.
        * Create a **Bucket Policy** with example as following:
        ```
        {
            "Version": "2012-10-17",
            "Id": "Policy1539460848531",
            "Statement": [
                {   
                    "Sid": "Stmt1539460847088",
                    "Effect": "Allow",
                    "Principal": "*",
                    "Action": "s3:GetObject",
                    "Resource": "arn:aws:s3:::mybucket10132018/*"
                }
            ]
        }
        ```
1. Versioning:
    *  Versioning is a means of keeping multiple variants of an object in the same bucket. You can use versioning to preserve, retrieve, and restore every version of every object stored in your Amazon S3 bucket. With versioning you can easily recover from both unintended user actions and application failures.
    * Click **Latest Version** tab to change version.
    * Also change **Bucket Policy**'s Action for old version permissions.
    ```
    {
        "Version": "2012-10-17",
        "Id": "Policy1539460848531",
        "Statement": [
            {   
                "Sid": "Stmt1539460847088",
                "Effect": "Allow",
                "Principal": "*",
                "Action": [
                    "s3:GetObject",
                    "s3:GetObjectVersion"
                ]
                "Resource": "arn:aws:s3:::mybucket10132018/*"
            }
        ]
    }
    ```

*Cost 30 minutes, finished on Oct 13th, 2018.*
____
## [SDN and NFV](https://gwdistsys18.github.io/learn/sdnfv/)
### Beginner Level
#### [Video: Introduction to SDN](https://www.youtube.com/watch?v=DiChnu_PAzA)

1. Definition:
    * Software-defined networking (SDN) technology is an approach to cloud computing that facilitates network management and enables programmatically efficient network configuration in order to improve network performance and monitoring.

1. Main Goal of SDN
    * Make network to be open and programmable.

1. 3 layer model of Operating System (analogy for an SDN model)
    * Application Layer
    * Operating System with Core Service as middleware.
    * Hardware Layer with CPU, storage, memory and network as infrastructure.

1. 3 layer model of SDN
    * Network Application Layer.
    * Network Operating System with Core Service or called as SDN Controller.
    * Network forwarding devices as infrastructure.

1. Layer details
    * Network Applications
    * Application Interfaces:
        * Java API
        * Northbound (e.g. RESTConf)
    * SDN Controller/Control Panel
        * Topology Service
        * Inventory Service
        * Statistic Service
        * Host Tracking
    * SouthBound Interfaces:
        * OpenFlow
        * OVSDB
        * NETCONF
        * SNMP
    * Forwarding Devices/Data Plane

1. Availability and Scalability
    * Logically Centralized rather than Physically Centralized.
    * Cluster Networking Operating System.
    * Separate Networking Operating System into different regions.
    * SDN Controller is designed in hierarchy.

1. SDN vs traditional networks
    * Traditional networks nodes have a data plane and a control plane both contained within a single physic system.
    * Traditional networks nodes are proprietary locked boxes. The control plane is chained to the data plane and both are coupled together in a single networking nodes.
    * In traditional networks, each node is configured individually. These control planes must communicate using distributed protocols. This paradigm is typically complex.

*Cost 25 minutes, finished on Oct 13th, 2018.*
____
