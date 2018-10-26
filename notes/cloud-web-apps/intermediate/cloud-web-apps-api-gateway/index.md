---
title: Cloud Web Apps - Amazon API Gateway Lab
date: "2018-10-15T22:12:03.284Z"
---

> API Gateway is a managed service provided by AWS that makes creating, deploying and maintaining APIs easy.
The lab creates a Lambda function and triggers it by accessing API Gateway endpoint url.
The lab also introduced the best practices of building a RESTful API and the use of micro-service.

## API Gateway includes features to:

- Transform the body and headers of incoming API requests to match backend systems
- Transform the body and headers of the outgoing API responses to match API requirements
- Control API access via Amazon Identity and Access Management
- Create and apply API keys for third-party development
- Enable Amazon CloudWatch integration for API monitoring
- Cache API responses via Amazon CloudFront for faster response times
- Deploy an API to multiple stages, allowing easy differentiation between development, test, production as well as versioning
- Connect custom domains to an API
- Define models to help standardize your API request and response transformations

## Amazon API Gateway and AWS Lambda Terminology:

- __Resource__: Represented as a URL endpoint and path. 
For example, _api.mysite.com/questions_. 
You can associate HTTP methods with resources and define different backend targets for each method. 
In a microservices architecture, a resource would represent a single microservice within your system.

- __Method__: In API Gateway, a method is identified by the combination of a resource path and an HTTP verb, 
such as GET, POST, and DELETE.

- __Method Request__: The method request settings in API gateway store the methods authorization settings 
and define the URL Query String parameters and HTTP Request Headers that are received from the client.

- __Integration Request__: The integration request settings define the backend target used with the method. 
It is also where you can define mapping templates, to transform the incoming request to match what the backend target is expecting.

- __Integration Response__: The integration response settings is where the mappings are defined 
between the response from the backend target and the method response in API Gateway. 
You can also transform the data that is returned from your backend target to fit what your end users and applications are expecting.

- __Method Response__: The method response settings define the method response types, their headers and content types.

- __Model__: In API Gateway, a model defines the format, also known as the schema or shape, of some data. 
You create and use models to make it easier to create mapping templates. 
Because API Gateway is designed to work primarily with JavaScript Object Notation (JSON)-formatted data, 
API Gateway uses JSON Schema to define the expected schema of the data.

- __Stage__: In API Gateway, a stage defines the path through which an API deployment is accessible. 
This is commonly used to deviate between versions, as well as development vs production endpoints, etc.

- __Blueprint__: A Lambda blueprint is an example lambda function that can be used as a base to build out new Lambda functions.


## Official Links

- [QwikLab: Intro to Amazon API Gateway](https://awseducate.qwiklabs.com/focuses/21?parent=catalog)
- [White House RESTful API Standards](https://github.com/WhiteHouse/api-standards#pragmatic-rest)
- [Spotify RESTful API Standards](https://developer.spotify.com/web-api/)

![arch](https://us-west-2-aws-training.s3.amazonaws.com/awsu-spl/spl-58/scripts/micro-service.png)

## Operations

### 1. Create a Lambda Function on API Gateway

- Same as [the last Lambda tutorial]((../cloud-web-apps-lab-aws-lambda)), use _Author from Scratch_, and configure:
    - __Name__: FAQ
    - __Runtime__: Node.js 8.10
    - __Existing Role__: lambda-basic-execution
    
- Create function and replace the event handling script, which performs:
    - Define a list of FAQs
    - Return a random FAQ
    
- Add an API Gateway Trigger, the Lambda function is triggered whenever a call is made to API Gateway:
    - __API__: Create a new API
    - __Security__: Open
    - __API name__: FAQ-API
    - __Deployment stage__: myDeployment
    

### 2. Trigger Lambda Function by API Gateway URL 

- Access API Gateway endpoint url in browser, a random JSON object will be returned
- Create a test by configuring:
    - __Event name__: BasicTest
    - Replace keys and values with an empty JSON object
    - Save, run and check logs