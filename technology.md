# Technologies Used

## Data Cleaning and Analysis
Pandas has been used to clean the data and perform an exploratory analysis. Along with pandas, the datetime library as well as numpy were loaded for the cleaning and exploratory analysis.  The group tried to use a new library that was not covered during class called geopy.  The dataset contained information about the latitude and longitude for each crime reported.  The team looked to put together a function to turn the latitude and longitude data into a zip code for each crime.  The team was successful in creating a working function.  However, the geopy service is free and isn't meant for bulk api requests.  The team was able to gather around 9,000 zip codes but requesting more than 1500 requests at a time would lead to timeout errors.  The dataset has over a million rows of data so the team decided there would not be sufficient time to gather zip codes for all crimes.  Further analysis will be completed using Python.

## Database Storage
We plan to use AWS to store the dataset and connect with pgadmin from there to further transform the data for visualization.

## Machine Learning
SciKitLearn is the ML library we'll be using to create a classifier. We are using the RandomForestClassifier model. 

## Dashboard
Our group plans to work with Tableauto create a fully functioning and interactive dashboard. 
