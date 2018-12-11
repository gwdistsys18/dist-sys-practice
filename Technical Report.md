<div align=center>
  
## Introduction to Hadoop Mapreduce, Spark and Comparison Between Them
</div>

### Introduction to Hadoop MapReduce
MapReduce started to get popular as a programming model in 2004 used by Google. Google used the MapReduce to collect and analyze website data for better search performance for users. Google ran it on its private file system which is called GFS, of course. At the same time, Apache also used the MapReduce for its own web search engine. 


Hadoop MapReduce is a very important part of distributed system. It is a software framework for processing large amounts of data which could be provided by the Hadoop Distributed File System. The data could be either stuctured or unstructured and can be in terabytes or petabytes. The MapReduce algorithms consists of two important tasks, one is Map and another is Reduce..
<div align=center>
<img src = "https://github.com/gowarrior/dist-sys-practice/blob/master/technical-report/image.png" width="700" height="300" >
</div>

There are many benefits of using the MapReduce.It provides multiple programming language support including Java, C++, Python, thus developers can choose according to their needs. Apart from that, the scalability is definitely one of the most important part since it is designed for petabytes of data even stored in one cluster. Moreover, it is open source and the community can work together to make it more efficient and other improvements can be done. In addition, MapReduce programs are parallel in nature which could make it process data much more fast. Falure handling of course is quite important in the distributed system. MapReduce takes care of failures. It stores data with copies and JobTracker keeps track all of it. Plus, since the MapReduce program sends the compute to where the data resides aka Hadoop File System, it requires minimal data motion which is more reliable and less overhead.

<div align=center>
<img src = "https://github.com/gowarrior/dist-sys-practice/blob/master/technical-report/1.jpg" >
</div>

### Introduction to Apache Spark
Spark was originally developed at UC Berkeley AMPLab in 2009, later than MapReduce. In 2013, Spark was donated to the Apache Software Foundation thus it is called Apache Spark now. It is an open source, unified analytics engine and is mostly widely used by corporations around the world.

It has a variety of good features. It is suitable for dealing with a wide range of circumstances. It includes libraries for SQL called Spark SQL, machine learning called MLib, graph computation called GraphX and stream processing called Spark Streaming. Multiple programming languages are also supported by Spark including Java, Python, Scala,  R and so on. In addition, one of the unique aspects of Apache Spark is its unique "in-memory" technology that allows it to be an extremely good data processing system. In this technology, Spark loads all of the data to the internal memory of the system and then unloads it on the disk later. This way, a user can save a part of the processed data on the internal memory and leave the remaining on the disk. 
<div align=center>
<img src = "https://github.com/gowarrior/dist-sys-practice/blob/master/technical-report/3.png" >
</div>

### Hadoop MapReduce vs Apache Spark
<div align=center>
<img src = "https://github.com/gowarrior/dist-sys-practice/blob/master/technical-report/4.png" >
</div>

* Hadoop MapReduce is better for linear processing of a large amount of datasets and it is economical if you do not need the outcome immediately; Apache Spark is known for fast huge data processing, iterative processing, near real-time processing, graph processing, machine learning, and joining datasets. It looks like Apache Spark is a more modern solution and have more cutting-edge function that corporation needs.

* When it comes to Fault Tolerance, we find that they both provide good solution for fault handling but using different approches. It shows that MapReduce has slight better fault tolerance.

* Compatibility: Spark’s compatibility to data types and data sources is the same as Hadoop MapReduce.Apache Spark can run as standalone or on top of Hadoop YARN or Mesos on-premise or on the cloud. It supports data sources that implement Hadoop InputFormat, so it can integrate with all the data sources and file formats that are supported by Hadoop. According to the Spark website, it also works with BI tools via JDBC and ODBC. Hive and Pig integration are on the way.

* Security: Spark security is still kind of not very reliable while Hadoop MapReduce has more security features and projects.
