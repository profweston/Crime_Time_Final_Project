
## Project Overview

The City of Chicago has a long history of crime. The overall crime rate is higher than that of the national average. In fact, the chance of becoming a victim of either a violent crime or property crime in Chicago is 1 in 28 [(Reference)](https://www.neighborhoodscout.com/il/chicago/crime#description).  Unfortunately, many crimes reported do not result in an arrest. This project examines crime data reported in the city of Chicago from 2010 to present to determine if an arrest for a crime can be predicted based on location, time, and crime perpetrated.

## Reason

Several members of the team expressed an interested in researching in the broad area of crime. We discussed several options for locations and eventually settled on Chicago. When looking at the data file, we observed that there are many crimes reported that result in no arrests. Thus, we decided to try to build a machine learning model that can be used to predict arrest rate based on location, time, and/or type of crime committed.

## Team Members

Randy Melancon [branch](https://github.com/profweston/Crime_Time_Final_Project/tree/randys-branch)\
Matthew Parrish [branch](https://github.com/profweston/Crime_Time_Final_Project/tree/mparrish)\
Jarod Peters [branch](https://github.com/profweston/Crime_Time_Final_Project/tree/jarodpeters)\
Andres Rosas [branch](https://github.com/profweston/Crime_Time_Final_Project/tree/andres)\
Melissa Weston-Puett [branch](https://github.com/profweston/Crime_Time_Final_Project/tree/mels-branch)

## Data Source and Preprocessing

The data for this project was retrieved from Data.gov and was published by The City of Chicago. There were # crimes reported and includes information about X. Data were filtered or dropped during the preprocessing with Pandas using the following criteria:

1. Data were filtered by date to include years 2015 and forward.
2. Rows including NaNs and empty cells were deleted.
3. Columns not contributing to our data inquiry were dropped.
4. 

## Database



## Machine Learning Model
Our provisional Machine Learning Model is the Random Forest Classifier. We chose a supervised learning model because we are attempting to predict arrests based on data from previous arrests. Since our target variable only has two possible values (True or False), it is a classification model. The Random Forest Classifier is beneficial because it is robust against overfitting, can handle many input variables without variable deletion, and can run efficiently on our large dataset.



## Results

## Tableau Interactive Dashboard
1. Results from the Machine Learning Model analysis
2. Heat map filtered by district
3. Heat map filtered by types of crime
4. Arrest rate by type of crime (Area chart?)
5. Histogram of crime by time bins


## Summary

Google slide link: https://docs.google.com/presentation/d/1DseX3fkHr9eO4vOe5xpPTRBj4CqlGOkHm0cAmxP43Nk/edit?usp=share_link
