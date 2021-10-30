## Dataset Used
[SARS-COV-2 Ct-Scan Dataset](https://www.kaggle.com/plameneduardo/sarscov2-ctscan-dataset)
I am not tracking the dataset in this repository.
For a comfortable run of every script, one must download the dataset separately and place it the root directory by renaming it as "covidDataset".

## Navigating throught the directory structure
+ Each Directory is indepenedent.
+ Scripts inside imageFeature, imageMasking are also independent.
+ In the imagePreProcessing directory, the main imports all the other functionalities. so the executing the main.m file will do.

## Summary
### Pre-processing
+ Histogram Equalisation doesn't work fine (imageMasking/imagemask2.m).
+ Thresholding to get the lung mask so as to segment lung from CT scan didn't help much cause the mask was never perfect and much of the information was lost(imageMasking/preprocessing.m).
+ Trying Gabor filter and then using kmeans to segment lungs could be success, but I am not able to do it correctly as of now(imageMasking/gabor_kmeans.m)
+ Using the funtion getImageArray() in the imagePreProcessing dir, images were collected into an array for further procesing.
+ The only preprocessing step I have applied so far that enhences the image content is adjusting the intesity levels of the image. In the imagePreProcessing/main.m implementation of the same can be viewed directly but only after doing what's said in the section **Dataset Used**.

### Image Features
+ All the features can be viewed under the imageFeatures dir
+ FAST BRISK and HOG features were implemented.
+ HOG features was found important so I decided to implement I from scratch. Well I am stuck in the part where I need to find 9 point histogram but that won't last for 2 more days.
