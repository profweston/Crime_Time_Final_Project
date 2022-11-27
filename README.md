
## Project Overview

The City of Chicago has a long history of crime. The overall crime rate is higher than that of the national average. In fact, the chance of becoming a victim of either a violent crime or property crime in Chicago is 1 in 28 [(Reference)](https://www.neighborhoodscout.com/il/chicago/crime#description).  Unfortunately, many crimes reported do not result in an arrest. This project examines crime data reported in the city of Chicago from 2015 to present to determine if an arrest for a crime can be predicted based on location, time, and crime perpetrated.

More information can be found in our Google slides: [Slides](https://docs.google.com/presentation/d/1aL27DWHeShtGu0Y2L8k9DK4RNyBFMVQTkkwG990Ahz0/edit?usp=sharing)


## Reason

Several members of the team expressed an interested in researching the broad area of crime. We discussed several options for locations and eventually settled on Chicago. When looking at the data file, we observed that there are many crimes reported that result in no arrests. Thus, we decided to see what insights could be garnered from further investigation of the data.

## Questions

1. Can a machine learning model be used to predict arrest rate based on location, time and type of crime committed?
2. What are the most common crimes committed in Chicago?
3. How does arrest rate differ by type of crime?
4. How does crime differ by districts?
5. What time is more common for crimes to be committed?

## Team Members

Randy Melancon [branch](https://github.com/profweston/Crime_Time_Final_Project/tree/randys-branch)\
Matthew Parrish [branch](https://github.com/profweston/Crime_Time_Final_Project/tree/mparrish)\
Jarod Peters [branch](https://github.com/profweston/Crime_Time_Final_Project/tree/jarodpeters)\
Andres Rosas [branch](https://github.com/profweston/Crime_Time_Final_Project/tree/andres)\
Melissa Weston-Puett [branch](https://github.com/profweston/Crime_Time_Final_Project/tree/mels-branch)

## Project Steps

This flowchart indicates the steps taken to complete the project. A summary of each step follows.
![Flowchart](/Resources/updated_flowchart.png)

### Data Source

The data for this project were retrieved from Data.gov and was published by The City of Chicago. [(Data Link)](https://catalog.data.gov/dataset/crimes-2001-to-present). 

### Data Preprocessing

Data were filtered or dropped initially with Pandas using the following criteria:

1. Data were filtered by date to include years 2015 and forward.
2. Rows including NaNs and empty cells were deleted.
3. Columns not contributing to our data inquiry were dropped.

The data were further preprocessed in preparation to build the machine learning model. This meant dropping columns that provided no benefits to the machine learning. For example, “ID” and “Case Number” were a way to identify the crime and thus provided nothing meaningful to the model. Furthermore, some data required encoding so that the data were numbers and not words. In order to do this, the LabelEncoder() function was used on the “Primary Type” column. This changed the column value, such as “THEFT” to a number “33”. The “time_binned” column was created by extracting the hour from the time portion of the “Date” column by importing datetime with the code and then binning the newly created “Hour” column.

 ![Code for datetime](/Resources/datetime.png)

 ![Code for time bins](/Resources/bins.png)
 
Lastly, the month column was extracted from the date column.

### Creation of AWS Database

A database was initially created using Postgres. Two tables were created and merged to make the final data file used for data analysis. 

![Schema for Joining](/Resources/Schema.png)

The ERD displays the relationship among the tables. 

![Relational Diagram](/Resources/Crime_time_ERD.png)

Note: Discuss linking this to AWS when complete - example code below

![Connection String to AWS](/Resources/Connection.png)

### Machine Learning Model

The machine learning model used is the RandomForestClassifier. We chose a supervised learning model because we are attempting to predict arrests based on data from previous arrests. This machine learning model is a type of ensemble learning, meaning that many different types of weaker algorithms are taken into account to create a better algorithm that will provide better results overall in accuracy with a decrease in variance. The RandomForestClassifier model starts by creating several small and simple decision trees that are built from a random set of features. This model then takes these features and then proceed to combine them into a larger more complex decision tree that will be the final product.

**_Target and Feature Variables:_** Our target variable is whether an arrest is made. In order to determine less obvious features to take out, we implemented the RandomForestClassifier’s ability to rank the features.

![Code for feature priority](/Resources/Features.png)

After running it the first time with the more obvious features dropped first, the ranked features appeared and the lesser ranked features were dropped.

**_Training and Testing Sets:_** When splitting the dataset to training and testing sets, the train_test_split function was used. Unfortunately, when performed on the entire dataset, a memery error occurred. Thus, the train_size parameter was added in order to ease the computational power that was done when training the dataset. The final code is displayed below:

![Code for training](/Resources/Training.png)

**_Benefits and Limitations:_** The model used in the machine learning is the RandomForestClassifier. This model starts by creating several small and simple decision trees that are built from a random set of features. This model then takes these features and then proceed to combine them into a larger more complex decision tree that will be the final product.
 
The RandomForestClassifier has many benefits that suit the needs of the crime dataset that was chosen. These benefits are:
 
* It has resistance against overfitting. With the dataset having over a million rows, this could be a potential issue, so using this model will be effective against it.
* It can be used to rank the features that will not be useful to the machine learning model. The dataset has many features with some being obvious that will be no use to the model. This function will allow us to get rid of unnecessary features not needed.
* It has resistance to outliers. With such a large dataset, outliers are unavoidable so this resistance is a nice asset.
* This model also runs good on large dataset. As previously stated, this dataset is very large, so to have a model that runs well on a larger dataset will be ideal.
 
However, despite these numerous benefits there are drawbacks to this model.
* The model is not easy to explain. Because of the complexity of the model it can make it difficult to interpret the results. . With so much information and decision trees created and combined, the end results inevitably becomes complex. 
* The model also can be computationally heavy. As stated earlier, a memory error occurred when running the model because the computer could not handle the processing.

### Tableau Interactive Dashboard 

The team is working to create an interactive dashboard in Tableau that will be used during a presentation to government officials in Chicago.  The goal is to provide the following data on the dashboard:
 
* Results from the Machine Learning Model analysis (TBD)
 
* A bubble chart to show the types of crimes that can be filtered by district or year.
  
  ![Most Common Types of Crime](/Resources/Bubble.png)
  
* A heat map that shows crimes by district that can be filtered by the type of crime, year, and whether or not an arrest was made.
  
  ![Crime by District](/Resources/District.png)
    
* A bar chart to show the arrest rates filtered by year and type of crime.
  
  ![Arrests rates](/Resources/Arrests.png)
  
* A chart to show the trends over time for each district that can be filtered by the type of crime. (TBD)
  
* A line chart to show the times that crimes are committed and filtered by whether or not an arrest was made. (TBD)

The group will then present a recommendation to the city council based on the results of the data analysis.


 
 
## Results

## Summary
 
## Recommendations 



