## Preliminary data preprocessing, Feature Engineering and Selection
Prior to the machine learning, the data needed to preprocessed. This meant dropping columns that provided no benefits to the machine learning. A few examples of the columns that provided nothing to the machine learning is “ID” and “Case Number”; these columns are nothing more than a way to identify the crime. There is no repetitiveness to them or way to predict if there was an arrest based on this information alone so it could safely be taken out. Besides this, some data needed to be encoded so that the data was numbers, not words; in order to do this, the LabelEncoder() function was used on the “Primary Type” column. Which would change the column value, such as “THEFT” to a number “33”. Lastly, the “time_binned” column was created by extracting the hour from the hour from the “Date” column by importing datetime with the code ``` cleaned_crime_df["Hour"] = pd.to_datetime(cleaned_crime_df["Date"]).dt.hour``` (with datetime as dt) and then binning the newly created “Hour” column. The “Date” column was then dropped, seeing that it was not needed any longer.

 
In order to determine less obvious features to take out the code ``` sorted(zip(rf_model.feature_importances_, X.columns), reverse=True)``` was used to implement the RandomForestClassifier’s ability to rank the features in its ability to use the feature in the machine learning model. After running it the first time with the more obvious features dropped first, the ranked features appeared and then proceeded to drop the lesser ranked features. 
description of how data was split into training and testing sets
When splitting the dataset to training and testing sets, the train_test_split function was used as ```X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=78)``` but when performed on the entire dataset, a memery error occurred. The train_size parameter was added in order to ease the computational power that was done when training the dataset. Thus, the final code to split the dataset is ``` X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=78, train_size=0.25)```.

## Benefits & Limits

The model used in the machine learning is the RandomForestClassifier. This machine learning model is a type of ensemble learning, meaning that many different types of weaker algorithms are taken into account to create a better algorithm that will provide better results overall in accuracy with a decrease in variance.  

The RandomForestClassifier model starts by create several small and simple decision trees that are built from a random set of features. This model then takes these features and then proceed to combine them into a larger more complex decision tree that will be the final product. 

The RandomForestClassifier has many benefits that suit the needs of the crime dataset that was chosen.
These benefits are:

* It has resistance against overfitting. With the dataset being so large, this could be a potential issue, so using this model will be effective against it. 
* It can be used to rank the features that will not be useful to the machine learning model. The dataset has many features with some being obvious that will be no use to the model. This function will allow to get rid of unnecessary features not needed that are less obvious.
* It has resistance to outliers. With such a large dataset, outliers are unavoidable; to be resistance to outliers will be a great addition to the machine learning to provide better model.
* This model also runs good on large dataset. As stated, prior, the dataset used is very large; to have a model that runs well on a larger dataset will be ideal.

However, despite these numerous benefits there are drawbacks to this model; one drawback is that the model is not easy to explain.  Because of the complexity of the model, the reason why it works well, make it difficult to interpret. With so much information and decision trees created and combined, the end results inevitable becomes complex.  Also, the model also can be computationally heavy; as stated earlier, a memory error occurred when running the model because the computer could not handle the processing.
 
