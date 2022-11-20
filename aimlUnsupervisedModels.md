# Unsupervised Types
Typically, unsupervised algorithms make inferences from datasets using only input vectors without referring to known, or labelled, outcomes.

## K-means clustering 
One of the simplest and most popular unsupervised machine learning algorithms.


### Objective 
K-means is simple: group similar data points together and discover underlying patterns. 
To achieve this objective, K-means looks for a fixed number (k) of clusters in a dataset.”

### Pick optimal # of clusters (k)
The elbow method says we should pick k where increasing it will result in no more significant decrease of WSS

### Assumptions
clusters are assumed to be spherical and evenly sized, something which may reduce the accuracy of the K-means clustering


## Principal Component Analysis (PCA)
The goal of PCA is to identify the most meaningful basis to re-express data.

A high SNR (≫1) indicates high precision data, while a low SNR indicates very noisy data. 