---
title: Cloud Web Apps - Build a Serverless Web App
date: "2018-10-17T22:12:03.284Z"
---

> We will build a simple serverless (AWS Lambda) web application that enables users to request unicorn rides from the Wild Rydes fleet. 
The application will present users with an HTML based user interface for indicating the location 
where they would like to be picked up and will interface on the backend with a RESTful web service 
to submit the request and dispatch a nearby unicorn. 
The application will also provide facilities for users to register with the service and log in before requesting rides.

## Official Links

[AWS Tutorial: Build a Serverless Web Application](https://aws.amazon.com/getting-started/projects/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/?trk=gs_card)

### Static Web Hosting on S3

Amazon S3 hosts static web resources including HTML, CSS, JavaScript, and image files which are loaded in the user's browser.

![s3](https://d1.awsstatic.com/Test%20Images/Kate%20Test%20Images/Serverless_Web_App_LP_assets-02.400d3f961e8e12b2640cc15cddf83510b6ecfc18.png)

- [Download the zip that has everything of the static site](https://github.com/awslabs/aws-serverless-workshops/archive/master.zip)
- Create an S3 bucket with name _wildrydes-FIRSTNAME-LASTNAME_ as suggested
- Unzip and upload everything in folder */WebApplication/1_StaticWebHosting/website/*
- Make bucket content public by setting up policy
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::wildrydes-warren/*"
        }
    ]
}
```
- Enable __Static website hosting__ under __Properties__ tab, and set _index.html_ for the Index document
- Save and [see static website](http://wildrydes-warren.s3-website-us-east-1.amazonaws.com/)

### User Management on Cognito

Amazon Cognito provides user management and authentication functions to secure the backend API.

![Amazon Cognito](https://d1.awsstatic.com/Test%20Images/Kate%20Test%20Images/Serverless_Web_App_LP_assets-03.1403870f0fabeb6a11d3e4116092aa6b19b6a924.png)

- Create a Cognito user pool with name _WildRydes_, then get __Pool Id__
- Add app client to pool with name _WildRydesWebApp_, uncheck the __Generate client secret__ option, since client secrets aren't 
currently supported for use with browser-based applications, then get __App client id__

![app client](app_client.png)

- Modify __/js/config.js__ by filling in __Pool Id__, __App client id__, and region
```javascript
window._config = {
    cognito: {
        userPoolId: 'us-east-1_65cLrZQkK', // e.g. us-east-2_uXboG5pAb
        userPoolClientId: '3m1t3bi2d9p62qa79pj930r65p', // e.g. 25ddkmj4v6hfsfvruhpfi7n4hv
        region: 'us-east-1' // e.g. us-east-2
    },
    api: {
        invokeUrl: '' // e.g. https://rc7nyt4tql.execute-api.us-west-2.amazonaws.com/prod',
    }
};
```

- Visit [register.html](http://wildrydes-warren.s3-website-us-east-1.amazonaws.com/register.html) to create an account,
either with a real mailbox or a dummy one

- Visit [verify.html](http://wildrydes-warren.s3-website-us-east-1.amazonaws.com/verify.html), fill in the verification code
or __confirm__ user in Cognito console (General settings/Users and groups) manually

- Visit [ride.html](http://wildrydes-warren.s3-website-us-east-1.amazonaws.com/ride.html), log in with email and password, 
you should see

![login](login.png)

### Serverless Backend with AWS Lambda

Amazon DynamoDB provides a persistence layer where data can be stored by the API's Lambda function.

![backend](https://d1.awsstatic.com/Test%20Images/Kate%20Test%20Images/Serverless_Web_App_LP_assets-04.094e0479bc43ee7ecbbd1f7cc37ab90b83fe5e73.png)

- Create DynamoDB table with name __Rides__, and __RideId__ for partition key
- Create an IAM role for Your Lambda function, name it _WildRydesLambda_

  Every Lambda function has an IAM role associated with it. 
  This role defines what other AWS services the function is allowed to interact with.
  
- Grant IAM role _WildRydesLambda_ to write DynamoDB

![inline_policy](inline_policy.png)

- Specify table to the role with table ARN

![table_arn](table_arn.png)


- Create a Lambda Function for Handling Requests, name it _RequestUnicorn_

- Choose an existing role for function _RequestUnicorn_ as _WildRydesLambda_, so that the function
is able to write DynamoDB

![create_lambda](create_lambda.png)

- Test the function

![test_lambda](test_lambda.png)

### RESTful APIs with API Gateway

In this module you'll use Amazon API Gateway to expose the Lambda function _RequestUnicorn_ as a RESTful API. 
This API will be accessible on the public Internet. 
It will be secured using the Amazon Cognito user pool you created in the previous module.

![API Gateway](https://d1.awsstatic.com/Test%20Images/Kate%20Test%20Images/Serverless_Web_App_LP_assets-05.90540a6a2447e51cebdbb654c5c44d9344358b51.png)

- Create a New REST API in API Gateway, name it _WildRydes_
- Create a Cognito User Pools Authorizer, name it _WildRydes_, then test with the __Authorization Token__

![create_auth](create_auth.png)
![test_auth](test_auth.png)

- Create a new resource, name it __ride__ and create a _POST_ method for it
- Use Lambda function _RequestUnicorn_ to handle the _POST_ method
- Deploy API in stage _prod_
- Update _config.js_ in S3 with the _invokeUrl_
- Login and request a unicorn pickup on white house south lawn :)
![request](request_unicorn.png)
