---
title: Cloud Web Apps - Compare S3 vs EC2
date: "2018-10-12T22:12:03.284Z"
---

> Compare the performance, functionality, and price when serving web content from S3 versus an EC2

## Functionality

- EC2

An EC2 instance is a highly customizable VM hosted somewhere in AWS data center. 
As a VM, EC2 is meant to provide processing power, however, EC2 also ships with a small amount of local storage,
which is meant to assist in processing activities, but not for long term, large data storage purpose.

Removing an EC2 instance will lead to loss of any data in local storage.  

- S3

S3 is a highly durable, highly available, and inexpensive object storage service that can serve stored objects directly via HTTP. 
S3 is perfect for keeping file objects, as it provides features such as object version tracking, access policy set up,
multiple redundancies of object, which is why Netflix stores thousands of petabytes of video files there.


## Performance

- EC2 (EBS)

Amazon EBS is short for Elastic Block Store, which provides persistent block storage volumes 
for use with Amazon EC2 instances in the AWS Cloud.
Amazon EBS is designed for application workloads that benefit from fine tuning for performance, cost and capacity.  

EBS uses both SSD- and HDD-backed storage types, with a baseline performance of 3 IOPS per GB for General Purpose volume.
Provisioned IOPS could be used for increased performance.  

- S3

S3 supports multipart upload. It is recommended for capability of objects larger than 100MB.
The largest size of a single object uploaded using PUT API can be of 5GB.

S3 is a highly scalable managed service supports 3500 PUT/LIST/DELETE requests per second, and 5500 GET requests per second.


## Price

- EC2 (EBS)

    - General Purpose SSD (gp2) $0.10 per GB-month
    - Provisioned IOPS SSD (io1) $0.125 per GB-month ($0.065 per provisioned IOPS-month)
    - Throughput Optimized HDD (st1) $0.045 per GB-month
    - Cold HDD (sc1) volumes $0.025 per GB-month
    
Maximum storage size of 16 TB, with no limitation on file size in EBS disk.

- S3

    - First 50 TB / Month $0.023 per GB
    - Next 450 TB / Month $0.022 per GB
    - Over 500 TB / Month $0.021 per GB
    
No limit on number of objects, with individual S3 objects ranging from a minimum of 0 bytes to a maximum of 5TB.