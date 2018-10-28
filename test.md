**BIG DATA AND MACHINE LEARNING**

# Table of contents
1. [Hadoop Introduction](#introduction)
2. [Analyze Big Data with Hadoop](#bigdata)
3. [Introduction to Amazon Simple Storage Service](#s3)
4. [Introduction to Amazon Redshift](#redshift)
5. [Intro to Amazon Machine Learning](#introml)
6. [Build a Machine Learning Model](#buildml)
7. [AWS SageMaker](#segmaker)
8. [Build a Serverless Real-Time Data Processing APP](#app)


<a name="Introduction"></a>
# Hadoop Introduction (1hour)
### Overgrowing data problem and management:
- High chances of system failure.
- Limit on bandwidth.
- High programming complexity.

Hadoop is a framework that allows for distributed processing of large data sets across clusters of commodity computers using simple programming models.

### Hadoop key characteristics:
- Economical
Ordinary computers can be used for data processing.
- Reliable
Stores copies of the data on different machines and is resistant to hardware. failure
- Scalable
Can follow both horizontal and vertical scaling.
- Flexible
Can store as much of the data and decide to use it later.

    In my project, I may not need to use Hadoop for a single video processing. However, if I need to deal with large amount of concurrent image data, I need the Hadoop with such for important characteristics.

### Traditional Database System vs. Hadoop
- Tradition Database System:
	1.	Data store in central location.
	2.	Sent data to processor at run time.

    Works well with limited data. However modern systems receive terabytes of data per day and it is difficult for the traditional computer or relational database management system such as RDBMS-Relational Database Management System.
- Hadoop:
	1.	Program goes to the data.
	2.	It initially distributes the data to multiple systems and later runs the computation whenever the data is located.

### Hadoop components
- Hadoop Ecosystem core components
	1.	Processing.
	2.	Resource management.
	3.	Storage.

- Data processing:
    * Hadoop Distributed file system (HDFS):
    	A storage layer of Hadoop.
    	Suitable for the distributed storage and processing.
    	Hadoop provides a command line interface to interact with HDFS Streaming access to file system data.
    	Provides file permissions and authentication
    * Hadoop map reduce:
    	The original Hadoop processing which is primarily Java based
    	Based on the map and reduce programming model Commonly used
    	An extensive and mature fault tolerance framework
    * Spark:
    An open-source cluster computing framework
    Provides 100 times faster performance as compared to MapReduce
    Support Machine learning, Business intelligence, Streaming, and 
    Batch processing
    Apache Spark
		* Spark Core and Resilient Distributed Database (RDDs)
		* Spark SQL
		* Spark Streaming
		* Machine Learning Library (Mlib)
		* GraphX
* Data Ingestion:
	* Sqoop:
Sqoop is a tool designed to transfer data between Hadoop and relational database servers
It is used to import data from relational databases such as, Oracle and MySQL to HDFS and export data from HDFS to relational databases.
    * Flume:
	A distributed service for ingesting streaming data.
	Ideally suited for event data from multiple systems.
* Data Analysis:
	* Pig:
		An open-source dataflow system.
		Converts pig script to Map-Reduce code.
		An alternate to writing Map-Reduce code.
		Best for ad-hoc queries like join and filter.
    * Impala:
    	High performance SQL engine which runs on Hadoop cluster.
    	Ideal for interactive analysis.
    	Very low latency – measured in milliseconds.
    	Supports a dialect of SQL (Impala SQL).
    * Hive:
    	Similar to Impala.
    	Best for data processing and ETL (extract, transformation, load).
    	Executes queries using MapReduce.
* Data Exploration:
	* Cloudera Search:
        One of Cloudera’s near-real-time access products.
        Users do not need SQL or programming skills to use Cloudera Search.
        Enables non-technical users to search and explore data stored in or ingested into Hadoop and HBase.
A fully integrated data processing platform.
    * Hue:
        Hue is an acronym for Hadoop User Experience
        Hue is an open source Web interface for analyzing data with Hadoop
        It provides SQL editors for Hive, Impala, MySQL, Oracle, PostgreSQL, Spark SQL, and SolrSQL.
* Workflow System:
	* Oozie:
		Oozie is a workflow or coordination system used to manage the 
		Hadoop jobs
####
    		Start
    			Loop actions
    				Oozie Coordinator Engine
    					Oozie Workflow Engine
    		End
* NoSQL:
	* HBase:
        Store data in HDFS.
        A NoSQL database or non-relational database Mainly used when you need random, real time, read/write access to your Big data
        Provides support to high volume of data and high throughput
        The table can have thousands of columns.

<a name="bigdata"></a>
# Analyze Big Data with Hadoop (30 mins) 

### Task 1: Create an Amazon S3 bucket
* What is S3? Simple Storage Service is designed to make web-scale computing easier for developers. In my opinion, simple means that we can have more time to deal with other hard tasks and boost the probability of finish a project entirely.
* In this task, I will create a bucket to store my log files and output data.
(P.S. log file is a file that records either events that occur in an operating system or other software runs, or messages between different users of a communication software.
* In my works, I will use some image label tools to process the uploading image frame and take parts of it with high confidence as training data and store them in S3 bucket. I may also store the client information and log files into the S3 bucket
### Task2: Launch an Amazon EMR (Elastic MapReduce) cluster
* Introduction:
EMR provides a managed Hadoop framework that makes it easy, fast and cost-effective to process vast amounts of data across dynamically scalable Amazon EC2 instances. EMR is a data processing tool with a broad set of big data use cases, including log analysis, web indexing, data transformations (ETL), machine learning, financial analysis, scientific simulation, and bioinformatics.
* In EMR, you can run custom Map reduce code, Spark (data processing) or frameworks such as Hive, Pig, Impala (data analysis) and HBase (NoSQL), Apache Hadoop, Ganglia, Apache Tez.
* User can build as many clusters as they need to test new ideas and terminate the clusters when they’re no longer needed. In my project, I may build several EMR with several different CNN models and test their real time image processing ability at the same time and take a comparison at the same time.
* For security demand, you can launch clusters in an VPC (Virtual Private Cloud), a logically isolated network that you define.
* Data to be Processed:
Use cluster to process log data from Amazon CloudFront which is a web service that speeds up distribution of static and dynamic web content such as .html, .css, .php, and image files.
* In this task, log data contains: Date, Time, Edge Location, Bytes, IP, Method, Host, URI (uniform resource identifier), Status, Referrer, User Agent
### Task3: Process your sample data by running a hive script
* Hive is a data analysis tool which is best for data processing and ETL.
* There are three steps for the hive operation:
    1. Create table. 
    2. Use regex to read log file. 
    3. Use HiveQL query to calculate requests by operating system.
Finally, it will give us a operating system counting table
### Task4&5: view result and terminate amazon EMR Cluster 

<a name="s3"></a>
# Introduction to Amazon Simple Storage Service (S3) (30mins) 
### Task 1-3: 
1. Create bucket.
2. Upload image file. 
3. Open the read access manually.
### Task 4: Create a Bucket Policy
    Use AWS Policy Generator to generate S3 Bucket.
    Select S3 Bucket Policy, write ‘*’ in Principal and paste ARN (Amazon Resource Name).
    The policy looks like:
    {
      "Id": "Policy***************",
      "Version": "2012-10-17",
      "Statement": [
            {
              "Sid": "Stmt*************",
              "Action": [
                "s3:GetObject"
              ],
              "Effect": "Allow",
              "Resource": "arn:aws:s3:::********(bucket name)/*",
              "Principal": "*"
            }
        ]
    }
    After generation of policy and being applied in the Bucket Policy, the bucket is public accessible now.
### Task 5: Explore Versioning:
    Add action “s3:GetObjectVersion” in “Action” will allow access old version of a file.

<a name="redshift"></a> 
# Introduction to Amazon Redshift 
* Amazon Redshift is a data warehouse to analyze data using standard SQL and existing Business Intelligence tools.
### Task 1: Launch an Amazon Redshift Cluster
* Launch cluster to open the Redshift Cluster Creation Wizard
(Optional: node type, control encryption, VPC)
<!-- Tables -->
* Cluster Properties: Contains information about the Cluster including: Name, Type, Node Type, number of Nodes, Zone location, Time and version of creation as well as other information
| Cluster Props   | value           |
|-----------------|-----------------|
|Cluster Name     |lab              |
|Cluster Type     |Single Noed      |
|Node type        |dc2.large        |
|Nodes            |1                |
|Zone             |us-east-1e       |
|Created Time     |*                |
|Maintenance Track|Current          |
|VPC ID           |vpc-*            |
|VPC sec groups   |defa.redshift-1.0|
|Cluster Par Group|lab              |
|Cluster Name     |lab              |
|Cluster Name     |lab              |
* Cluster Status: Allows you to see the current status of the cluster whether it is available or not and also whether it is currently in Maintenance Mode
* Cluster Database Properties: Contains information on the Endpoint, which is the DNS address of the cluster, and the port number on which the database accepts connections. These are required when you want to create SQL connections. It also lets you know whether the cluster has a public IP address that can be accessed from the public internet. The JDBC URL and ODBC URL contain the URLs to connect to the cluster via a java database connection or an Oracle database connection client.
| Cluster DB Props| value           |
|-----------------|-----------------|
|Port             |1234             |
|Publicly Access  |Yes              |
|Database Name    |labdb            |
|Master Usernaem  |master           |
|Encrypted        |No               |
|JDBC URL         |jdbc:redshift://~|
|ODBC URL         |Driver={};       |
|ODBC URL         |Server=~         |
|ODBC URL         |DB=labdb;UID     |
|ODBC URL         |PWD=pwd;Port=1234|
* Backup, Audit Logging and Maintenance: Contains information on how many days the automaated snapshots are retaubedm whether they are automatically copied to another region, and whether logging is enabled on the cluster.
* Capacity Details: Contains information about the data ware house node type, number of EC2 Compute Units per node, memory, disk storage, I/O performance as well as the processor architecture of the node type.
* SSH Ingestion Settings: Contains information about the Public Key of the cluster as well as the Public and Private IP addresses of the node.

### Task2-3: Launch Pgweb to Communicate with Redshift cluster and create a Table
* Any SQL client that supports JDBC or ODBC can be used with Redshift. In this task, Pgweb which provides a friendly SQL interface to Redshift will be used.
* Use redshift cluster endpoint as host and port and connect on Pgweb.
* Then use SQL command to create a table in Redshift which contains name, address and details about the type of music that user likes.

### Task 4-5: Load Sample Data from Amazon S3 and Data processing
* Amazon Redshift can import data from Amazon S3. Various file formats are supported, fiexd-length fields, comma-separated values(CSV) and custom delimiters. The data for this lab is pipe-separated(|)
* Use SQL Query to load and show Data in Redshift.
* Analyze data with Query

<a name="introml"></a> 
# Intro to Amazon Machine Learning

<a name="buildml"></a> 
# Build a Machine Learning Model

<a name="segmaker"></a> 
# AWS SageMaker

<a name="app"></a> 
# Build a Serverless Real-Time Data Processing APP



