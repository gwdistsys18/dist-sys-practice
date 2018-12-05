---
title: Cloud Web Apps - Amazon S3 Lab
date: "2018-10-09T22:12:03.284Z"
---

> Amazon S3 is short for Simple Storage Service, which is an object storage service of AWS.
This lab introduces the common features of S3.

## Official Links
[QwikLab: Intro to S3](https://awseducate.qwiklabs.com/focuses/30?parent=catalog)

## Operations

### 1. Create a bucket in Amazon S3

In the __AWS Management Console__, click __S3__ on the __Services__ menu to open S3 console.


- Click  __Create bucket__ button
    - Name the bucket as mybucket{some random number}, duplicate names are not allowed
    - Leave __Region__ to default value, objects will be only stored to the designated region, 
  explicit transfer to another region is possible

- In the __Configure options__ dialog box
    - Check __Keep all versions of an object in the same bucket__
    - Leave other options to default value (e.g. no public read access to bucket)
    
- Finish by clicking __Create bucket__ button
    - If an error concerning the bucket name occurs, go back and change the bucket name until it works

### 2. Add an object to bucket

An __object__ can be any kind of file: text, image, video and etc.

- Download the Sheep.jpg to your computer
- Select the bucket just created in __S3 Management Console__
    - Click __Upload__ button
    - Click __Add files__ button
    - Select the image file then click __Upload__ button
    - Once uploaded, the file will be displayed in bucket

### 3. Manage access permissions on an object

By default, uploaded objects are private, not publicly accessible.

- Click on the S3 link for the image file
    - A XML based __Access Denied__ error will be displayed
- Make the file public
    - Click on the file in console
    - Under __Permissions__ tab, __Public access__ section, select __Everyone__
    - Select __Read object__ and save
    - Open the S3 link again, the image will be shown

### 4. Create a Bucket Policy

Grant access to the entire bucket by setting up a policy.

- Find ARN (Amazon Resource Name) of bucket in the __Permissions__ tab,
![arn](https://us-west-2-aws-training.s3.amazonaws.com/awsu-spl/spl-65/scripts/arn.png)

- Generate Policy
    - Click the __Policy generator__ link
    - Set __Select Type of Policy__ to `S3 Bucket Policy`, __Principal__ to `*`
    - Set __Actions__ to `GetObject` so that anyone will be able to access
    - Append `/*` to ARN to allow the policy to apply to all objects within the bucket
    - Click __Add Statement__ and then __Generate Policy__
    - Copy and paste the generated JSON object to __Bucket policy editor__
    - Save and test by accessing any object
    

### 5. Use bucket versioning

- Create a different version of object
    - Upload a different image file with the same as an existing file in bucket
    - Test the S3 link, it will point to the latest version
    - Previous versions could be found by clicking on __Latest version__
    ![versions](https://us-west-2-aws-training.s3.amazonaws.com/awsu-spl/spl-65/scripts/latest-version.png)
    - By default, the previous version is not accessible via the S3 link, grant access to previous version
    by appending field `s3:GetObjectVersion` to policy
    ![grant version access](https://us-west-2-aws-training.s3.amazonaws.com/awsu-spl/spl-65/images/get-object-version.png)
    - Save and the policy takes effect 