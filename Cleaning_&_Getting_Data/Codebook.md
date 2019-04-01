# Codebook

The contents of the datafile includes a training set and a test set. The `x_train.txt` and `x_test.txt` feature data files contain the variables measured in the data with variable names derived from the `features.txt` file. The outcomes of each observation can be found in the `y_train.txt` and `y_test.txt` activity files with result names deriving from `activity_labels.txt`. Finaly, we have the `subject_test.txt` and `subject_train.txt` datafiles which contains the subject number in which an observation is made from.

In the R script `run_analysis.R`, the features datafiles, activity datafiles and subject datafiles are binded in order to create `x_data`, `y_data` and `subject_data`. Names are then appended to the new datafiles before being binded together to create the final tidy `data_set`. Afteerwards, `tidydataset.txt` is created using the previous `data_set` by summarizing the dataframe to take the column means of each relevant variable.
