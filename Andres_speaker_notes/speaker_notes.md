# Slide 1

We chose supervised model 
•	Bc we already know what we are looking for (character of supervised modeling)

Looking to use model to determine if there was an arrest or not depending on the characteristic of the crime, location, and time.

Tried undersampling vs randomforest

Undersampling was attempted for its abaility to handle imbalanced data

RandomForest chosen bc:
•	Resistant to overfitting 
•	Good to run on large datasets
•	Resistant to outliers

Unnessary Columns such as id number were dropped

To optimize futher, it was first ran with the ranking function implemented
    * the features that ranked low, deemed insignificant, were than dropped

# Slide 2

This shows the final features that made it into the model.

As you can see, 'primary type' was the highest ranking, and 'district' being the lowest.

Prior to these final features, there were more features and used this ranking function to deleted the less relevent ones.


# Slide 3

High precision for arrest and non-arrest.

High recall for non-arrest but moderate for arrest.

Accuracy 87.5%, high accuracy shows that this is a good model.