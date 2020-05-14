The Datasets were loaded and saved in 6 variables 
s_train,y_train,X_train
s_test,y_test,X_test

the train datasets were column binded into one train dataset
the test datasets were column binded into one train dataset

Afterwards the resulting train and test dataset were rowbinded into one single dataset

The columns names were then added using the feature file.
The original columns were not modified since it was descriptive enough as it was,

the target and the subject columns were renamed as Activities and subjects respectively

The Activities values were then renamed from 1,2 and so on to WALKING, WALKING_UPSTAIRS, and so on 

The Subject values were also renamed from 1,2 and so on to person1, person2 and so on

Then regular expression was used to keep the columns which contained only the mean and standard deviation

Finally the dataframe was grouped by 