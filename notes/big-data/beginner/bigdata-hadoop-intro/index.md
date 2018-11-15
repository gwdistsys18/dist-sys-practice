---
title: Big Data - Hadoop Intro
date: "2018-11-07T22:12:03.284Z"
---

<div class="embed-responsive embed-responsive-16by9">
    <iframe class="embed-responsive-item" id="youtubeplayer" type="text/html" width="640" height="390"
        src="//www.youtube.com/embed/jKCj4BxGTi8" frameborder="0"/>
</div>

### What is Hadoop?

Hadoop is a framework that allows distributed processing of large data sets
across clusters of commodity computers using simple programming models.
It was inspired by a technical document published by Google. Doug Cutting
discovered Hadoop and named it after his son's yellow-colored toy elephant.

### Hadoop Characteristics

The 4 key characteristics of Hadoop are:

- Economical - Ordinary computers can be used for data processing.

- Reliable - Stores copies of data on different machines and is resistant
to hardware failure.

- Scalable - Can follow both horizontal and vertical scaling.

- Flexible - Can store as much of the data and decide to use it later.

### RDBMS vs. Hadoop

RDBMS stores data in a central location, and the data is sent to
the processor at runtime. This method works well for limited data,
but not for pushing high volumes of data to the processor.

Hadoop brought a radical approach. In Hadoop, the program goes to
the data not vice-versa. It initially distributes the data to multiple
systems and later runs the computation wherever the data is located.

### Big Data Processing

4 stages of Big Data require the functionalities of Hadoop components,

- Ingest
- Processing
- Analyze
- Access

### Hadoop Ecosystem Components

- Data Processing (works on _Hadoop Core_)
    
    - _Hadoop Distributed File System (HDFS)_

      A storage layer for Hadoop, suitable for the distributed storage and processing.
      Hadoop provides a command line interface wo interact with HDFS. HDFS provides
      streaming access to file system data, file permission and authentication.

    - _Spark_

      Spark is an open source cluster computing framework, it provides up to 100
      times faster performance for a few applications within memory primitives as
      compared to the 2 stage disk based MapReduce paradigm of Hadoop. Spark can
      run in the Hadoop cluster and processes data in HDFS, it also supports a wide
      variety of workload which includes machine learning, business intelligence,
      streaming and batch processing.

    - _Hadoop MapReduce_

      Hadoop MapReduce is the other framework that processes data, it is the original Hadoop
      processing engine which is primarily Java based. It is based on the map-and-reduce programming
      model. It has an extensive and mature fault tolerance framework built into the model, and
      it is still very commonly used, but it is losing ground to Spark.

- NoSQL
    - _HBase_

      HBase stores data in HDFS, it is a NoSQL database mainly used when you need random,
      real-time, read/write access to your Big Data. It provides support to high volume
      of data and high throughput. In HBase, a table can have thousands of columns.

- Data Ingestion
    - _Sqoop_

      Sqoop is designed to transfer data between Hadoop and relational database servers,
      it's used to import data from RDBMS (Oracle, MySQL) to HDFS and export data from HDFS
      to RDBMS.

    - _Flume_

      Flume is a distributed service that collects event data and transfers it to HDFS, it is
      ideally suited for event data from multiple systems.

- Data Analysis
    - _Pig_

      Pig is an open source high level data flow system, it's mainly used for analytics.
     Pig converts its script to map-and-reduce code thus saving the user from writing 
     complex MapReduce programs. Ad-hoc queries like filter and join which are difficult
     to perform in MapReduce can be done easily using Pig.

    - _Impala_

      Impala is an open source high performance SQL engine which runs on Hadoop cluster.
     It is idea for interactive analysis and has very low latency which can be measured
     in milliseconds. Impala supports a dialect of SQL (Impala SQL) so that data in HDFS
     is modeled as a database table.

    - _Hive_

      Hive is an abstraction layer on top of Hadoop, it's very similar to Impala
      however it's preferred for data processing and extract, transform, load (ETL)
      operations.

- Data Exploration
    - _Cloudera Search_

      Search is one of Cloudera's near-real-time access products. It enables non-technical
    users to search and explore data stored in or ingested into Hadoop and HBase. Users
    do not need SQL or programming skills to use Cloudera Search because it provides a simple
    full-text interface for searching.

    - _Hue_

      Hue is an acronym for Hadoop User Experience, it is an open source web interface for
      Hadoop. It supports operations such as upload and browse data, query a table in Hive
      or Impala, run Spark and Pig jobs and workflows. Hue provides SQL editor for Hive,
      Impala, MySQL, Oracle, Postgre, Spark SQL and Solar SQL.

- Workflow System
    - _Oozie_

      Oozie is a workflow or coordination system that you can use manage the Hadoop jobs.
