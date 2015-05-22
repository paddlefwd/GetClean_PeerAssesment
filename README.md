## Introduction



#### R and Package versions:
R version 3.1.2 (2014-10-31)

dplyr version 0.4.1

#### Directory Structure
Software assumes a directory structure similar to the original dataset release with a *data* directory under the working directory with separate *train* and *test* directories hanging off the *data* directory.


#### Reading and Merging Raw Data Files
There are a number of files in the _data_, _train_ and _test_ directories that are used to reconstitute a complete data set:

* **feature.txt**   - a 2 x 561 matrix that contains an index and feature name for each variable of an individual observation
* **activity.txt**   - descriptive list of the categories of activity subjects perform
* **subject_(train|test).txt**   - an _N_ x 1 vector of containing the ID of the subject performing the activity
* **y_(train|test).txt**   - an _N_ x 1 vector of the activity being performed (as an integer mapped back to categories defined in activity.txt)
* **X_(train|test).txt**   - is an _N_ x 561 matrix of observations of a subject/activity pair


Note: _N_ indicates the number of observations (rows) in the subject_(train|test).txt, y_(train|test).txt and X_(train|test).txt files.


The feature.txt file is read into a 561 x 2 dataframe given column names "idx" and "names". The "names"" column will be used to name columns when reading in the X data. The "idx" column is unused.


The X_(train/text).txt file is read into an _N_ x 561 data frame using the feature "names" above as column names. The y_(train|test) is read into an _N_ x 1 data frame using the column name "Activity". The subject_(train|test).txt file is read into an _N_ x 1 data frame using the column name "Subject".

Once we have all the individual pieces for the train|test set the subject, activity and data are bound together column-wise to form a complete, full-width portion. Once both the train and test portions have been assembled, the two portions are bound row-wise to give the data set its' full height as well.  


The full reconstituted set looks like:
```
   +- subject id from subject_(train/test).txt (column name is "Subject")
   |
   |         + activity from y_(train/test).txt (column name is "Activity")
   |         |
   |         |            +--- Column names from names in feature.txt
   V         V            V
|Subject| |Activity|  [feature name 1 ...        561 ]
+-------+ +--------+  +---                        ---+        
|       | |        |  |     ...                      |
|   .   | |    .   |  | N rows x 561 columns of data |
|   .   | |    .   |  |  from X_(train/test).txt     |
|       | |        |  |   ...                        |
+-------+ +--------+  +---                        ---+
```


Once the individual train and test frames have been assembled they are combined into a consolidated (_N_^train^ + _N_^test^) x 563 table.


#### Extract the subset of desired columns.

The subset of coulmns we are interested in is located using "Subject|Activity|std|mean" as a pattern to *grepl* to create a logical vector containing the indices of the columns contaiing means or std. dev. for various measurments. Note that this filter intentionally excludes the columns normalizing observations using the gravity mean.


This filter matches a total of 79/561 variables in the full data set, plus the two identifier columns for subject and activity so the subset is reduced to an (_N_^train^ + _N_^test^) x 81 table.


#### Label the activities with human-readable labels.

The activity values from the y_(train/test) data were originally read in as integers. We use the factor mapping provided in activity.txt to convert the column to a factor using the level and labels from this file.


#### Appropriately label the remaining dataset variables.

We used the feature names provided in the feature.txt file to name the columns when the X_(train/test).txt files were read. However, the format used in feature.txt included characters '-','(', and ')' which are not valid in column names in R. These characters are each replaced with a '.'. 


The three patterns we will clean up are:

* "()-"   used to indicate functions with separate triaxial attributes (i.e ...mean()-X etc)
* "()"    used with functions on non-axial attributes
* "-"     used to separate attributes from the associated function (mean/std)

The first and third cases are replaced with a single underscore '_'. The second case only occurs at the end of the name and so is removed.

#### Create a tidy subset of the mean of each variable for each subject/activity pair.
One could make a case for a tall tidy format however I feel that it would be counter-intuitive given the way that I did the processing in the first 4 steps. So, wide format it is. 

I think that this lends itself nicely to these observations; we have the first two columns that immediately indicate what data we have in every row and then the specific variables in an individual column. 

The final summary table is laid out with the subject and activity in column 1 and 2 followed by the mean for each included variable.
```
[Subject, Activity, tBodyAcc_mean_X, ... ,fBodyBodyGyroJerkMag_meanFreq]
[    1    WALKING   ...                                                ]
[    1    WALKING_UPSTAIRS   ...                                       ]
  ...
[   30    LAYING ...                                                   ]
```

See the [code book](CodeBook.md) for a description of individual columns in the summary file.
