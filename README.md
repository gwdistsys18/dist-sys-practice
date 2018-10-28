# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1: Cloud Web Apps
* AWS Tutorial: Launch a VM (took ~15 min)
  * Used the EC2 Console to create an EC2 instance of type t2.micro
  * Used `ssh -i '<path-to-ssh-pem-file>' ec2-user@<ip-address>` to connect
  * After terminating instance, connection timed out when attempting to connect
* QwikLab: Intro to S3 (took ~20 min)
  * S3 stands for Simple Storage Service, which allows storage of objects in buckets which include backups and versioning
  * When uploading objects, there are different storage class options based on how long-lived and how freuqently accessed the data will be
  * Public read access can be granted to specific objects
  * ARN is Amazon Resource Name and in this case refers to a bucket
  * The policy generator can be used to create policies to put in the policy editor
  * New versions of a file can be uploaded and will display by default; additional permissions must be given to view old versions
  

## Area 2: Big Data and Machine Learning
* Video: Hadoop Intro (took ~15 minutes)
  * Distributed systems are used to deal with the data explosion
  * Hadoop is a framework inspired by a Google technical document to make distributed data processing easier
  * Hadoop is economical, reliable, scalable, and flexible
  * Traditional systems have data going to a program, while with Hadoop the program goes to the data
  * Hadoop has 12 components:
    * HDFS (Hadoop Distirbuted File System) is a storage layer for Hadoop
    * HBase is a NoSQL database that stores data in HDFS
    * Sqoop transfers data between Hadoop and relational database servers
    * Flume ingests streaming data
    * Spark is a cluster computing framework
    * Hadoop MapReduce is the original processing engine but is losing ground to Spark
    * Pig is a dataflow system primarily used for analytics that converts pig script to Map-Reduce code
    * Impala is a high-performance SQL engine with low latency
    * Hive is similar to Impala but is good for data processing
    * Cloudera Search enables non-technical users to search and explore data
    * Oozie is a workflow or coodination system used to manage Hadoop jobs
    * Hue (Hadoop User Experience) is a web interface for Hadoop
  * These components help with the four stages of big data processing: ingest, processing, analyze, and access
