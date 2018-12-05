
# Introduction

Are you tired of your job?  Do you want to be filthy, filthy rich?  Well, I do.  And today we're going to look at a way to everage your ML knowledge, as well as the wide availability of big data cloud infrastructure, to make this dream happen.  

In short, we are going to build Skynet for Stocks.

But, really, we are going to be using the AWS Sagemaker platform and some free Stock APIs to build a model capable of predicting stock price movement.

# Background

## Stocks

Stocks.  What are stocks?  Well, they are probably the easiest way to build wealth.  Stocks represent a share of a company.  If a company does really great things, typically that would result in the company being worth more money, and hence every share of that company increasing.  And, obviously, the opposite is true as well.  

But - stock values fluctuate sometimes WILDLY from day-to-day, hour-to-hour, even second-to-second.  And these flucations aren't due to the second-to-second performance of the employees at Apple.  No, they are the result of many variables from news articles to tweets to celestial phenomena.  That being said, because of these flucations in value, there is always money to be made.  If we knew with relatively high probability that in 30 minutes, the stock price would be 1 cent higher then it is currently, you could make lots of money.

## Machine Learning
Machine Learning.  What is machine learning?  Well, it's magic.  Atleast for the purposes of this article.  Writing machine learning algorithms, training, testing, can all be a daunting task.  Luckily, Amazon came to the rescue with their platform AWS Sagemaker.  Sagemaker is a ML platform built inside AWS that allows for quick and easy generation of ML models.

## AWS Sagemaker

TODO sagemaker description

# Dataset

First, we need a training dataset.  Now, we could use some large open source historic datasets of stock movement, but that is not very exciting.  Ideally, we want to use some data source which we can get both historical, and real time stock price data.  This way, we can train our model, and test it against real time data!

For no particular reason, I chose to use the Alpha Vantage free API service (https://www.alphavantage.co/documentation/). There are many of these stock APIs available all offering different value at different price points.  If you get really into this, maybe you would want to pay for this service.  For the purposes of this tutorial, this free service will be sufficient. You will need to sign up and get an API key, and then usage is simple.  Here is an example cURL command for the Apple stock ticker data for a day TODO.
``` curl https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&apikey=<API_KEY> ```

Sample Output: 
```
{
    "Meta Data": {
        "1. Information": "Daily Prices (open, high, low, close) and Volumes",
        "2. Symbol": "MSFT",
        "3. Last Refreshed": "2018-12-04",
        "4. Output Size": "Compact",
        "5. Time Zone": "US/Eastern"
    },
    "Time Series (Daily)": {
        "2018-12-04": {
            "1. open": "111.9400",
            "2. high": "112.6373",
            "3. low": "108.2115",
            "4. close": "108.5200",
            "5. volume": "44571989"
        },
        "2018-12-03": {
            "1. open": "113.0000",
            "2. high": "113.4200",
            "3. low": "110.7300",
            "4. close": "112.0900",
            "5. volume": "34732772"
        },
        ...
    }
}
```

Now that we know we have a way to build a dataset, let's jump into Sagemaker.  As mentioned previously, Sagemaker provides a very friendly Jupyter environment where we can generate and preprocess our data directly on AWS infrastructure, rather than downloading it to our local computer first.

# Make some Sage

TODO this will be bulk of tut
walk through sagemaker setup notebook creation
download some data for a ticker, preprocess, upload to S3 bucket
createa  model, training job, evaluation
maybe, show real time prediction.  write a little script to poll Alpha API and call our model endpoint.
done


# Profit
