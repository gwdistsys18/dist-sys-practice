---
title: Cloud Web Apps - AWS Lambda Lab
date: "2018-10-14T22:12:03.284Z"
---

> AWS Lambda is a compute service that runs your code in response to events and automatically manages the compute resources for you, 
making it easy to build applications that respond quickly to new information. 
This lab creates a Lambda function to handle S3 image uploads by resizing them to thumbnails
and storing the thumbnails in another S3 bucket.

## Official Links

[QwikLab: Intro to AWS Lambda](https://awseducate.qwiklabs.com/focuses/36?parent=catalog)

## Operations

### 1. Create 2 Amazon S3 Buckets as Input and Output Destination

- On the __Services__ menu, select __S3__
- Create bucket, with name _images-1234_, as the source bucket for original uploads
- Create another bucket, with name _images-1234-resized_, as the output bucket for thumbnails
- Upload the _HappyFace.jpg_ to source bucket

### 2. Create an AWS Lambda Function

- On the __Services__ menu, select __Lambda__
- Create function and configure
    - Name: Create-Thumbnail
    - Runtime: Python 3.6
    - Existing role: lambda-execution-role
    
    This role grants permission to the Lambda function to read and write images in S3
- Finish the rest of configuration by providing the url of the zipped Python script, which handles upload event, creates
thumbnail in output bucket

### 3. Trigger Your Function by Uploads

- Click _Test_ button and configure
    - Event template: Amazon S3 put
    - Event name: Upload
- Modify the template
    - replace _example-bucket_ with _images-1234_
    - replace _test.key_ with _HappyFace.jpg_
- Save and run
- If success, the thumbnail image could be found in output bucket
    

### 4. Monitoring and Logging
- __Monitoring__ tab displays graphs showing:
    - Invocations: The number of times the function has been invoked.
    - Duration: How long the function took to execute (in milliseconds).
    - Errors: How many times the function failed.
    - Throttles: When too many functions are invoked simultaneously, they will be throttled. The default is 1000 concurrent executions.
    - Iterator Age: Measures the age of the last record processed from streaming triggers (Amazon Kinesis and Amazon DynamoDB Streams).
    - Dead Letter Errors: Failures when sending messages to the Dead Letter Queue.
- __Amazon CloudWatch Logs__ have detailed log messages in stream
