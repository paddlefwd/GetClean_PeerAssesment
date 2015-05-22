library(dplyr)
# Getting and Cleaning Data - Peer Assessment

# Processes the train and test datasets to create a single summary table
# of means of each mean and stdev observation in the original dataset.
# From the assignment:
#   Part 1. - Merges the training and the test sets to create one data set.
#   Part 2. - Reduce the data to only the relevant columns (mean and std dev)
#   Part 3. - Apply descriptive names to the activities in the data set
#   Part 4. - Massage the column names to more readable values
#   Part 5. - Create a second tidy data set of means for each subject & activity
#
# Parameters:
#       None.
#
# Return:
#       The summary table of means.
#
run_analysis <- function() {
    # -------------------------------------------------------------------------
    # Part 1. - Merges the training and the test sets to create one data set.
    # -------------------------------------------------------------------------
    # read in the column names from the features text (for ease of use we will
    # put some names on the two columns)
    features <- read.csv("./data/features.txt",
                         header=FALSE, sep="", 
                         col.names=c("idx","name"),
                         stringsAsFactors=FALSE)
    
    # read in the training and test datasets
    train <- assemble_frame(read.csv("./data/train/subject_train.txt",
                                     col.names=c("Subject"),
                                     header=FALSE,sep=""),
                            read.csv("./data/train/y_train.txt", 
                                     col.names=c("Activity"),
                                     header=FALSE, sep=""),
                            read.csv("./data/train/X_train.txt",
                                     col.names=features$name,
                                     header=FALSE,sep=""))
    
    # assemble the data frame from the test data
    test <- assemble_frame(read.csv("./data/test/subject_test.txt",
                                    col.names=c("Subject"),
                                    header=FALSE,sep=""),
                           read.csv("./data/test/y_test.txt",
                                    col.names=c("Activity"),
                                    header=FALSE, sep=""),
                           read.csv("./data/test/X_test.txt",
                                    col.names=features$name,
                                    header=FALSE,sep=""))
    
    # bind the train and test frames into one big dataset
    fullset <- bind_rows(train,test)
    
    # -------------------------------------------------------------------------
    # Part 2. - Reduce the data to only the relevant columns (mean and std dev)
    # -------------------------------------------------------------------------
    # carve out the subset of data we are interested in; we need to keep the
    # "Subject" and "Activity" columns so we will name them explicitly and 
    # then we grab the columns that have "std" or "mean" in the name.
    # 
    # note that this pattern excludes the ...gravityMean columns, these are
    # using the gravityMean to normalize other values and are not means
    workingset <- fullset[,grepl("Subject|Activity|std|mean",names(fullset))]
    
    # -------------------------------------------------------------------------
    # Part 3. - Apply descriptive names to the activities in the data set
    # -------------------------------------------------------------------------
    # read in the activity label information
     activity <- read.csv("./data/activity_labels.txt",
                          header=FALSE, sep="", 
                          col.names=c("levels","labels"),
                          stringsAsFactors=FALSE)
   
    # convert the integer values 1-6 in the "Activity" column (from the y 
    # values) with the factor values created from the activity.txt description 
    workingset$Activity <- factor(workingset$Activity,
                                  levels=activity$levels,
                                  labels=activity$labels,
                                  ordered=TRUE)
    
    # -------------------------------------------------------------------------
    # Part 4. Massage the column names to more readable values
    # -------------------------------------------------------------------------
    # we extracted the original column names from the features.txt up in step
    # 1 so we are already basically set except for some aesthetic clean up to
    # make the names correspond to the original codebook features_info.txt
    # note that we omit the "-" and "()" from the original because
    
    # change all "..." into "_" (e.g. fBodyAcc.mean...Z becomes fBodyAcc.mean_Z)
    ws_names <- gsub("\\.\\.\\.","_",names(workingset))
    
    # remove all trailing ".." (e.g. fBodyAccMag.mean.. becomes fBodyAccMag.mean)
    ws_names <- gsub("\\.\\.","",ws_names)
    
    # replace any remaining "." with "_" 
    ws_names <- gsub("\\.","_",ws_names)
    
    # rename the columns with the friendlier names
    names(workingset) <- ws_names
    
    # -------------------------------------------------------------------------
    # Part 5. Create a second tidy data set of means for each subject & activity
    # -------------------------------------------------------------------------
    # group the working set by Subject and Activity and compute the mean for
    # each variable for each grouping
    # this will leave us with a smaller table of size:
    #   [(num. subjects x num. activity) x (num. variables)]
    #   or [(30 x 6) x (81)] = [180x81]
    sa_means <- group_by(workingset,Subject,Activity) %>% 
        summarise_each(funs(mean),-Subject,-Activity)
    
    # write out the table of means
    write.table(sa_means, "subject-activity_means.txt",row.names=FALSE)
    
    sa_means
} # run_analysis

# Assembles the subject, activity and observation data frames into
# one big frame for the training or test dataset by binding columns
# together. Before binding we check that the dimensions are correct.
# Note:   we expect each frame has the same number of rows so we use
#           the number of rows in the subject frame as our validation.
#
# Parameters:
#       subject     An N x 1 data.frame containing the subject ID for
#                   each observation.
#       activity    An N x 1 data.frame contaiing the activity ID for
#                   each observation.
#       obs         An N x 561 data.frame containing the raw observation
#                   data.
#
# Return: 
#    N x 563 data.frame
#
assemble_frame <- function(subject, activity, obs) {
    # check dimensions:
    # subject  N x 1 
    # activity N x 1
    # obs      N x 561
    expected_rows <- nrow(subject)
    if (ncol(subject) != 1) {
        stop(paste("subject must be an N x 1 frame. Got N x ",
                   ncol(subject)))
    }
    if ((nrow(activity) != expected_rows) | (ncol(activity) != 1))
    {
        stop(paste("activity must be an ", expected_rows ,
                   " x 1 frame. Got ", nrow(activity) ,
                   "x", ncol(activity)))
    }
    
    if ((nrow(obs) != expected_rows) | (ncol(obs) != 561))
    {
        stop(paste("observations must be an ", expected_rows ,
                   " x 561 frame. Got ", nrow(obs) ,
                   "x", ncol(obs)))
    }
    
    # bind the subject,activity and obs frames into one big N x 563 frame
    # [Subject] + [Activity] + [tBodyAcc-mean()-X, ..., angle(Z,gravityMean)]
    # ==> [Subject, Activity, tBodyAcc-mean()-X, ..., angle(Z,gravityMean)]
    frame <- bind_cols(subject,activity) %>% bind_cols(obs)

    if(ncol(frame) != 563) {
        stop(paste("Incorrect frame size. Expected 563 columns, got ", 
                   ncol(frame)))
    }
    
    frame
} # assemble_frame
