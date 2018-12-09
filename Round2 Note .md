#Round 2 note


##QwikLab: Intro to S3
Time: 55min


what is the S3?


Amazon Simple Storaeg Service - Amazon S3 is a cloud storage service. This lab will teach us how to use S3.

Big data storage is a big challenge. Localize storage plan is high cost, time cosuming, and heavy. Amazon S3 is GOOD solution to this problem.

Advantage: Safely, available when needed and scale as your want.

###Start lab: qwiklab

###Task1: Creat a Bucket
1. No uppercase. 
2. Creat a bucket is very easy. Just use the guide.
3. Bucket is a storage service's implement. Use bucket as storage device(Visual).


###Task2: Upload an Object to the Bucket
1. Control panel is well-designed. Only need to click button.

###Task3: Make your Object Public
1. My sheep link:  https://s3-us-west-2.amazonaws.com/mybucket130616/sheep.png
2. You can manage the object public or private by S3 control panel.

###Task4: Creat a bucket policy
1. Append your ARN with "/*".
2. This task is extend task of task 3. Here we use bucket policy to control resources.

###Task5: Explore Versioning.
1. This task told us about how S3 control version. 
2. Default setting in S3 display the lastest version.


##QwikLab: Intro to Amazon Redshift
Time: 55min

What is Amazon Redshift?

Amazon Redshift is a fast, scalable data warehouse. Compare to tranditional data warehouse, Redshift is simple, faster and cost-effictive.

Difference for S3: It is the difference of database and data warehouse. Database(S3) is used to give data for specific service. Data warehouse(Redshift) store data for analysis.

###Start Lab
###Task1: Launch an Amazon Redshift Cluster
1. Care about Quicklaunch and launch.
2. Multi-node and Single-node.
3. Launch a cluster need a lot of time!!!
4. Cluster configuration gives full information, like properties, node and status.

###Task2: Launch Pgweb to Communicate with your Redshift Cluster
1. Pgweb is a web application which provide a friendly SQL interface to Redshift.
2. Pgweb can easy and directly communicate with Redshift.

###Task3: Create a table
1. SQL code is simple.

###Task4: Load Sample Data from Amazon S3
1. Redshift can import data from S3.

###Task5: Query Data
1. Learn some basic function about query,.
2. SELECT 'name' like that display the 'name'.
3. WHERE, FROM, ORDER BY, GROUP BY, NOT.  

***


SELECT firstname, lastname,state  

FROM users  

WHERE liketheatre AND likeclassical AND state = 'Smith'  

ORDER BY firstname

***

##Video: Short AWS Machine Learning Overview

Time: 10min

1. Three layers: 
	> Framework and Interfaces
	
	> ML Platforms: Amazon Sagemaker
	
	> Application Services
	
2. Advantage: storage, compute, database, messaging, security base.
3. Machine Learning can improve results.
 
##AWS Tutorial: Analyze Big Data with Hadoop

Time: 70min

What is Amazon EMR?

A Managed cluster platform that simplifies running big data frameworks.

Advantage of Amazon EMR: 

> Cost Savings
> 
> AWS Integration
> 
> Deployment
> 
> Scalability and Flexibility
> 
> Reliability
> 
> Security
> 
> Monitoring
> 
> Management Interfaces

1. Prepare an Amazon S3 bucket for store data. And this bucket needs 2 folder:'logs' and 'output'.
2. I have already got EC2 keypair in round 1. That is enough.
3. Launch an EMR cluster, use S3 and EC2 key.
4. Edit SSH access.
5. Here we use hive script. HiveQL is similiar with SQL, this is use to manipulate data warehouse and analytic data.
6. We load the Hive script and resource to analysis. Hive script is like a guide for hadoop to know how to do with data.

##QwikLab: Intro to Amazon Machine Learning

Time: 65min

Amazon ML

![Amazon ML Overview](https://us-west-2-aws-training.s3.amazonaws.com/awsu-spl/spl-35/images/overview.png)
In this lab, I will use Amazon ML model to predict if customer like this restaurant. 
This lab will use S3 as datasource.

Amazon ML is benifit from Amazon strong data and cloud compute techology.

We use ML model which generate from datasource to predict future data. More data will lead higher rate of correct prediction.

###Start Lab
###Task1: Upload Training Data
1. Download data file.
2. Upload data file to S3 bucket. Step is same as usual.

###Task2: Create a Datasource
1. We use a new Amazon service - Amazon Machine Learning.
2. Link ML with S3(or Redshift).
3. Should give a target for Learning.

###Task3: Creat a ML Model from the Datasource
1. In this task, we create a model from the restaurant.data(previous datasource).
2. We can create multiple models from single datasource.
3. It takes 8 minute. In common situation, it will spend 5 to 10 minutes.

###Task4: Evaluate an ML Model.
1. If we want a correct result, it is important to correcct evaluate ML Model.
2. ML model will give us predict results. This prediction results will be compare with known results.
3. We can see rate of prediciton.
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/MLmodel%20prediction.png?raw=true)

###Task5: Generate Prediction from Your ML Model.
1. Two modes: 
	> batch mode
	> real-time mode
2. With this mode, we can input new information and get a prediciton.
![](https://github.com/GuanYuankai/dist-sys-practice/blob/master/Image/ML%20Real-Time%20Model.png?raw=true)

##AWS Tutorial: Build a Machine Learning Model 
It is similiar with previous part(QwikLab: Intro to Amazon Machine Learning). Just use the different datasource.

##Amazon SageMaker

Time:75min


Amazon SageMaker is a fully managed machine learning service. SageMaker is clearly positioned to connect applications, especially unstructured video image, voice, and language text related applications.
Sagemaker is used to free data scientists from pre-processing.
Data scientists using sagemaker need only know a few models, and the use of interfaces.


##Bring it all together:Build a Serverless Real-Time Data Processing App

###Overview
Serverless applications don’t require you to provision, scale, and manage any servers. You can build them for nearly any type of application or backend service, and everything required to run and scale your application with high availability is handled for you.

> 1. Build a data stream
> 2. Aggregate data
> 3. Process streaming data
> 4. Store & query data

![](https://d1.awsstatic.com/serverless/Lambda%20Resources%20images/Architecture_0.ca60f70f01876f7a4bc96686bc90adcf791039f7.png)

1. We use new service: Amazon Cloud9.
2. AWS Cloud9 is a cloud-based integrated development environment (IDE) that lets you write, run, and debug your code with just a browser. 
3. First create an environmnet. Then we can use Amazon lambda. Looks like codeanywhere.
4. Cloud-based, it is important so I repeat it.
5. New service, Kinesis. Kinesis is work with data stream in real-time.
6. Kinesis can collect data stream. It uses as monitor or dectactor.
7. Cognito, Amazon service, is used to sychronized data.
8. IAM, Identity and Access Management. Use this to create a policy.