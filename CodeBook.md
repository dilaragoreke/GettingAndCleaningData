# CodeBook for TidyData 
This is the codebook for the tidy data produced by run_analysis.R script 

# Input Variables

 - X_train       - obtained from X_train.txt file.
 - Y_train       - obtained from y_train.txt file. 
 - Subject_train - obtained from subject_train.txt file. There are 30 subjects recorded.
 - X_test        - obtained from X_test.txt file
 - Y_test        - obtained from y_test.txt file
 - Subject_test  - obtained from subject_test.txt file. There are 30 subjects recorded.

- activity_labels - obtained from activity_labels.txt file. 
There are 6 activity types labeled as: 1-WALKING, 2-WALKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING
- features        - obtained from features.txt file. There are 561 features that comes from the accelerometer and gyroscope 3-axial raw signals.

# Post processing

- col_labels        - setting column names in Subject, Activity, Features order
- merged_dataset    - merging train and test dataset individually with the col_labels order using cbind(column-wise) and then merging train and test dataset using rbind (row-wise)
- dataset_mean_std  - extracting variable that contain mean and std in colnames using grepl function
- tidy_data         - contains value for each variable of each activity, formed by reshaping data_set_mean_std using melt function
- tidy_data_mean    - contains average value of each variable for each activity, formed by using dcast function

