# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Big Data and Machine Learning
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
- Ingest
- Processing
- Analyze
- Access

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

### AWS Tutorial: Analyze Big Data with Hadoop (80min)
The getting started part of this tutorial is the same as the QwikLab analyze big data with hadoop.
The function of the Hive Script:
```
- Creates a Hive table schema named cloudfront_logs. For more information about Hive tables, see the Hive Tutorial on the Hive wiki
- Uses the built-in regular expression serializer/deserializer (RegEx SerDe) to parse the input data and apply the table schema. For more information, see SerDe on the Hive wiki
- Runs a HiveQL query against the cloudfront_logs table and writes the query results to the Amazon S3 output location that you specify
```
### QwikLab: Intro to Amazon Machine Learning (40min)
- create a bucket and upload training data to the bucket
- create a datasource with Amazon machine learning that refers to the training data in the S3 bucket
- create a model from the datasource 
- evaluate the generated model
- generate predictions from the machine learning model

### Docs: AWS Machine Learning (60min)
Datasources: A datasource is an object that contains metadata about your input data. It does not store a copy of your input data. Instead, it stores a reference to the Amazon S3 location where your input data resides. It is used to train and evaluate machine learning model and generate predictions.
Machine Learning Models: A Machine Learning model is a mathematical model that generates predictions by finding patterns in your data.
Evaluations: An evaluation measures the quality of your ML model and determines if it is performing well.
Batch Predictions: Batch predictions are for a set of observations that can run all at once. 
Real-time Predictions: Real-time predictions are for applications with a low latency requirement, such as interactive web, mobile, or desktop applications. 

### AWS Tutorial: Build a Machine Learning Model (60min)
- Download the data file banking.csv and banking-batch.csv. In the csv file we can see attribute y as a binary value. Create an S3 bucket and upload the files.
- Create a training datasource and establish the schema. Select y as the target attribute.
- Create an machine learning model. 
- Review the performance of the model and set a score threshold. The default was 0.5 and adjust it so that 3% of the records are predicted as "1". Then save it as 0.77. 
- Create predictions with the model with real-time predictions and download the prediction file to local computer.

### Video Tutorial: Overview of AWS SageMaker (40min)
This tutorial introduced SageMaker with a few examples.

Sagemaker console: 
Notebook instance: explore AWS data in your notebooks, and use algorithms to create models via training jobs
Jobs: track training jobs at your desk or remotely. Leverage high-performance AWS algorithms
Models: create models for hosting from job outputs, or import externally trained models into Amazon SageMaker.
Endpoint: deploy endpoints for developers to use in production. A/B test model variants via an endpoint

The four parts and be linked to be used together but they can also be used separately.

### AWS Tutorial: AWS SageMaker (80min)
- Create an IAM Administrator User. 
- Create a SageMaker Notebook Instance and open the Jupyter dashboard.
- Create a Jupyter notebook to run the code. Download the dataset and display one of the image in the dataset. 
- Transform the dataset. There are two ways to do it. I chose to use the high-level Python library provided by Amazon SageMaker.
- Train the model with an algorithm. 
- Validate the model with sending the requests. Get the references of the images. The model would divide the images I requested into clusters and each cluster contains similar images.

### Build a Serverless Real-Time Data Processing App (150min)
#### Module 1 Build a data stream
- Use the Amazon Kinesis Data Streams console to create a new stream named wildrydes with 1 shard
- Produce messages into the stream with the command-line producer
```
./producer
```
- Print the messages being sent by the producer with consumer.
```
./consumer
```
- Create an Amazon Cognito identity pool to grant unauthenticated users access to read from the Kinesis stream.
- Add a new policy to the unauthenticated role to allow the dashboard to read from the stream to plot the unicorns on the map.
- Open Unicorn Dashboard and there is a unicore on the real-time map.

#### Module 2 Aggregate data
- Use the Amazon Kinesis Data Streams console to create a new stream named wildrydes-summary with 1 shard
- Build an Amazon Kinesis Data Analytics application which reads from the wildrydes stream built in the previous module and emits a JSON object with Name, StatusTime, Distance, MinMagicPoints, MaxMagicPoints, MinHealthPoints, MaxHealthPoints each minute.
- Start the producer and create the schema. Run following SQL code and see rows arrive every minute:
```
CREATE OR REPLACE STREAM "DESTINATION_SQL_STREAM" (
  "Name"                VARCHAR(16),
  "StatusTime"          TIMESTAMP,
  "Distance"            SMALLINT,
  "MinMagicPoints"      SMALLINT,
  "MaxMagicPoints"      SMALLINT,
  "MinHealthPoints"     SMALLINT,
  "MaxHealthPoints"     SMALLINT
);

CREATE OR REPLACE PUMP "STREAM_PUMP" AS
  INSERT INTO "DESTINATION_SQL_STREAM"
    SELECT STREAM "Name", "ROWTIME", SUM("Distance"), MIN("MagicPoints"),
                  MAX("MagicPoints"), MIN("HealthPoints"), MAX("HealthPoints")
    FROM "SOURCE_SQL_STREAM_001"
    GROUP BY FLOOR("SOURCE_SQL_STREAM_001"."ROWTIME" TO MINUTE), "Name";
``` 

#### Module 3 Process streaming data
- Use the Amazon DynamoDB console to create a new DynamoDB table. The name of the table is UnicornSensorData. Partition key: Name
Type: String
Sort key: StatusTime
type: String
- Create an IAM role for the Lambda function.
Name: WildRydesStreamProcessoerRole 
- Create a Lambda function.
name: WildRydesStreamProcessor
Environment variable: key TABLE_NAME value UnicornSensorData
use JavaScript code:
```
'use strict';

const AWS = require('aws-sdk');
const dynamoDB = new AWS.DynamoDB.DocumentClient();
const tableName = process.env.TABLE_NAME;

exports.handler = function(event, context, callback) {
  const requestItems = buildRequestItems(event.Records);
  const requests = buildRequests(requestItems);

  Promise.all(requests)
    .then(() => callback(null, `Delivered ${event.Records.length} records`))
    .catch(callback);
};

function buildRequestItems(records) {
  return records.map((record) => {
    const json = Buffer.from(record.kinesis.data, 'base64').toString('ascii');
    const item = JSON.parse(json);

    return {
      PutRequest: {
        Item: item,
      },
    };
  });
}

function buildRequests(requestItems) {
  const requests = [];

  while (requestItems.length > 0) {
    const request = batchWrite(requestItems.splice(0, 25));

    requests.push(request);
  }

  return requests;
}

function batchWrite(requestItems, attempt = 0) {
  const params = {
    RequestItems: {
      [tableName]: requestItems,
    },
  };

  let delay = 0;

  if (attempt > 0) {
    delay = 50 * Math.pow(2, attempt);
  }

  return new Promise(function(resolve, reject) {
    setTimeout(function() {
      dynamoDB.batchWrite(params).promise()
        .then(function(data) {
          if (data.UnprocessedItems.hasOwnProperty(tableName)) {
            return batchWrite(data.UnprocessedItems[tableName], attempt + 1);
          }
        })
        .then(resolve)
        .catch(reject);
    }, delay);
  });
}
```
- Verify that the trigger is properly executing the Lambda function. View the metrics emitted by the function and inspect the output from the Lambda function.
- After running the producer with a unicorn name, we can query the DynamoDB table for data for a specific unicorn. 

#### Module 4 Store & query data
- Create an S3 bucket with the name wildrydes-data-xumo.
- Create an Amazon Kinesis Data Firehose delivery stream named wildrydes that is configured to source data from the wildrydes stream and deliver its contents in batches to the S3 bucket created previously.
- Create an Athena table to query the raw data in S3 bucket. 
```
CREATE EXTERNAL TABLE IF NOT EXISTS wildrydes (
       Name string,
       StatusTime timestamp,
       Latitude float,
       Longitude float,
       Distance float,
       HealthPoints int,
       MagicPoints int
     )
     ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
     LOCATION 's3://wildrydes-data-xumo/';
```

## Cloud Web Apps
### AWS tutorial: Launch a VM (15min)
- open the Amazon EC2 console and launch instance
- configure the virtual machine, create a new key pair and launch it
- use chmod command to make sure the private key is not publicly viewable
```
chmod 400 Downloads/MyKeyPair.pem
```
- connect to the instance
```
ssh -i Downloads/MyKeyPair.pem ec2-user@54.186.234.37
```

### QwikLab: Intro to S3 (25min)
- Create a bucket and configure to allow versioning and set permissions
- upload an image to the bucket
- change the permission setting and make the image public
- create a bucket policy to set permission setting
- get access to different versions of images with the same name

