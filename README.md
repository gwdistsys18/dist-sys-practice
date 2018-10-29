# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1 Big Data and Machine Learning
### Video: Hadoop Intro (45min)
Challenges of Distributed Systems
-	High chances of system failure
-	Limit on bandwidth
-	High programming complexity
Solution: Hadoop!

Four key characteristics of Hadoop:
Economical: Ordinary computers can be used for data processing
Reliable: Stores copies of the data on different machines and is resistant to hardware failure
Scalable: can follow both horizontal and vertical scaling
Flexible: can store as much of the data and decide to use it later
Hadoop Distributed File System
-	A storage layer for Hadoop
-	Suitable for the distributed storage and processing
-	Hadoop provides a command line interface to interact with HDFS
-	Streaming access to file system data
-	Provides file permissions and authentication

HBase stores data in HDFS. It is a NoSQL database or non-relational database. It is mainly used when you need random, real-time, read/write access to your Big Data. It provides support to high volume of data and high throughput. The table can have thousands of columns.

Sqoop is a tool designed to transfer data between Hadoop and relational database servers. It is used to import data from relational databases such as, Oracle and MySQL to HDFS and export data from HDFS to relational databases.

Flume is a distributed service for ingesting streaming data. It is ideally suited for event data from multiple systems.

Spark is an open-source cluster computing framework. It provides 100 times faster performance as compared to MapReduce. It supports Machine learning, Business intelligence, Streaming and Batch processing. 

Hadoop MapReduce is the original Hadoop processing engine which is primarily Java based. It is based on the map and reduce programming model. 

Pig is an open-source dataflow system. It converts pig script to Map-Reduce code. It is an alternate to writing Map-Reduce code. Best for ad-hoc queries like join and filter. 

Impala is a high performance SQL engine which runs on Hadoop cluster. It is ideal for interactive analysis. It has very low latency and it supports a dialect of SQL.

Hive is best for data processing and ETL. It executes queries using MapReduce. 

Cloudera Search is a near-real-time access product. It enables non-technical users to search and explore data stored in or ingested into Hadoop and HBase. Users do not need SQL or programming skills to use Cloudera Search. It is a fully integrated data processing platform.

Oozie is a workflow or coordination system used to manage the Hadoop jobs.

Hue is an acronym for Hadoop User Experience. It is an open source Web interface for analyzing data with Hadoop. It provides SQL editors for Hive, Impala, MySQL, Oracle, PostgreSQL, Spark SQL, and Solr SQL. 

Four stages of big data processing:
Ingest
Processing
Analyze
Access

### QwikLab: Analyze Big Data with Hadoop (80min)
- Create a bucket with S3 service to store log files and output data
- Launch a Hadoop cluster to help with processing data
- Add Hive Script as a step in the cluster to process sample data
- Run the Hive Script and check result in S3 bucket when it is completed
- download the 000000_0 file to local computer to check the output

### QwikLab: Intro to S3 (25min)
- Create a bucket and configure to allow versioning and set permissions
- upload an image to the bucket
- change the permission setting and make the image public
- create a bucket policy to set permission setting
- get access to different versions of images with the same name

### QwikLab: Intro to Amazon Redshift (30min)
- Amazon Redshift is a fast, fully managed data warehouse. 
- launch a Redshift cluster and configure
- use Pgweb as the SQL interface to Redshift
- create a table by executing SQL commands in Redshift
- import data from S3 and run the Query

### Video: Short AWS Machine Learning Overview (5min)
Three layers of machine learning:
- Framework and interfaces
- Machine learning platforms
- Application services

### AWS Tutorial: Analyze Big Data with Hadoop (30min)

### QwikLab: Intro to Amazon Machine Learning (40min)
### Docs: AWS Machine Learning
### AWS Tutorial: Build a Machine Learning Model (30min)
### Video Tutorial: Overview of AWS SageMaker (40min)
This tutorial introduced SageMaker with a few examples.

Sagemaker console: 
Notebook instance: explore AWS data in your notebooks, and use algorithms to create models via training jobs
Jobs: track training jobs at your desk or remotely. Leverage high-performance AWS algorithms
Models: create models for hosting from job outputs, or import externally trained models into Amazon SageMaker.
Endpoint: deploy endpoints for developers to use in production. A/B test model variants via an endpoint

The four parts and be linked to be used together but they can also be used separately.

### AWS Tutorial: AWS SageMaker (40min)

## Area 2 Cloud Web Apps
### AWS tutorial: Launch a VM
### QwikLab: Intro to S3 (25min)
- Create a bucket and configure to allow versioning and set permissions
- upload an image to the bucket
- change the permission setting and make the image public
- create a bucket policy to set permission setting
- get access to different versions of images with the same name

