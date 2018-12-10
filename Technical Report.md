<div align=center>
  
## Introduction to Hadoop Mapreduce, Spark and Comparison Between Them
</div>

### Introduction to Hadoop MapReduce
MapReduce started to get popular as a programming model in 2004 used by Google. Google used the MapReduce to collect and analyze website data for better search performance for users. Google ran it on its private file system which is called GFS, of course. At the same time, Apache also used the MapReduce for its own web search engine. 


Hadoop MapReduce is a very important part of distributed system. It is a software framework for processing large amounts of data which could be provided by the Hadoop Distributed File System. The data could be either stuctured or unstructured and can be in terabytes or petabytes. The MapReduce algorithms consists of two important tasks, one is Map and another is Reduce..
<div align=center>
<img src = "https://github.com/gowarrior/dist-sys-practice/blob/master/technical-report/image.png">
</div>

There are many benefits of using the MapReduce.It provides multiple programming language support including Java, C++, Python, thus developers can choose according to their needs. Apart from that, the scalability is definitely one of the most important part since it is designed for petabytes of data even stored in one cluster. Moreover, it is open source and the community can work together to make it more efficient and other improvements can be done. In addition, MapReduce programs are parallel in nature which could make it process data much more fast. Falure handling of course is quite important in the distributed system. MapReduce takes care of failures. It stores data with copies and JobTracker keeps track all of it. Plus, since the MapReduce program sends the compute to where the data resides aka Hadoop File System, it requires minimal data motion which is more reliable and less overhead.

<div align=center>
<img width="600" height="500" src = "https://github.com/gowarrior/dist-sys-practice/blob/master/technical-report/1.jpg" >
</div>
