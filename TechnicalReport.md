# Build a Machine Learning Model by SageMaker

> Today I will talk about Amazon Sagemaker - a fully-managed machine learning service (announced in Nov 2017) and will mainly focus on two point: why we need it and how it works.

## What I care most?
Machine learning is a method of data analysis that automates analytical model building and it is become more and more popular in recent years. Nowadays, even my own laptop can build and train some simple machine learning models such as MLP and SVM. However, when dealing with deep neural networks, real time streaming processing or large bunch of data, it will kill lots of time and make my laptop crashed.  
  
To solve this problem, I would like to use some distributed system techniques like EC2 Instance for computing, S3 for storage and Microservices for deployment but it is still a hard work to organize all of it.  
  
Fortunately, Amazon provides us a solution SageMaker combining all of these techniques and optimizing in each step.

## SageMaker Components
> Amazon SageMaker is a fully managed service for machine learning which includes the processes of data preparing, model training and model deployment. 
* Build (data preparing): SageMaker supports Jupyter notebook and allows you to transform data and connect to other AWS services such as S3 in this part. 
* Train (tune): In machine learning, after constructing the model, we also need to get the optimize hyperparameter with the works such as SVM or Adaboost. SageMaker provides the One-click distributed training with built-in model and can train the parameters in large scale which will improve the speed and accuracy (more iteration).
* Deployment: It is an amazing Endpoint job which allows individual such as me, a student, to show my own work such as map generator and image recognition model on the website and may allows me to apply it for commercial use in the future.

## SageMaker Procedure
> The data preprocessing parts such as labeling are well defined by Amazon SageMaker. Nevertheless, it is more like a repetition laboured work such as human image classification, handwork bounding box drawing and so on.  

> Create a Jupyter Notebook Instance

![](https://github.com/unlimitediw/DistributedSystemLearn/blob/master/Image/6myInstance.PNG)
* After instance created, you can choose the built-in notebook environment such as the Sparkmagic for streaming data processing or my most love one, the conda tensorflow which work very well in the convolutional neural network training.
![](https://github.com/unlimitediw/DistributedSystemLearn/blob/master/Image/6sparkenv.PNG)  ![](https://github.com/unlimitediw/DistributedSystemLearn/blob/master/Image/6tensorenv.PNG)
* Now we can edit and build our own machine learning model on Jupyter Notebook (build in SageMaker notebook). The highlight of it I believe is that I do not need to worry about the problem of environment setting (due to Amazon familiars with their machine, they are more easy to apply environment on their hardware than us) and many open-source algorithm is built by amazon machine learning experts which can be easily modified and directly used on the SageMaker Notebook Instance.
![](https://github.com/unlimitediw/DistributedSystemLearn/blob/master/Image/6notebookedit.PNG)
> Train the model built in the Jupyter Notebook Instance.
* After training, we will get the model as follow. I am a little bit disappoint in this part since there is no to much difference with the training process on my own laptop. However, Amazon Segamaker will provide the log file of training to you which is helpful (in this model, it provides the xgboost prunning details for the decision tree model).
![](https://github.com/unlimitediw/DistributedSystemLearn/blob/master/Image/6sagemaker_train.PNG)
* The trained model is also saved in the instance  
![](https://github.com/unlimitediw/DistributedSystemLearn/blob/master/Image/6mymodel.PNG)

> Create the Endpoint
* Create the endpoint by the API ```sm.create_endpoint(EndpointName = endpoint_name, EndpointConfigName = endpoint_config_name)```
* Deploy the model by  ```xgb_predictor = xgb.deploy(initial_instance_count=1, instance_type='ml.t2.medium')```
* After this, we can find the endpoint at the Endpoint configuration section
![](https://github.com/unlimitediw/DistributedSystemLearn/blob/master/Image/6endpointConfig.PNG)
* This is the endpoint details
![](https://github.com/unlimitediw/DistributedSystemLearn/blob/master/Image/6endpointdetails.PNG)

## More concept
> 

## Future Development

## Summary
> In a view of a 
