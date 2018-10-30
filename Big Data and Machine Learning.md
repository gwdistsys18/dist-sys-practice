# Big Data and Machine Learning

标签（空格分隔）： note

---

###1. Evolution of Big Data
Before 2000 --- data was relatively smaller. Complex computation and processor bound. Bigger computers, larger menmory, and faster processors.
After 2000 --- data explosion. older solutions could no longer help.
**One solution** for data explosion is distributed system. It's faster but causes high chance of system failure and high programming omplexity. Because distributed system is difficult to synchronize data and process.
###2. Hadoop---the solution for above challenges
Haddop is a framework that allows for distributed processing of large data sets across clusters of commodity computers using single  programming models.
####2.1 Four key characteristics of Hadoop
1. Economical: ordinary computers can be used for data processing. 
2. Reliable: store copies of the data on different machines and is resisdant to hardware failure.
3.  scalable: can follow both horizontal and vertical scaling.
4.  flexible:  can store as much of the data and ecide to use it later. 
####2.2 Traditional Database System vs Hadoop
Traditional database system: push high volumes of data to the processor.
Hadoop: it initially distributes the data to multiple systems and later runs the computation wherever the data is located.
Just like eating behavior that human eats food with the help of a spoon where the food is brought to the mouth(traditional) vs a tiger brings its mouth towards the food directly(Hadoop).
###3. Hadoop Ecosystem - Components
Data ingestion: Sqoop,Flume
Data analysis: Pig, Impala,Hive 
Data exploraion:  Cloudera Search,Hue
Workflow System: Oozie
Data processing(core):Spark, Map Reduce, Yarn, HDFS
NoSQL: HBase
####3.1 Hadoop Distributed File System(HDFS)
a) storage layer for Hadoop
b) for the distributed storage and processing
c) Hadoop provides a command line interface to interact with HDFS
d) access to file system data
e) file permissions and authentication
####3.2 HBase
a) Stores data in HDFS
b) A NoSQL database or Nonrelational database
c) mainly used when you need random, real-time, read/write, access to you Big Data
d) Provides support to high volume of data and high throughput
e) The table can have thousands of columns
####3.3 Sqoop
a) Sqoop is  tool designed to transfer data between Hadoop and relational database servers
b) It is used to import data rom relational database such as, Oracle and MySQL to HDFS and export data from HDFS to relational database.
####3.4 Flume
a) A distributed service for ingesting streaming data.
b) Ideally suited for event data from multile systems.
####3.5 Spark
a) An open-source cluster computing framework.
b) Providing 100 times faster performance as compared to MapReduce.
c) Supports Machine Learning, Business Intelligence, Streaming, and batch processing.
####3.5 Hadoop MapReduce
a) The original Hadoop processing engine which is primarily Java based.
b) Based on the map and reduce programming model.
c) An extensive and mature fault tolerance framework.
d) commonly used
####3.6 Pig
a) An open-source dataflow system.
b) Convert pig script to Map-Reduce code.
c) An alternate to writing Map-Reduce code.
d) Best for ad-hoc queries like join and filter
####3.7 Impala
a) High perfermance SQL engine which runs on Hadoop cluster.
b) Ideal for interactive analysis.
c) Very low latency-measured in milliseconds.
####3.8 Hive
a) Similar to Impala.
b) Best for data processing and ETL(extract transform load).
c) Executes queries using MapReduce.
####3.8 Cloudera Search
a) One of Cloudera's near-real-time access products.
b) Enables non-technical users to search and explore data stored in or ingested into Hadoop and HBase.
c) A fully integrated data processing platform.
d) Users do not need SQL or programming skills to use Cloudera Search.
####3.9 Oozie
Oozie is a workflow or coordination system used to manage the Hadoop jobs.
####3.10 Hue
Hue is an acronym for Hadoop User Experience
a) Hue is an open source web interface for analyziing data with Hadoop.
b) It provides SQL editors for Hive, MySQL, Oracle, PostgreSQL, Spark SQL, and Solr SQL.
###4. Four stages of Big Data
Components of the Hadoop ecosystem work together to process Big Data.
Ingest → Processing → Analyze → Access
Ingest: Sqoop, Flume
Process: HDFS, HBase, Spark, MapReduce
Analyze: Hive, Pig, Impala
Access: Hue, Cloudera Search

---
###QwikLab:Analyze Big Data With Hadoop
####task1: Create an Amazon S3 Bucket
I created a S3 Bucket named 6421test
####taske2: Lunch an Amazon EMR cluster
I created a cluster named my cluster. The status starting lasts several minutes.
####task3: Process Your Sample Data by Running a Hive Script
wait until my cluster is showing a status of Waiting. But the status didn't shift from starting to waiting for more than 10 minutes. So I keep refresh the status and finally it showed Waiting.
After the status of the step change to **Completed**,the result is shown in my 6421test S3 bucket.
####task4: View the Results
Open the S3 bucket created before(mine is 6421test), and check the os_requests folder in it. Then download 000000_0 file in the folder.In the text file I can see the number of access requests by operating system.
####task5: Terminate your Amazon EMR Cluster

---
##Data Storage:
###QwikLab: Intro to S3
####Task1: Create a Bucket
Just the same as last QwikLab, I created a bucket named mybucket0345. But need to take care the configure option about Versioning, Manage public permission and Manage system permission.
####Task2: Upload an Object to the Bucket
Download Sheep.jpg and upload to mybucket0345.
####Task3: Make Your Object Public
Click the Sheep.jpg in mybucket0345 and copy the link:https://s3-us-west-2.amazonaws.com/mybucket0345/Sheep.jpg, then open the link in a new web browser tab. An error occured:

    This XML file does not appear to have any style information associated with it. The document tree is shown below.
    <Error>
    <Code>AccessDenied</Code>
    <Message>Access Denied</Message>
    <RequestId>0953DA3764F7F5D1</RequestId>
    <HostId>
    P1wsWCE1OiqtpDD8Zveh7BGcAMCTF3ID/+Us7uvxDkQ6QarBMee5LB/AzDxEY6ud4tsqX+Z73VE=
    </HostId>
    </Error>
Return to **S3 Management Console** and click **Permission** tab, and configure like below:
Under the **publick access**, select **Everyone**.
select **Read object**.
click **save**
Refresh the brower tab and the picture of Sheep.jpg is shown.
####Task4: Create a Bucket Policy
Download Eiffel.jpg and upload to mybucket0345. Copy the link https://s3-us-west-2.amazonaws.com/mybucket0345/Eiffel.jpg and open it in a new brower tab. An error same as last step occured.
Go to **Permission** tab and click **Bucket Policy**, then click **AWS Policy generator**. Please remember to copy the ARN(mine is arn:aws:s3:::mybucket0345). Finally the generator output the policy as below: 

    {
    "Id": "Policy1540845460520",
     "Version": "2012-10-17",
    "Statement": [
    {
      "Sid": "Stmt1540843936491",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::mybucket0345/*",
      "Principal": "*"
      }
     ]
    }
Paste the policy to **Bucket policy editor** and save. Refresh the brower tap then the picture Eiffel.jap was shown.
####Task5: Explore Versioning.
Versioning is a means of keeping multiple variants of an object in the same bucket. You can use versioning to preserve, retrieve, and restore every version of every object stored in your Amazon S3 bucket. With Versioning you can easily recover from both unintended user actions and application failures.

    {
    "Id": "Policy1540845460520",
     "Version": "2012-10-17",
    "Statement": [
        {
        "Sid": "Stmt1540843936491",
         "Action": [
            "s3:GetObjectVersion",
            "s3:GetObject"
            ],
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::mybucket0345/*",
        "Principal": "*"
        }
      ]
    }
Change the policy as above then different versions can be displayed.

---
##Big Data Analytics
###Short AWS Machine Learning Overview
3 layers to the machine learning stack.

 - Layer 1: Framework & Interfaces:
Build and train machine leanrning models
Is great for experts but the problem is like any kind of expertise, there just aren't enough for them to go around.
 - Layer2: ML Platforms
Amazon Sagemaker
Build → Train → Tune → Deploy
 - Layer3: Application Services
This is for developers that want to make calls to APIs to add machine learning services to their applications without building and training their own models.

---
##AWS Tutorial: Analyze Big Data with Hadoop

 - Step1: Set Up prerequisites
 a) Sign Up for AWS(I use my AWS educate account).
 b) Create an Amazon S3 Bucket. Just the same as above QwikLabs.
 c) Create an Amazon EC2 Key Pair.Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/. And create key pair in NETWORK & SECURITY-Key Pairs.
 - Step2: Launch the cluster. Similar as the QwikLabs before, create a cluster.
 - Step3: Allow SSH Access
a) Open the Amazon EMR console at https://console.aws.amazon.com/elasticmapreduce/.
b) Choose **Clusters**.
c) Choose the **Name** of the cluster.
d) Under Security and access choose the Security groups for **Master** link.
e) Choose **ElasticMapReduce-master** from the list.
f) Choose **Inbound**, **Edit** to add a new inbound rule.
g) Scroll down through the listing of default rules and choose **Add Rule** at the bottom of the list.
h) For **Type**, select SSH. For source, select **My IP**.
i) Choose **Save**.
j) Choose **ElasticMapReduce-slave** from the list and repeat the steps above to allow SSH client access to core and task nodes from trusted clients.
 - Stept4: Run a Hive Script to Process Data
The sample script calculates the total number of requests per operating system over a specified time frame. The script uses HiveQL, which is a SQL-like scripting language for data warehousing and analysis. The script is stored in Amazon S3 at s3://region.elasticmapreduce.samples/cloudfront/code/Hive_CloudFront.q where region is your region.
The sample Hive script does the following:
 - Creates a Hive table schema named cloudfront_logs. For more information about Hive tables, see the Hive Tutorial on the Hive wiki.
 - Uses the built-in regular expression serializer/deserializer (RegEx SerDe) to parse the input data and apply the table schema. For more information, see SerDe on the Hive wiki.
 - Runs a HiveQL query against the cloudfront_logs table and writes the query results to the Amazon S3 output location that you specify.
a) Submit the Hive Script as a Step
It's similar as **QwikLab:Analyze Big Data With Hadoop, task3**.
b) View the Results.
It's also the same as **QwikLab:Analyze Big Data With Hadoop, task4.**
 - Step5: Clean up Resources
 Terminate the cluster and delete the output bucket. The same as **QwikLab:Analyze Big Data With Hadoop** and **QwikLab: Intro to S3**.

---
##Machine Learning Models
What is Amazon Machine Learning?
Amazon Machine Learning (Amazon ML) is a robust, cloud-based service that makes it easy for developers of all skill levels to use machine learning technology. Amazon ML provides visualization tools and wizards that guide you through the process of creating machine learning (ML) models without having to learn complex ML algorithms and technology. Once your models are ready, Amazon ML makes it easy to obtain predictions for your application using simple APIs, without having to implement custom prediction generation code, or manage any infrastructure.
###QwikLab: Intro to Amazon Machine Learning
####Task1: Upload Training Data
Download the file restaurants.data and upload it to S3 bucket(I created data0123).
####Task2: Create a Datasource
a) In the **Service** menu, click **Machine Learning**.
b) Click **Get started**, and click **View Dashboard** then.
c) Click **Create new...>Datasource and ML model**.
d) type in **S3 location**: data0123/restaurants.data
e) **Verify** and **Yes**, then **Continue**.
f) Choose **Yes** for **Does the first line in your CSV contain the column names?**. Then **continue**.
g) Choose **Rating** in the sheet and **continue**. No row identifier and click **Review**, then **Continue**. The page will jump to **ML model settings** page.
####task3: Create an ML Model from the Datasource
a) Click **Review** in **ML model settings** page, then **Create ML model**.
b) In the top-left of the window, click **Amazon Machine Learning** and then click **Dashboard**.
It will take several minutes to complete all procsses. For me it's 20 minutes: 4 minutes for each datasource type, 3 minutes for 
ML model type, and 5 minutes for Evaluation type.
####Task4: Evaluate an ML Model
a) In last task, wait for the status of Evaluation swiching to **Completed**
b) Click **Evaluation: ML model: Restaurants.data**, then click **Explore Model performance**.
c) A **confusion matrix** is output(like below):
excellent,very good,satisfactory,dislike,Total,F1
excellent,1740,0,105,2,1847,0.9160305343511449
very good,34,1308,58,74,1474,0.8778523489932885
satisfactory,178,118,583,7,886,0.7144607843137254
dislike,0,80,0,377,457,0.8222464558342419
####Task 5: Generate Predictions From Your ML Model
a) In the top-left of the window, click **Amazon Machine Learning** and then click **ML models**.
b) Choose **ML model: Restaurants.data**
c) Under **Predictions** click **Try real-time predictions**.
d) In the form we can input different inforamtion and click **Create prediction**. Then the model will make prediction according to the information you input. Result should be like **dislike**, **excellent**, **Satisfactory**. 

---
###AWS Tutorial: Build a Machine Learning Model 
This tutorial is very similar as **QwikLab: Intro to Amazon Machine Learning**. Only use different files to train the model.

####Step 1: Prepare Your Data
a) Just download *banking.csv* at https://s3.amazonaws.com/aml-sample-data/banking.csv. 
b) *banking-batch.csv* at https://s3.amazonaws.com/aml-sample-data/banking-batch.csv.
c) Upload these file to S3 Bucket.
####Step 2: Creating a Training Datasource
it's similar as **Task 2** in **QwikLab: Intro to Amazon Machine Learning**.
####Step 3: Create an ML Model
It's the same as **Task 3** in **QwikLab: Intro to Amazon Machine Learning**.
####Step 4: Review the ML Model's Predictive Performance and Set a Score Threshold.
a)To review the AUC metric for your ML model:
 - On the ML model summary page, in the ML model report navigation pane, choose Evaluations, choose Evaluation: ML model: Banking model 1, and then choose Summary.
 - On the Evaluation summary page, review the evaluation summary, including the model's AUC performance metric.
b) To set a score threshold for your ML model:
 - On the Evaluation Summary page, choose Adjust Score Threshold.
 - Let's say you want to target the top 3% of the customers that will subscribe to the product. Slide the vertical selector to set the score threshold to a value that corresponds to 3% of the records are predicted as "1".
 - Choose Save score threshold at 0.77.
####Step 5: Use the ML Model to Generate Predictions
It's similar as **Task 5** in **QwikLab: Intro to Amazon Machine Learning** only the data is different. But in this step, we also make a batch prediction.
#####To create a batch prediction:
 - Choose **Amazon Machine Learning**, and then choose **Batch Predictions**.
 - Choose **Create new batch prediction**.
 - On the **ML model for batch predictions** page, choose **ML model: Banking Data 1**.
 - Choose **Continue**.
 - For **Locate the input data**, choose **My data is in S3, and I need to create a datasource**.
 - For **Datasource name**, type **Banking Data 2**.
 - For **S3 Location**, type the full location of the banking-batch.csv file.
 - For **Does the first line in your CSV contain the column names?**, choose **Yes**.
 - Choose **Verify** and **Continue**.
 - For **S3 destination**, type the name of the Amazon S3 location where you uploaded the files in Step 1: Prepare Your Data. Amazon ML uploads the prediction results there.
 - For **Batch prediction name**, accept the default, **Batch prediction: ML model: Banking Data 1**. Amazon ML chooses the default name based on the model it will use to create predictions. In this tutorial, the model and the predictions are named after the training datasource, Banking Data 1.
 - Choose **Review**.
 - In the **S3 permissions** dialog box, choose **Yes**.
 - On the **Review** page, choose **Finish**.
#####To view the predictions
 - Choose **Amazon Machine Learning**, and then choose **Batch Predictions**.
 - In the list of predictions, choose **Batch prediction: ML model: Banking Data 1**. The **Batch prediction info** page appears.
 - To view the results of the batch prediction, go to the Amazon S3 console at https://console.aws.amazon.com/s3/ and navigate to the Amazon S3 location referenced in the **Output S3 URL** field. From there, navigate to the results folder, which will have a name similar to s3://aml-data/batch-prediction/result.
 - Download the prediction file to your desktop, uncompress it, and open it.
####Step 6: Clean Up
 - delete the input data stored in Amazon S3
 - delete the batch predictions
 - delete the Amazon ML resources

---
###Video Tutorial: Overview of AWS SageMaker
Amazon sage maker is a brand new service for machine learning and in a nutshell it's really everything that you need to define and train and deploy machine learning and deep learning models.
There are 4 parts in Sage Maker console, they cen be combined or used independently: 
Notebook instance: which is it's the manage AWS instance that you're going to start to run your notebooks and it has a lot of samples for you to look at.
Jobs: Doing training jobs
Models: Model repository(trained).
Endpoint: Deploy the model behind an endpoint that you can invoke from your nootbook using SDK or from an HTTP API.
####Part 1: Create nootbook instance
nootbook instance name, nootbook instance type, nootbook VPC-optional, Encryption key-optional.
Click **Open** the instance, will jump to jupyter environment.
####Part 2: Multiclass classification with Amazon SageMaker XGBoost algorithm
The detail guidline and code can be read in the document. 
 - Data ingestion
 - Data conversion
 - Training the XGBoost model
 - Training on a single instance
 - Training on multiple instances
####Part 3: Jobs
Open one instance job to get the job information.
 - Set up hosting for the model
 - import model into hosting
 - creat endpoint configuration
 - Validate the model for use(test predic)
 - Delete Endpoint or keep it
####Part 4: Training and hosting SageMaker Models using the Apache MXNet Module API
The detail guidline and code can be read in the document. 
 - Setup
 - The training script
 - SageMaker's MXNet estimator class
 - Running the Training Job
 - Creating an interface Endpoint(deploy)
 - Making an inference request(test)
####Part 5: Bring You Own Model(k-means)
The detail guidline and code can be read in the document. 
 - Setup
 - Training locally
 - Convert
 - Host(test)
 - Extensions
####Part 6: Building your own algorithm container
The detail guidline and code can be read in the document. 
 - Packaging and Uploading your Algorithm for use with Amazon SageMaker
 - Training and Hosting your Algorithm in Amazon SageMaker

---
###AWS Tutorial: AWS SageMaker 
Amazon SageMaker is a fully managed machine learning service. With Amazon SageMaker, data scientists and developers can quickly and easily build and train machine learning models, and then directly deploy them into a production-ready hosted environment. It provides an integrated Jupyter authoring notebook instance for easy access to your data sources for exploration and analysis, so you don't have to manage servers. It also provides common machine learning algorithms that are optimized to run efficiently against extremely large data in a distributed environment. With native support for bring-your-own-algorithms and frameworks, Amazon SageMaker offers flexible distributed training options that adjust to your specific workflows. Deploy a model into a secure and scalable environment by launching it with a single click from the Amazon SageMaker console. Training and hosting are billed by minutes of usage, with no minimum fees and no upfront commitments.
####Part 1: Read How It Works
#####1.1 Machine Learning with Amazon SageMaker
Amazon SageMaker is a fully managed service that enables you to quickly and easily integrate machine learning-based models into your applications. This section provides an overview of machine learning and explains how Amazon SageMaker works. If you are a first-time user of Amazon SageMaker, we recommend that you read the following sections in order:

a) Machine Learning with Amazon SageMaker.

 - Generate example data
     Fetch the data
     Clean the data
     Prepare or transform the data
 - Train a Model
     Training the model
     Evaluating the model
 - Deploy the model
#####1.2: Explore and Preprocess Data
Before using a dataset to train a model, data scientists typically explore and preprocess it. For example, in one of the exercises in this guide, you use the MNIST dataset, a commonly available dataset of handwritten numbers, for model training. Before you begin training, you transform the data into a format that is more efficient for training.
To preprocess data use one of the following methods:
 - Use a Jupyter notebook on an Amazon SageMaker notebook instance. You can also use the notebook instance to write code to create model training jobs, deploy models to Amazon SageMaker hosting, and test or validate your models. For more information, see - Using Notebook Instances
You can use a model to transform data by using Amazon SageMaker batch transform. For more information, see Step 3.4.2: Deploy the Model to Amazon SageMaker Batch Transform.
#####1.3: Training a Model with Amazon SageMaker
To train a model in Amazon SageMaker, you create a training job. The training job includes the following information:

 - The URL of the Amazon Simple Storage Service (Amazon S3) bucket where you've stored the training data.
 - The compute resources that you want Amazon SageMaker to use for model training. Compute resources are ML compute instances that are managed by Amazon SageMaker.
 - The URL of the S3 bucket where you want to store the output of the job.
 - The Amazon Elastic Container Registry path where the training code is stored. For more information, see Algorithms Provided by Amazon SageMaker: Common Parameters. 

You have the following options for a training algorithm:

 - Use an algorithm provided by Amazon SageMaker
 - Use Apache Spark with Amazon SageMaker
 - Use your own custom algorithms
#####1.4: Model Deployment in Amazon SageMaker
After you train your model, you can deploy it to get predictions in one of two ways:

 - To set up a persistent endpoint to get one prediction at a time, use Amazon SageMaker hosting services.
 - To get predictions for an entire dataset, use Amazon SageMaker batch transform.
#####1.5: Validating Machine Learning Models
#####1.6: The Amazon SageMaker Programming Model
Making API calls directly from code is cumbersome, and requires you to write code to authenticate your requests. Amazon SageMaker provides the following alternatives:

 - Use the Amazon SageMaker console
 - Use the Amazon SageMaker console
 - Write model training and inference code from scratch
 - Integrate Amazon SageMaker into your Apache Spark workflow
####Part 2: Getting Started
#####2.1 Setting Up

 - Create an AWS Account and an Administrator User
 - Create an S3 Bucket
#####2.2 Create an Amazon SageMaker Notebook Instance
To create an Amazon SageMaker notebook instance:

 - Open the Amazon SageMaker console at https://console.aws.amazon.com/sagemaker/.
 - Open the Amazon SageMaker console at https://console.aws.amazon.com/sagemaker/.
 - Open the Amazon SageMaker console at https://console.aws.amazon.com/sagemaker/.
     For Notebook instance name, type ExampleNotebookInstance.
     For Instance type, choose ml.t2.medium.
 - When the status of the notebook instance is InService, choose Open next to its name to open the Jupyter dashboard.
#####2.3 Train a Model with a Built-in Algorithm and Deploy It
In this exercise, you do the following:

 - Download the MNIST dataset to your Amazon SageMaker notebook instance, then review the data and preprocess it. For efficient training, you convert the dataset from the numpy.array format to the RecordIO protobuf format.
 - Start an Amazon SageMaker training job.
 - Start an Amazon SageMaker training job.
 - Validate the model by sending inference requests to the model's endpoint. You send images of handwritten, single-digit numbers. The model returns the number of the cluster (0 through 9) that the images belong to.
#####2.4 Clean up
To avoid incurring unnecessary charges, use the AWS Management Console to delete the resources that you created for this exercise.
#####2.5 Additional Considerations: Integrating Amazon SageMaker Endpoints into Internet-facing Applications
In a production environment, you might have an internet-facing application sending requests to the endpoint for inference. The following high-level example shows how to integrate your model endpoint into your application.

 - Create an IAM role that the AWS Lambda service principal can assume. Give the role permissions to call the Amazon SageMaker InvokeEndpoint API.
 - Create a Lambda function that calls the Amazon SageMaker InvokeEndpoint API.
 - Create a Lambda function that calls the Amazon SageMaker InvokeEndpoint API.
####Part 3: Try a model training exercise
In this exercise, you do the following:

 - Download the MNIST dataset to your Amazon SageMaker notebook instance, then review the data and preprocess it. For efficient training, you convert the dataset from the numpy.array format to the RecordIO protobuf format.
 - Start an Amazon SageMaker training job.
 - Deploy the model in Amazon SageMaker.
 - Validate the model by sending inference requests to the model's endpoint. You send images of handwritten, single-digit numbers. The model returns the number of the cluster (0 through 9) that the images belong to.

There are two ways to use this exercise:

 - Follow the steps to create, deploy, and validate the model. You create a Jupyter notebook in your Amazon SageMaker notebook instance, and copy code, paste it into the notebook, and run it.
 - If you're familiar with using sample notebooks, open and run the follwing example notebooks that Amazon SageMaker provides in the SageMaker Python SDK section of the SageMaker Examples tab of your notebook instance:
kmeans_mnist.ipynb
kmeans_mnist_lowlevel.ipynb
####Part 4: Explore other topics
 - Submit Python code to train with deep learning frameworks
 - Submit Python code to train with deep learning frameworks
 - Use Amazon AI to train and/or deploy your own custom algorithms
####Part 5: See the API Reference

 