## GCD Readme

The goal for the uploaded code is to prepare tidy data that can be used for later analysis. This data is obtained from the Samsung Galaxy S smartphone. Let's give some background in the data:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity data at a constant rate of 50Hz is captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The assignment consisted of five parts.

1. Merging the training and the test sets to create one data set. This is done by copying necessary folder content
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Descriptive activity names are used to name the activities in the data set
4. Appropriately labeling the data set with descriptive variable names.
5. From the data set in step 4, a second, independent tidy data set with the average of each variable for each activity and each subject is created. 
This means that for all relevant quantities 180 rows of data is obtained, as there are 30 people, all of which have performed six actions.
 

The activities in the vector c(1, 2, 3, 4, 5, 6) correspond to the activities in the vector
c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING").

The code consists of the following parts
- First 30 lines: Copying necessary files from the extracted folder (This part is not necessary of extracting is done manually)
- Lines 30-47: Merging data
- Lines 50-55: Extracting only mean, std by using the function grepl
- Lines 58-65: Double for loop, to sort data to activity and subject_id
- The rest is the combining of data and reading it to txt

### Deeper background in the files

The following files were provided

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.



