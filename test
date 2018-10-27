**BIG DATA AND MACHINE LEARNING**

[TOC]

#Hadoop Introduction (1hour)
###Overgrowing data problem and management:
- High chances of system failure
- Limit on bandwidth
- High programming complexity

Hadoop is a framework that allows for distributed processing of large data sets across clusters of commodity computers using simple programming models.

###Hadoop key characteristics:
- Economical
Ordinary computers can be used for data processing
- Reliable
Stores copies of the data on different machines and is resistant to hardware failure
- Scalable
Can follow both horizontal and vertical scaling
- Flexible
Can store as much of the data and decide to use it later

In my project, I may not need to use Hadoop for a single video processing. However, if I need to deal with large amount of concurrent image data, I need the Hadoop with such for important characteristics.

###Traditional Database System vs. Hadoop
- Tradition:
	1.	Data store in central location.
	2.	Sent data to processor at run time.

	Works well with limited data. However modern systems receive terabytes of data per day and it is difficult for the traditional computer or relational database management system such as RDBMS-Relational Database Management System.
- Hadoop:
	1.	Program goes to the data.
	2.	It initially distributes the data to multiple systems and later runs the computation whenever the data is located.
- Hadoop Ecosystem core components
	1.	Processing
	2.	Resource management
	3.	Storage

- Data processing:
Hadoop Distributed file system (HDFS):
		A storage layer of Hadoop
		Suitable for the distributed storage and processing
		Hadoop provides a command line interface to interact with HDFS
		Streaming access to file system data
		Provides file permissions and authentication
Hadoop map reduce:
		The original Hadoop processing which is primarily Java based
		Based on the map and reduce programming model
		Commonly used
		An extensive and mature fault tolerance framework
Spark:
	An open-source cluster computing framework
Provides 100 times faster performance as compared to MapReduce
	Support Machine learning, Business intelligence, Streaming, and 
	Batch processing
	Apache Spark
		Spark Core and Resilient Distributed Database (RDDs)
		Spark SQL
		Spark Streaming
		Machine Learning Library (Mlib)
		GraphX

Data Ingestion:
	Sqoop:
Sqoop is a tool designed to transfer data between Hadoop and relational database servers
It is used to import data from relational databases such as, Oracle and MySQL to HDFS and export data from HDFS to relational databases.
 Flume:
	A distributed service for ingesting streaming data
	Ideally suited for event data from multiple systems
Data Analysis:
	Pig:
		An open-source dataflow system
		Converts pig script to Map-Reduce code
		An alternate to writing Map-Reduce code
		Best for ad-hoc queries like join and filter
Impala:
	High performance SQL engine which runs on Hadoop cluster
	Ideal for interactive analysis
	Very low latency – measured in milliseconds
	Supports a dialect of SQL (Impala SQL)
Hive:
	Similar to Impala
	Best for data processing and ETL (extract, transformation, load)
	Executes queries using MapReduce
Data Exploration:
	Cloudera Search:
		One of Cloudera’s near-real-time access products
Users do not need SQL or programming skills to use Cloudera Search
Enables non-technical users to search and explore data stored in or ingested into Hadoop and HBase
A fully integrated data processing platform
 Hue:
	Hue is an acronym for Hadoop User Experience
Hue is an open source Web interface for analyzing data with Hadoop
It provides SQL editors for Hive, Impala, MySQL, Oracle, PostgreSQL, Spark SQL, and SolrSQL
Workflow System:
	Oozie:
		Oozie is a workflow or coordination system used to manage the 
		Hadoop jobs
		Start
			Loop actions
				Oozie Coordinator Engine
					Oozie Workflow Engine
		End
NoSQL:
	HBase:
		Store data in HDFS
		A NoSQL database or non-relational database
Mainly used when you need random, real time, read/write access to your Big data
Provides support to high volume of data and high throughput
The table can have thousands of columns
•	Big Data Processing
Ingest -> Processing -> Analyze -> Access
Ingest: Transferred to Hadoop from various sources such as relational database systems or local files
	Scoop (from DBMS to HDFS) 
	Flume (transfer event data)
	P.S. so I may use Flume rather than Scoop 
Processing: The data is stored and processed
	HDFS
	MapReduce
	Spark
	HBase
Analyze: Analyzing processing frameworks
	Pig (MapReduce)
	Hive (MapReduce)
	Impala
	Access:
		Hue
		Cloudera search

#Analyze Big Data with Hadoop

#Intro to S3

#Intro to Amazon Redshift

#Intro to Amazon Machine Learning

#Build a Machine Learning Model

#AWS SageMaker

#Build a Serverless Real-Time Data Processing APP

