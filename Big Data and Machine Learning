Beginner level:
Video:
    Hadoop Introduction
    hadoop: framework for distributed process of large data.
    Four phase in data process: ingest, process,analyze, access.
    1. data are transfer to Hadoop from various data sources such as local files, relational dtabases, systems.
    2. data is stored and processed
    3. data is processing with processing models.
    4.  data is accessible to users.( Web interface or something else)
    Four key advantange: reliable, economical, scalable, flexible
    12 key components in Hadoop ecosystem:
        Data ingestion: sqoop ( transfer data between hadoop and relational databses servers.
        , flume (event data, streaming data).  
        Dara process: Hadoop mapReduce, Spark, Yarn, HDFS( for storing data. HBase, NoSQL..
        data analysis: pig, impala, hive.
        data access: cloudera search, hue.
        other: Oozie( workflow or coordination system. manage the Hadoop jobs.)
        Hbase( random, real-time, read/write access to your data).     
    Distributed system four key problems: bandwith limit, application complexity, high chance failure.

QwikLab:
   First, create a S3 bucket which is used to store the sample data and output.
   second, create a cluster which is used to process data.
   Thirs, assign jobs to the cluster.
        create hive table.
        read files ( ingest), write the results to the Hive table ( store)
        submit a hiveQL to retrive something from the hive table. ( process).
        write the query results to S3 bucket.( access).
        download the results to my computer.
   Learned how to launch a cluster, create a S3 bucket. And get familiar with the process in which the 
   Amazon EMR use the hadoop to process big data.


Intermediate Level:
1. data storage
    QwikLab: Intro to S3 
    I have do this lab in thel beginner level of "Cloud Web Application".
    QwikLab: Intro to Amazon Redshift
    This lab step me through
        1. the launching of a Amazon Redshift
        2. Connecting the Pgweb to the Redshift cluster such that we can communicate with the Redshift cluster.
        3. Create a table in the Redshift cluster.
        4. load the data from an Amazon S3 bucket to the cluster.( by SQL query)
        5. Make some queries from the Pgweb to the Redshift.

2. Big Data Analysis
Video: Short AWS Machine Learning Overview
    AWS can help to develop Machine learning application in three layers: Framework, platform, application service.
AWS Tutorial: Analyze Big Data with Hadoop
    This tutorial is similar to the "QwikLab: Analyze Big Data with Hadoop" in the beginner level, but more specifically on the configuration
    of cluster.

3. Machine Learning Models:
   QwikLab: Intro to Amazon Machine Learning - 45 min
       This lab is not avaible. The website told me that there is no seat because of too much requests.
   Docs: AWS Machine Learning
       This docs introduce the detailed procedure by which developing a machine learning application with AWS. Here are the procedures:
           Format the train and test data to the required data format. 
           Store the formatted data in an S3 bucket.
           Create a ML Datasource in AWS and design a schema for it.
           Train a ML model and evaluate the model.
           Make predictions on test data.
   AWS Tutorial: Build a Machine Learning Model   
       This tutorial step me through the procedures in which building a machine learning model. Just like what the Docs specifies.
   Video Tutorial: Overview of AWS SageMaker
       Maybe the "AWS Tutorial: AWS Sagemaker" should be put before this video, because there are many jardons that you cann't understand
       well, if you don't practice it first, in this video.
       This vedeo use four examples to illustrate what we can do with AWS Sagemaker:
           1. We just need to offer the trainning and testing data, and then use AWS sagemaker to complete all the other jobs.
           2. We can also use the environment that AWS sagemaker provide to train the model.
           3. We can also write the algorithm by ourself and train the model.
           4. We can create our own machine learning algorithm. And just use AWS Sagemaker to deploy that model.
   AWS Tutorial: AWS SageMaker
       This tutorial step me through the process in which deploying a machine learning application with AWS SageMaker.
       1. create an administrator users
       2. create a S3 bucket for storing the Training and test dataset.
       3. create a notebook instance and Jupyter notebook. In this notebook, we can user python to
           dowload the dataset, transform the dataset, store the dataset in a S3 bucket. 
           Choose an algorithm and train the model. 
           deploy and validate the model.
           
   Bring it all together:
   Build a Serverless Real-Time Data Processing App
       This tutarial is awesome! I learned a lot from this tutorial. Basically I know how to build a serverless data processing 
       application and I also understand some concepts in AWS.
       The architecture is showed in Figure_1.
       First, build a data stream with Amazon Kinesis. Use command line clients to produce data to and catch data from
       this data stream.
       Second, build a Kinesis application to process data and Kinesis data stream to output the processed data.
       Third, build a Lambda function to process the data stream and write the result to DynamoDB table.
       Fourth, create a Amazon Kinesis Data firehose delivery stream to deliver the data from kinesis stream
       to S3 bucket. Then we can use the Amazon Athena to query the data files in that S3 bucket.
       
       
       
       
       
       
   
           
           
       

        
