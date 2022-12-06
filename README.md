# Crime_Time_Final_Project

## Slideshow
https://docs.google.com/presentation/d/1aL27DWHeShtGu0Y2L8k9DK4RNyBFMVQTkkwG990Ahz0/edit#slide=id.gc6f9e470d_0_24


## Tableau Presentation
https://public.tableau.com/app/profile/melissa.weston.puett/viz/Crime_Time_16696811776780/Presentation


## Slideshow Speaking Notes
Pre-Process: Used pandas and jupyter notebook to clean the data and remove anything that was not useful to our analysis
Database: A database was initially created using Postgres via pdAmin. Two tables were created from the raw data and merged to
make the final data file used for data analysis
Machine Learning: We chose a supervised learning model because we are attempting to predict arrests based on data from previous arrests. 

1A.Dropped years before 2015 so that we had a easier time working w/ the RAW data
2A.Removed Data that had missing values to make the data reliable
3A&1B.Dropped extra columns like the beat, IUCR, FBI code, etc.
2B. Changed the variable types to numeric values so that the machine learning model could run smoothly
3B.binned the time columns into hours to break the days up and show if certain hours are more likely to have a certain crime occur
4B.binned the date columns into months to break the year up and show if certain quarters are more likely to have a certain crime occur

