# Build a Machine Learning Model by SageMaker

> Today I will talk about Amazon Sagemaker - a fully-managed machine learning service and will mainly focus on two point: why we need it and how it works.

## What I care most?
Machine learning is a method of data analysis that automates analytical model building and it is become more and more popular in recent years. Nowadays, even my own laptop can build and train some simple machine learning models such as MLP and SVM. However, when dealing with deep neural networks, real time straming processing or large bunch of data, it will kill lots of time and make my laptop crashed.  
  
To solve this problem, I would like to use some distributed system techniques like EC2 Instance for computing, S3 for storage and Microservices for deployment but it is still a hard work to organize all of it.  
  
Fourtunately, Amazon provides us a solution SageMaker combining all of these techniques and optimizing in each step.

## SageMaker Procedure
Amazon SageMaker is a fully managed service for machine learning which includes the processes of data preparing, model training and model deployment. 
* Build (data preparing): SageMaker supports Jupyter notebook and allows you to transform data and connect to other AWS services such as S3 in this part. 
* Train (tune): In machine learning, after constructing the model, we also need to get the optimize hyperparameter with the works such as SVM or Adaboost. SageMaker provides the One-click distributed training with built in model and can train the parameters in large scale wchich will improve the speed and accuracy (more iteration).
* Deployment: It is an amazing Endpoint job which allows individual such as me, a student, to show my own work on the website. The algorithms and models such as map generator or image recoginition model can be built on the website and may be used for commericial work in the future with SageMaker.



## Research Procedure

## Research result
