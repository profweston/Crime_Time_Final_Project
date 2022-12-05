
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

The data were further preprocessed in preparation to build the machine learning model. This meant dropping columns that provided no benefits to the machine learning. For example, “ID” and “Case Number” were a way to identify the crime and thus provided nothing meaningful to the model. Furthermore, some data required encoding so that the data were numbers and not words. In order to do this, the LabelEncoder() function was used on the “Primary Type” column. This changed the column value, such as “THEFT” to a number “33”. The “time_binned” column was created by extracting the hour from the time portion of the “Date” column by importing datetime with the code and then binning the newly created “Hour” column. Lastly, the month column was extracted from the date column.

 <img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/datetime.png" width="800">

 <img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/bins.png" width="800">
 

### Creation of AWS Database

A database was initially created using Postgres via pdAmin. Two tables were created from the raw data and merged to make the final data file used for data analysis. 

 <img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/inner_join.png" width="400">

The Entity Relational Diagram (ERD) displays the relationship among the tables. 

 <img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/Crime_time_ERD.png" width="800">

The database was ultimately hosted by AWS to ensure access by all team members. The pgAdmin database was connected to AWS by creating an AWS server within pdAdmin. The database was also connected to Jupyter Notebook using SQLAlchemy and creating an engine. This connection is represented in the code below.

<img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/Connection.png" width="400">


### Machine Learning Model

The machine learning model used is the RandomForestClassifier. We chose a supervised learning model because we are attempting to predict arrests based on data from previous arrests. This machine learning model is a type of ensemble learning, meaning that many different types of weaker algorithms are taken into account to create a better algorithm that will provide better results overall in accuracy with a decrease in variance. The RandomForestClassifier model starts by creating several small and simple decision trees that are built from a random set of features. This model then takes these features and proceeds to combine them into a larger more complex decision tree that will be the final product.

**_Target and Feature Variables:_** Our target variable is whether an arrest is made. In order to determine less obvious features to take out, we implemented the RandomForestClassifier’s ability to rank the features.

 <img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/Features.png" width="800">

After running it the first time with the more obvious features dropped first, the ranked features appeared and the lesser ranked features were dropped.

**_Training and Testing Sets:_** When splitting the dataset to training and testing sets, the train_test_split function was used. Unfortunately, when performed on the entire dataset, a memery error occurred. Thus, the train_size parameter was added in order to ease the computational power that was done when training the dataset. The final code is displayed below:

 <img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/Training.png" width="800">

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

An interactive dashboard was created in Tableau that will be used during a presentation to government officials in Chicago.  The goal was to provide the following data on the dashboard:
 
* Results from the Machine Learning Model analysis
 
* A bubble chart to show the most common types of crimes.
* A bar chart to show the arrest rates by the type of crime.
* A heat map that shows crimes by district that can be filtered by the type of crime, year, and whether or not an arrest was made.   
* A chart to show the trends over time for each district that can be filtered by the type of crime. 
* A line chart to show the times that crimes are committed and filtered by whether or not an arrest was made.

Each of these visualizations is discussed in the results section.

Link to Tableau Dashboard: [Link](https://public.tableau.com/app/profile/melissa.weston.puett/viz/Crime_Time_16696811776780/CrimeTime?publish=yes)
 
## Results

### Machine Learning Model 
Our goal was to be able to accurately predict if an arrest is made according to type of crime and the time and location of which the crime is committed. After using the Random Forest Classifier to predict our target based on relative features, our accuracy score is 87.5%. This means that the model correctly predicted the arrest for 87.5% of the crimes.  Acccording to our classification report, the precision for prediction of the arrests and nonarrests are in line with each other.  However, the recall (sensitivity) for predicting no arrest is much lower than for predicting arrest.  This measure indicates the correct positive predictions relative to the total actual positives. The average F-1 score of 0.78 indicates that there is a fairly high balance between recall and precision. Thus, as the model is now, it is marginally successful at predicting whether an arrest is made. Even if the accuracy score could be better, the confusion matrix indicates the model is performing well finding the positive true arrests (true positive) and the negative nonarrests (true negative).

Slight improvements were been made to the model from the original. The month the crimes were committed was added to the list of features the model uses. This change gave the same accuracy score but it increased the precision of arrested from 75% to 82% with a small cost (2% change at most) in precision not arrested and each of the recall values. In addition to this, when the features are ranked by importance, the 'Month' feature was determined be a relevancy of 10%. This was determined to be a general better improvement on the previous model because of a boost in one of precision categories with equivalent results in the other ones.

 <img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/confusion.png" width="800">
 
### Most Common Crimes

The bubble chart below shows the distribution of the types of crimes committed in Chicago. Based on our results, the most common crime committed in Chicago is theft followed closely by battery and criminal damage. 

 <img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/bubble.png" width="800">
  
### Arrest Rates 

The bar chart below shows the proportion of arrests to nonarrests for the most frequent types of crime. Although theft is a much more common crime, the proportion of arrests is lower than some of the other crimes. Interestingly, some crimes have a high arrest rate, but on closer inspection, these offenses do not involve a crime against another person. Thus, this result in not surprising.

 <img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/Arrest_count.png" width="800">

### Crime by Time

The line graph below shows the amount of arrests made or not made by the hours in a day.

 <img src="https://github.com/profweston/Crime_Time_Final_Project/blob/randy2-branch/Resources/Crime_hour.png" width="800">

### Crime by District and Quarter

The following graph shows the two highest crime total categories broken out by district to identify which districts are experiencing the highest amounts of crime.

<img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/christmas_bar.png" width="800">

### Arrest Rate by District

The heatmap belows show the arrest rate for District 1. This graph is interactive and the district can be changed in order to see how districts are performing individually.

 <img src="https://github.com/profweston/Crime_Time_Final_Project/blob/main/Resources/district.png" width="800">
  
## Summary

 
## Recommendations 



